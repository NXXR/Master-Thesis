1. What is CosmoScout VR?
2. What are the problems I am trying to fix?
    - gif/videos of some use cases
    - free movement in interplanetary space w/o stable frame of reference
    - automatic movement between Planets & landing animation
3. What are causes of motion sickness?
    - sensory conflict theory
    - postural instability theory
    - high detail and high movement in peripheral view
4. What am I doing/planning to remedy this? ->
5. Distinction between free and automatic movement, interplanetary and surface movement
    1. interplanetary movement
        - Floor Grid
            - to provide a stable simulated frame of reference (vs. postural instability & sensory conflict)
            - to change interaction context (vs. sensory conflict)
        - Automatic Movement
            - decouple rotation and rotate to target before movement
    2. surface movement
        - FoV Vignette
            - to focus user on view & moving center/direction (vs. high detail & movement in peripheral view)
        - Automatic Movement
            - depending on view direction and distance to Target
                - google maps like zoom out and pan for most distances
                - parabola ascend/descent for moving to/from orbit on large distances
                - straight movement to orbit if user view above horizon
6. [OPT] Collision detection & mitigation not considered at this point
    - implementing automatic movement as curves so future collision handling can modify the path by inserting 
      control points
    - parametric curves allow to easily detect collision along the path before moving the observer
    - interplanetary movement linear -> detect collision, insert control point to bend curve around object
    - surface movement parabola/curve -> detect collision, increase height of curve or insert control point to 
      increase steepness
6. User Study
7. Further plans for the thesis
    - implement automatic navigation
    - user survey to quantify improvement
8. Feedback/Questions
    * ***write down any questions to implement/insert into thesis/presentation***

- video/gif problematic, maybe screenshots
    - diagram of automatic movement + frames
