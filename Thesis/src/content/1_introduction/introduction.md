1. ## Introduction ##
    1. ### Virtual Reality ###
        - interactive, immersive, realistic, 3D computer simulated world around the user
        - able to generate compelling feelings of presence -> immersive VR distinguished from other forms of media
            - user interface as a synthetic world, the user can interact with and navigate as if they were in the 
              real world [Davis2014]
            - immerse a person in an environment that allows natural interaction and participation in order to 
              perform tasks
        - virtual environments were described as early as 1965 by Ivan E. Sutherland
            - also created what is widely believed to be the first head-mounted display [Sutherland1968]
        - continuous effort to improve tools for inspecting and interacting w/ virtual environments over the last 50 
          yrs [Weech2019]
            - increased recent emergence through improved position tracking (Wii/Kinect/etc.)
        - various devices and technologies to experience virtual reality
            - Computer Automatic/Aided Virtual Environment (CAVE), multiple projected images in a room, viewed through 
              stereoscopic glasses
            - Head-mounted Displays (HMDs) recently more affordable, consumer-friendly
                - widespread interest from media and general population
        - spectrum of Virtual Environments [Milgram]
        
        - Stereoscopic display the main feature of VR tech
            - providing left and right eye with offset views imitating real world stereoscopic view
            - different methods to achieve this:
                - passive, polarizing filters to ensure each eye only sees the intended images
                - active, "shutter-glasses" turning lenses opaque using a timing signal to ensure each eye only sees 
                  the intended images
                - dedicated displays for each eye
        - VR providing a new style of (intuitive) human-computer interface, with the primary goal to increase 
          communication bandwidth between human and computer [Davis2014]
        - VR to train individuals in tasks too difficult, dangerous, or expensive to be conducted in the real world
        - VR in medical treatments to treat anxiety disorders (phobias & PTSD) [Clifton2019]
        - utilized in different domains for visualisation and intuitive interfaces
            - healthcare, construction, architecture

    2. ### CosmoScout VR ###
        - CosmoScout VR -> modular 3D solar system visualisation for interactive & immersive exploration of large 
          datasets
        - earth observation & space exploration produce vast amounts of data
        - visualisation of this data at divers scales offers potential for scientific discovery
            - natural, intuitive interfaces to interact with this data visualisation allow for explorative analysis 
              of the vast data
        - HTML-based user interface -> high flexibility for new features/modules & customisation
        - SPICE-based scenegraph for high precision in the simulation independent of scale
        - HDR renderer for realistic images, increasing immersion in the virtual environment
        - layered architecture
            - based on several external dependencies (ViSTA, SPICE, ...)
            - five core libraries for basic functionalities
            - the basic executable and plugins that provide main functionality
            - configuration for specific use cases thru settings files
       
    3. ### Scope of the study ###
