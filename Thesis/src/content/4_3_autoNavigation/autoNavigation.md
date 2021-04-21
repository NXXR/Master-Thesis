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
