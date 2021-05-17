3. ### CosmoScout VR ###
   
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
