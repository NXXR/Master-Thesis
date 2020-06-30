# NAIF Reference Frames and Coordinate Systems in SPICE Context


## Reference Frame
> Specified by an ordered set of three mutually orthogonal, possibly time dependent, unit-length direction vectors
> [[1]](#1)
- reference frame's center must be SPICE ephemeris object whose location is the origin (0, 0, 0) of the frame [[1]](#1)
- Frame Classes:
    - Inertial Frames:
        - center must always be solar system barycenter
        - Non-rotating with respect to stars
        - Non-accelerating origin (typically non-zero velocity, but negligible acceleration)
        - **J2000 / EME 2000** (actually **ICRF**)
            > **International Celestial Reference Frame (ICRF)** creates a quasi-inertial frame of reference centered at
              the barycenter of the solar system, whose axes are defined by the measured positions of extragalactic
              sources (mainly quasars). [[3]](#3)
    - Non-Inertial Frames:
        - Accelerating, including by rotation
        - Body-Fixed Frames (PCK/SPK):
            - center of frame is the center of a natural body (sun, planet, satellite, comet, asteroid)
            - center location specified by SPK or PCK file [[2]](#2)
        - [Topocentric](#topocentric-coordinate-system) Frames (associated with an object on or near the surface of a natural body)
        - Spacecraft (main structure "bus")
        - Instrument
            - usually instruments have one or more frames associated (also applicable to spaceraft antenna, solar
             array etc.)
        - Dynamic
            - special family of SPICE unique frames
            - time-dependent orientation (does not include frames where orientation is provided using a CK/PCK)

##### State and Orientation Data
> State data contains position and velocity.
- Reference frame center relevant in specification of states. [[1]](#1)
    - origin cancels out when doing vector substraction, but is used in computing light time to centers of non-inertial
      frames. [[1]](#1)
> Orientation data contains pointing vector.
> [[1]](#1)


## Glossary

#### Topocentric Coordinate System
Celestial coordinate system that uses the observer's local horizon as the fundamental plane. Coordinates of an object
 are expressed in altitude angle and azimuth. [[4]](#4)
![](https://upload.wikimedia.org/wikipedia/commons/f/f7/Azimuth-Altitude_schematic.svg)

---
### Sources
######1
[NAIF SPICE Tutorial](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/Tutorials/pdf/individual_docs/17_frames_and_coordinate_systems.pdf)
######2
[SPICE Appendix: Reference Frames](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/frames.html)
######3
[Wikipedia: International Celestial Reference Frame](https://en.wikipedia.org/wiki/International_Celestial_Reference_Frame)
######4
[Wikipedia: Horizontal Coordinate System](https://en.wikipedia.org/wiki/Horizontal_coordinate_system)
