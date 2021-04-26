- ## Automatic Movement Overhaul ##
    1. ### Concept ###
        - decoupling translation and rotation
            - reduce complexity and enhance readability of movements
        - instead of linear movements use splines
            - able to cover different movements with on spline
            - able to adjust movement paths by inserting control points (for collision handling)
        - origin & target locations ca be arbitrary points in space (bookmarks or generated)
        - classification to provide a small amount of use cases and unified movement
            - user can get used to "same" movements / structure
        - 3 different location classifications:
            - close to / on surface (position relative to body center & frame)
            - orbit (position relative to body center & frame)
            - interplanetary (position relative to barycenter / J2000 frame)
                - interplanetary positions without body (center & frame) rare -> even small objects have their own 
                  frame and therefore position "in orbit" for the bookmark
        - results in 3 areas of movement + transitions between them
            - surface movement
            - orbital movement
            - (interplanetary movement)
            - surface <-> orbit transition (ascending/descending)
            - orbit <-> (interplanetary) [move target into view part of o2o]
            - surface <-> interplanetary does not exist -> transition via orbit  
            - |       | surf | orb | inter |
              |-------|------|-----|-------|
              | surf  | s2s  | asc |   -   |
              | orb   | desc | o2o | (o2o) |
              | inter |  -   |(o2o)| (o2o) |
        - movement between origin and target in steps according to both locations
            - i.e. origin surface -> transition to orbit -> transition ot other body -> orbit movement to specific 
              point in orbit -> transition to point on surface
        
        1. #### Surface Movements ####
            - universal solution: ascend to orbit, move in orbit, and descend to target
            - may be inconvenient for short movement
            - focused on orbital and interplanetary movements not surface
                - navigation not sole purpose of thesis
                - interplanetary movements seem more pressing
                - hard to test specific solutions for short distances or their effects b/c no datasets for street 
                  level in home office
            - #### Transition to Orbit #####
                - descend/ascend along a curve, always moving the user forwards/backwards, never down/up
                - use parabola like curve to "swoop" down from orbit into target position from behind
                    - keep a point in the direction of the final orientation always at the center of the view to 
                      give user view of the end point of the movement and end in the specified final position and 
                      orientation
                - ascend similar but backward to give the user a sensation of zooming out into an orbital view
                - not explicit, but essentially decoupled translation and rotation, since the majority of rotation 
                  is at the very end of the movement where the curvature is highest
        2. #### Orbit Movements ####
            - movement in orbit in equidistant circular curves w/ body center always in the center of the view
                - distance to body relative to body size => body is always the same size relative to Viewport
                - results in visual effect of turning the planet and simulation instead of moving the observer
            - ##### Transition between Bodies / Interplanetary #####
                - decouple translation and rotation
                - move in orbit of origin so that target is in view but not obscured by body
                    - [angle images]
                - change focus -> rotate so that center of view is on target center (from origin center)
                - move straight forward past origin to target orbit
    
    2. ### Implementation ###
        - old movement animation:
            - _moveTo_ method uses parameter information about origin, target, and duration
            - constructs two _AnimatedValue_ objects, which use start and end state and time to return an 
              interpolated value in between, relative to the time parameter passed, and the start and end time
            - 1 object for the interpolated translational position and 1 object for the interpolated rotational 
              orientation
            - _moveTo_ method fills objects with info, _updateMovementAnimation_ uses current time to poll both 
              objects for the state of translation and rotation each frame while _mAnimationInProgress_ flag is set
        - ensure backwards compatibility => keep original _moveTo_ method of observer & slightly modify it
            - is also method used for interplanetary travel as movements are almost the same
            - linear motion from origin to target
            - replaced interpolation between origin and target by using the t parameter along a linear spline 
              between origin and target
            - separated the rotation from the translation by modifying the start & end time parameters of the 
              _animatedValue_ object
                - add code to modify the duration of rotation relative to the difference between the origin and 
                  target direction
                    - split overall duration into 3 (t_start + t_move + t_final = t_dur)
                    - t_start & t_final, weighted depending on the angular difference (0 < t_start, t_final < 1/3 t_dur)
                    - t_move, takes up rest of duration (1/3 t_dur < t_move < t_dur)
            - split the rotation into 2 parts:
                - initial rotation from origin orientation onto _mLookAtPoint_ (i.e. movement direction for spline 
                  before movement)
                    - _mLookAtPoint_ added as a point the observer is focusing on during translative phase of movement
                - final rotation from movement direction onto final orientation after movement
        - modification of _updateMovementAnimation_ necessary to adjust for split rotation and spline
        - stop simulation time during movement -> easier to handle movement, prevents rotating target frame moving 
          observer's origin position (at beginning of movement, observer position is transformed into target frame)
        
        - #### _updateMovementAnimation_ changes ####
            - instead of polling translation interpolation -> poll interpolation of t value over time
            - [codeblock updateMovementAnimation]
                - if current time before end of initial rotation -> poll current orientation from initial rotation 
                  interpolation
                - if current time after start of final rotation -> poll current orientation from final rotation 
                  interpolation
                - if in between -> use provided _mLookAtPoint_ to calculate orientation to focus on point

        - #### Movement packages ####
            - based on changes to update function all movement methods must consist of, and provide following 
              information:
                - movement spline & animated value to interpolate t parameter along spline
                - initial rotation from origin orientation to _mLookAtPoint_
                - _mLookAtPoint_ to focus on during translation (including _mUpDirection_ for definitive orientation to 
                  avoid random rolling)
                - final rotation from LookAtPoint-direction to final orientation
            - any _moveTo_ method must provide these parameters -> movements always consist of initial rotation, 
              then translation with some point focused in the center of the viewport, and a final rotation into the 
              final orientation

        - #### different _moveTo_ methods and control point computation ####
            - Uniform Cubic Basis Splines chosen:
                - advantages:
                    - similar to bezier curves
                    - easy to construct
                    - control points have local influence on curve (-> reduced effect of added CP for overall curve)
                    - continuous curvature
                - disadvantages:
                    - interpolated curve not necessarily passes thru specified control points
                        - harder for collision mitigation, but can be circumvented by adding triplet of control 
                          points forming a tangent
                    - requires additional point at start and end of cp list that will not be interpolated (spline 
                      starts in second cp and ends in penultimate cp)
            - interplanetary movement uses above mentioned linear _moveTo_ method
                - spline is constructed between origin and target using 2 triplets of control points:
                    - vector between origin and target is calculated and normalized
                    - each tripled consists of the origin or target point, 1 point "in front", and 1 point "behind" 
                      in direction of the origin-target vector
                    - triplet forming the tangent in direction of vector at start and end point of spline
                - LookAtPoint is set to the last control point -> "in front" of ot-vector in travel direction
                    - observer always focuses on the end point of the movement
                - Up-direction is saved from the up direction at the origin location -> no rolling during 
                  translation
                - initial rotation set up to interpolate between origin orientation and orientation towards the end of 
                  spline (LookAtPoint)
                - final rotation set up to interpolate between orientation towards the LookAtPoint and the target 
                  orientation
            - orbital movement uses a different _moveTo_ method to fill the objects necessary for the 
              _updateMovementAnimation_
                - spline between origin and target should approximate circular arc between both points:
                    - project start & end point onto 2d plane by finding the normal to the plane between 
                      center-origin and center-target vectors
                    - also leads to the shortest possible angle (path) between origin & target
                    - calculate angle between origin and target and calculate control points according to [[Poxmax]] 
                      on unit circle
                    - calculate angle between control points and center-orgin/center-target vectors -> use angle and 
                      magnitude to project control points back into 3d space by rotating c-o/c-t vectors around 
                      plane normal & scale by magnitude
                        - different heights in origin/target location lead to less circular curves -> light zoom 
                          effect during rotation of body
                        - triplets for both start & end point, tangent length leading to circular curve
                        - longer c-o/c-t distances move whole triplet -> curve becomes more elliptical
                - LookAtpoint is set to the center of the current body/frame
                - Up-direction saved from up at origin -> no rolling
                - initial rotation set to interpolate between origin orientation and orientation towards the center 
                  (LookAtPoint)
                - final rotation set to interpolate between orientation towards the center and the target orientation
    
        - #### Movement Queue ####
            - add Queue for the transitions, and future, potentially complex movements and routes
            - package parameters for _moveTo_-functions into structs
            - add a queue fillable with these structs (FIFO because context sensitive -> order important)
            - at the end of a movement animation _updateMovementAnimation_ checks if the queue is empty
                - if not empty, next struct is popped and _moveTo_ is called with the struct/parameters inside
            - [moveTo(queue) code segment]
            - add moveTo function to receive fully prepared queue -> other/future components of CS can calculate and 
              compile queue of movements and hand it to the CelestialObserver class to execute each movement in the 
              queue
                - calling _moveTo_ during a movement, discards the elements of the current queue and puts the new 
                  queue in place
                - no adding to the queue to preserver current navigation, preventing buffering of multiple, 
                  potentially unwanted movements
