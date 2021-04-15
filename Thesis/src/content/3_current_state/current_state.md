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
        - #### OGL & Scenegraph? ####
        
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
