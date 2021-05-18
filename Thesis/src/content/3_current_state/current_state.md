- ## Current State/Problems of CosmoScout ##
    - ### CosmoScout Concepts ###
        - #### Control Scheme ####
            - one handed flying like google earth vr / OHF by [[Drogemuller2020]]
            - touchpad rotates around anchor
              - distance to anchor fixed
              - rotation absolute difference between old & new indicator position
            - grip rotates around observer
            - trigger allows free movement

        - #### SPICE Coordinate Systems ####
            - SPICE provided by Navigation and Ancillary Information Facility (NAIF) of the United States National 
              Aeronautics and Space Administration (NASA)
            - precise observation geometry information system originally developed to assist in planning and 
              interpreting scientific observations from space-based instruments abroad robotic planetary spacecrafts 
              [SPICEhomepage]
            - used in CSVR for precise, time-dependent positioning of celestial objects in the simulation
            - provides a set of inertial and non-inertial reference frames to position objects in the simulation
            - inertial frame: non-rotating with respect to surrounding stars, non-accelerating origin (or negligible 
              acceleration) -> J2000/ICRF (centered on the solar system's barycenter)
                - J2000 -> frame based on earth's equator & equinox (intersection of equatorial & ecliptic plane)
                    - [J2000 image]
                - ICRF (international celestial reference frame) -> frame based on measured positions of 
                  extragalactic sources
                    - less than 0.1 arc second difference to J2000 -> almost coincident
            - non-inertial frames: accelerating frames, including rotation, Body-Fixed frames for celestial objects
                - center of frame, is center of natural body (sun, planet, satellite, asteroid, etc.)
                - frame tired to a named body, and rotating with the body
                - most common named body frames hardcoded into SPICE ("IAU_bodyname")
                - rotation state determined using data published by the international astronomical union (IAU)
            - CSVR uses the nested reference frames for the scenegraph, by employing frame-local scenegraphs 
              attached to the SPICE reference frames -> multiple, quite flat frame-local scene graphs [SimonPaper]
                - internally attached to root node of the real ViSTA scene graph to allow standard graph traversal [SimonPaper]
                - observer and root nodes of frame-local scene graph can be easily moved to other reference frames, 
                  allowing for easy frame transitions during navigation [SimonPaper]
            - changing reference frame is done automatically by calculating a weight based on the distance to a body, 
              and the body's size, closer to surface = higher weight 0..1 [SimonPaper]
                - done to determine max velocity of free navigation, and frame in which position (and rotation) is 
                  tracked and applied to the observer [SimonPaper]
                - use the term frame in the concepts of navigation as the sphere of influence, where a body's weight 
                  is high enough, that the observers position is tracked in the body's reference frame -> planetary 
                  space <=> observer in J2000 -> interplanetary space
        
    - ### Identified Problems ###
        - no formal study, empirical tests & interviews to gather
        - identified several aspects that could induce or increase cybersickness incidence and severity
            - loss of orientation and onset of visually induced motion sickness symptoms during complex movements 
              during 6-DOF-navigation in interplanetary space
            - visually induced motion sickness symptoms during automatic navigation (incl. landing/starting animation)

        - ### Problems with free movement ###
            - 4-DoF Movement provides inherent stable reference frame (usually fixed plane of movement -> fixed 
              up-direction)
            - 6-DoF Movement lacks said reference frame
            - complex rotations around multiple axes, especially simultaneously easily disorient users [
              [Keshavarz2011b], [Rebenitsch2016]]
            - a stable reference frame or other points of reference usually used to help users orient themselves are 
              mostly missing in the sparse interplanetary space of the simulation
            - the current control scheme makes rotations around a single axis difficult, while intuitive to use, this 
              leads to rotations around several axes at once -> potentially increasing cybersickness risks
            - movement velocity control is sensitive (magnitude of vector from start to current pos), while the max 
              velocity is capped depending on >>anchor scale<<, still (too?) fast movements too close to surface, 
              creating high visual flow when moving along surface
            - not problems of the control scheme, as these are caveats mostly unavoidable, different control scheme that 
              allow for separate axes of rotation and velocity control are hard to implement, inconvenient, and 
              unintuitive to use with the control remotes of common VR-HDMs
              
        - ### Problems with automatic movement ###
            - current auto movement only temporary measure
            - rotation & translation at same time with ease in/out
                - images from presentation
                - simultaneous rotation and translation easily disorients users and leads to cybersickness/ visually 
                  induced motion sickness (movements similar to studies designed to visually induce motion sickness)
            - only linear motions, ignoring context
            - no collision detection or handling
                - not part of this thesis, but preparing for easier implementations/handling
            - landing animation especially difficult (complex rotation & movement) + change of reference frame, 
              rotation from forward -> downward / surface of planet as new reference frame
