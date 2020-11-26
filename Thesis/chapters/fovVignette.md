- decreasing/limiting FoV proven (most common method) to reduce cybersickness risks and symptoms
 [\[1,](#source-1)[2\]](#source-2)
- sickness risks higher with high detail/movement/activity in peripheral vision [citation needed]()
- decided to implement a FoV Vignette as a limiting device on movement w/ high peripheral detail
- mainly planned for close to a planet's surface (mainly for free movement), as peripheral detail is low when moving
 in interplanetary space
- the vignette is implemented as a post processing shader, drawing a 2D postprocessing effect over the rendered scene
 based on several factors
- the vignette is determined by an adjustable inner and outer radius
  - inner radius determines the maximum distance from the center, where clear fov is guaranteed
  - outer radius determined the minimum distance from the center, where the screen is fully opaque and set to a
   custom color
  - the area between the inner and the outer radius consists of a gradient, blending between the scene (transparent)
   and the custom color of the opaque area starting from the outer radius
  - the inner, and outer radius, as well as the color of the vignette are customizable in the settings
- as the main risk of sickness, the vignette is supposed to prevent, occurs during movement (high peripheral activity),
 and [[2](#source-2)] has shown that limiting the fov also has a negative effect on presence, the vignette is only
 used and displayed during movements above a speed threshold (adjustable)
  - the vignette also uses an adjustable deadzone (amount of time past the threshold) before displaying the vignette
   to avoid "flickering" the vignette on short, quick movements, or movements close to the threshold, which would
   irritate the user and may cause more severe symptoms or injuries (e.g. photosensitive users)
- on passing the threshold (and deadzone), the vignette is eased in/out by a fade animation (duration adjustable) to
 make the transition to the limited fov more comfortable and less noticeable

###### source 1
*Duh HB-l et al*
[
Effects of field of view on balance in an immersive environment
](https://www.cs.uic.edu/~kenyon/Conferences/ieee_e1.pdf)

###### source 2
*Lin JJ-W et al*
[
Effects of field of view on presence, enjoyment, memory, and simulator sickness in a virtual environment
](https://ieeexplore.ieee.org/abstract/document/996519)
