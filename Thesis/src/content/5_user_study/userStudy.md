5. ## User Study ##

- determining effectiveness of mitigation techniques difficult
- no general study into cybersickness
    - goal of this study is not cybersickness itself
    - improvement/mitigation of navigation in CosmoScout VR
- objective measures inaccessible or difficult to implement
    - physiological measurements require special equipment
    - balance board for CoG require breaks in exposure for the testing
    - head dispersion using HMD IMU possible but require programming an interface to access sensor data
        - best results also require breaks in exposure for the testing
- subjective measures easier to administer
    - SSQ not suited for HMD VR
    - FMS quick & easy data acquisition
- pre-study -> fine-tune questionnaire, CoG useful?

    1. ### User Study Concept ###
        - within subject study
            - order of tasks/scenarios a confounding variable -> counter balancing
        - summative usability tests
        - independent variables: test each scenario independently => 3 test scenarios
            - floor grid
            - fov vignette
            - longer/separated automatic movement
        - dependent variables to be evaluated:
            - preference / satisfaction
            - cybersickness incidence
            - intuitiveness
            - predictability (movement only)
            - turnaround / task completion time (no movement)
        - quality criteria: priority on credibility and (internal) validity
            - credibility/authenticity: clearly define target group and main focus of study
                - target group very close to target user base, but ideally not directly affiliated with the CosmoScout 
                  project, or even unfamiliar with it
                - main focus stated above: find effectiveness of implemented solutions
            - internal validity: minimize confounding factors and standadise study process
                - stick to timing plan & create standard forms instead of interview to minimize tester influence
                - allow each subject an introduction period to get used to environment and controls
                - allow breaks in between scenarios to return subjects to baselines
            - external validity: transferability of results
                - testing environment close to field of application
                - scenarios designed close to real application
                - study and features explicitly developed to combat problems of CSVR -> transferability to other VR 
                  applications may be limited
                - some aspects of features transferable to similar applications (6-DoF-Navigations) with similar 
                  problems
            - reliability: selection and size of sample group representative for users
                - sample size based on response -> as large as possible/feasible
                - no simultaneous testing -> sample size grows with time spent for testing
                - less priority due to polysymptomatic and polygenic nature of Cybersickness

        - #### Execution Plan ####
            - record basic info about participant (-> for validity not conclusions)
                - age
                - sex
                - experience w/ VR
            - training phase to get used to control scheme
                - test subject's familiarity w/ controls / intuitiveness
                - provide a few tasks similar to free navigation test scenarios:
                    - move observer to different positions & orientations in space and on surface
                - short (2~5 min)
            - test scenarios for free navigation (4x ~10 min w/ breaks in between scenarios => <1 h w/ training phase)
                - mitigation techniques aimed at different scenarios and aspects of the simulation
                - separation of mitigation and navigation improvements into scenarios
                - navigation scenarios for free movement in space (grid) and on surface (vignette)
                    - test each scenario w/ and w/o mitigation method
                        - user moves thru simulation
                        - render next cp in simulation (~10 -> 5~10 min)
                        - [CP placement]
                - counterbalance scenarios
                - query FMS ~ 1/min during navigation (after each CP) via interface plugin
                    - interface query -> easy recording, subject more immediate answer (no verbalization & minimize 
                      influence of tester on answers)
                    - interface query w/ analog slider or 1-20 buttons
                - head dispersion / CoG measurements not during navigation -> roomscale simulation restricting user 
                  movement may influence perception
                    - measurements in between tasks possible -> but useful?
                - in addition to FMS, questionnaire feedback on method & comparison between w/ & w/o during 
                  break between every scenario couple
                    - comparative questions about preference/satisfaction, and intuitiveness/predictability on 
                      Likert scale
                    - "I prefer the original scenario over the added feature."
                    - "The feature obscured my view."
                    - "The feature made the task more difficult."
                    - "Controlling the movement/simulation was easier with the feature."
                    - feedback / comment box
                    - note suggestions/dialogue w/ subject
            - test scenarios for automatic navigation (2x <5 min w/ short breaks between movements for FMS and break 
              between old/new => <20 min)
                - automatic movement between bodies & bookmarks
                    - showcasing cases of new movement compared to old movements
                    - potentially provocative
                - FMS after each target location (~ 3-5 movements w/ & w/o -> 2~5 min)
                - questionnaire after each movement scenario on Likert scale
                    - "The navigation felt good"
                    - "The navigation is easy to predict"
                    - "The navigation is quick"
                    - feedback / comment box
                    - note suggestions/dialogue w/ subject
        
    2. ### Hypothesis ###
        
        - set of Hypotheses relating to feature acceptance and cybersickness incidence
            - H1&2: Significant (p < .05) result that new features are better than old
                - effect size between on and off data at least small (d > 0.2)
            - H3: Navigation will show the most improvement
            - H4: Floor grid will show least improvement due to the control scheme
            - H5: Vignette will show less improvement because vignette is not individualized
        - FMS not absolute values but steepness/change
            - compare w/ & w/o
            - compare cp to cp & overall trend
