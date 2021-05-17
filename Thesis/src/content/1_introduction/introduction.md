1. ## Introduction ##

    - advances in motion tracking & public interest in stereoscopic 3D entertainment renewed development efforts in 
      VR & AR
    - main problem after advancing hardware limitations still cybersickness (for VR)
        - root causes of cybersickness not fully uncovered, several different theories
            - Sensory conflict theory, sensory information from visuals clash with somatosensory system and cause 
              symptoms similar to motion sickness
            - Postural instability theory, reference frame & VR exposure lead to increased postural instability 
              resulting in symptoms
        - measuring symptoms difficult, subjective measurements mostly used
            - cybersickness polysymptomatic & polygenic
            - several Questionnaires to assess symptoms, most popular: SSQ, based on older questionnaire for 
              simulator sickness experienced in flight simulators used by military
                - several other questionnaires based on same data, focused more on civilian application
                - Pro: widely used measurement, different scales to separate symptoms into several categories -> 
                  discriminate problems
                - Con: only comparative measure for other simulators, no general assessment, but problem locator, 
                  comparing to small simulator sample size & trained professionals responses yield less insightful 
                  data for civilian use
            - FMS & other single-item questionnaires -> different direction:
                - just measure symptom severity/incidence w/o trying to separate/spilt into root symptoms
                - Pro: easy to administer, data acquisition during exposure instead of before/after
                - Con: no insight into makeup of polysymptomatic cause -> no discrimination between root causes
        - objective measures sought to make cybersickness study more reliable -> add physiological basis to 
          subjective data
            - several physiological measures found to correlate to subjective measures indicating symptoms, most 
              reliable: electrogastrogram (EGG), electrocardiogram (ECG), respiration measurements (rate & sinus 
              arrhythmia)
                - Pro: objective indicators for sickness symptoms, continuous data acquisition during exposure
                - Con: no widespread use due to inaccessible equipment, difficult data evaluation, only symptom indicator
            - COG / head dispersion as objective measurement, using postural instability to signal symptoms
                - Pro: more accessible than other objective measurements, easier to evaluate
                - Con: no continuous data, stance/no movement needed to acquire data (movements small -> difficult 
                  to separate from noise/confounding factors)
        - several popular solutions to reduce symptoms:
            - general best practices, adaption time for new users, avoid unrealistic movement, avoid disorienting, 
              unpredictable or complex movements
            - Limit FoV -> decrease peripheral visual flow -> less "vection"
            - provide stable reference frame -> provide stable reference for up direction, aiding with postural 
              instability due to difference in perceived and real up-direction
    - Goal of this study: develop features to reduce and mitigate motion sickness for users in the CosmoScout VR 
      application
        - CSVR modular, scientific visualisation of the solar system, to allow for immersive exploratory research on 
          large datasets
        - free and automatic navigation experienced to cause symptoms in users
        - several features developed to tackle specific aspects of the simulation and provide suited and 
          customisable tools for users to combat and reduce cybersickness as a deterring factor during exposure
        - separation into 2 main cases: free 6-DoF-Movement, and automatic navigation -> cybersickness likely has 
          different causes
            - free navigation: symptoms caused by disorientation, missing reference frame in space, or vection on 
              surface
            - automatic navigation: symptoms caused by complex movements disorienting user
        - several solutions implemented to combat these aspects:
            - provide stable frame of reference to free movements in space by displaying a grid coinciding with the 
              real floor, providing a stable frame of reference during 6-DoF movements through space without references
            - develop FoV-vignetting for movements on or close to a body's surface -> grid less useful, as body 
              surface used as reference frame, reducing peripheral visual flow to decrease vection
            - rework automatic navigation to make movements more predictable and less disorienting
                - mainly, separating rotation and translation to reduce complexity of movement
                - split movement into stages depending on origin and target of navigation to classify any movements 
                  into general scenarios that are flexible, but reliable to avoid movements that are too provocative 
                  for the user
    - verify developed features by designing a user study to evaluate the effectiveness of the features in a further 
      work
        - compare developed features to initial situation in several scenarios involving free and automatic 
          navigation tasks
        - measure subject's symptoms and satisfaction with subjective and objective measurements
            - FMS single-item questionnaire to assess symptoms during exposure, questionnaire to measure subject's 
              satisfaction/preference, objective measurement to correlate and base/validate FMS scores
            - test developed features independently -> features address different aspects/situations of 
              cybersickness during use of CSVR
        - estimate, automatic navigation will show most improvement, initial case created noticeable discomfort, 
          most straightforward solutions
        - grid and vignette less obvious solutions
            - grid more effective w/ different/adjusted control scheme & generally less noticeable symptoms in 
              interplanetary space
            - vignette more individual, customisation may be required
