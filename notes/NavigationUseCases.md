# Navigation Use-Cases

## Origins & Targets
- different locations
    - relative to surface (relative to Spice Planet Center & Frame)
    - relative to orbit (relative to Spice Planet Center)
    - relative to system (relative to Spice Barycenter)
    - bookmarked position
        - different levels of specification:
            - general position
            - specific position
            - specific position & orientation
- different time

## Navigation Scenarios
- same planet
    - surface-surface
    - surface-orbit / orbit-surface
    - orbit-orbit
- different planet
    - surface-surface
    - surface-orbit
    - orbit-surface
    - orbit-orbit
- free positions
    - surface-position
    - position-surface
    - orbit-position
    - position-orbit
    - position-position
- different point in time
    - timepoint-timepoint (same position forward/backward)
    - combined w/ above navigation scenarios

## Unified Navigation Use Cases

|                                   | **Point on Surface** | **Point in Orbit** | **Point on Satellite** | **Point in Satellite Orbit** | **Point in Interplanetary Space** |
|-----------------------------------|----------------------|--------------------|------------------------|------------------------------|-----------------------------------|
| **Point on Surface**              | | | | | |
| **Point in Orbit**                | | | | | |
| **Point on Satellite**            | | | | | |
| **Point in Satellite Orbit**      | | | | | |
| **Point in Interplanetary Space** | | | | | |

### Stages:
- Surface to Orbit
- Orbit to Binary System (Satellite & Planet)
- Orbit/Binary System to Solar System

### Main Problem:
- Free Points in interplanetary space
  1. Framing both objects:
    - orbit origin to frame origin and target
    - switch focus from origin to target
    - orbit target to avoid origin and zoom to target orbit
  2. Finding binary system:
    - consider origin a satellite of target
    - find center of binary system
    - orbit center from origin to target
      - high lateral movement may cause issues
      - paired with a zoom-out (maybe highlight of origin & target) may enhance "simulation feeling"

### Proposed Solution:
- Surface to Orbit:
  1. focus on surface point in front of user
  2. move backwards in a parabola path
  3. zoom out until orbit distance is reached (based on origin object size)
- Movement between 2 Objects:
  1. zoom out to orbit distance
  2. rotate to (roughly) align origin and target
  3. focus center of binary system
  3.1 rotate slightly to bring both objects into unobscured frame
  4. focus target center
  4.1 zoom to orbit distance to target

### Special Cases:
- Jupiter Moons
- surface to surface parabola movement
- surface to other w/ look-at horizon

## Phases:
1. find/look-at target
2. go-to target
3. adjust view at target
