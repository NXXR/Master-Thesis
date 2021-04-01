1. ## Floor Grid ##
    1. ### Stable Reference Frames ###
        - countermeasure based on rest frame theory (-> and postural stability) and sensory conflict
        - [[Duh2001b]] used a static grid overlay and found that it improved symptom ratings
        - [[Chang2013]] used grid lines and found the Total SSQ score was significantly lower than without
        - alternative: [[Prothero1997]] experimented with partially occluded HMD, turning VR towards AR, resulting 
          in lower SSQ scores
        - increasing realism and orientation cues also frequently increase sickness symptoms
        - [[Kemeny2017]] note, an underlying grid as a fixed reference frame helps users to better understand the 
          performed rotation and creates a "Pseudo AR Mode"
        - [[Kato2008]] proposed a superimposed grid on in-vehicle displays to mitigate the sensory conflict and 
          reduce carsickness
        - providing a stable simulated reference frame as suggested in [[Clifton2020]]
        
    2. ### Floor Grid Implementation ###
        - packaged in vr-accessibility plugin
        - rendering a quad static to the observer's position and gui elements
            - grid static to the room and gui allowing for free head movement and walking within the roomscale of the VR
        - quad is connected via transform node to the Display node in the scenegraph (same as GUI)
            - transform node contains the vertical offset (adjustable from the observer to the real floor)
        - quad is sized by a defined value and textured with a semi-transparent grid texture (center square or cross)
        - Shader code frag?
        - the grid fades after a few meters based on the blend function & texture transparency, without aliasing or 
          "grey horizon" 
        - Options to individually adjust the grid as needed:
            - Mesh size (coarseness)
            - Y offset to adjust to real world floor/user height
            - [x] Falloff, size of the quad (fades into the distance automatically because of the OpenGL blend function)
            - grid opacity (alpha value)
            - grid color
