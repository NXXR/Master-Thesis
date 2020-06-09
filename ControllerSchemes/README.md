- gamepad_standardinput.xml needs "LatestUpdate[int]" to be added to vista/VistaCoreLibs/VistaDataFlowNet
/VdfnNodeCreators.cpp

- sticky buttons issue seems to be based on vrpn server or vista dfn implementation problems, no fix or solution has
 been found of attempted by me
 
- LatestUpdate Nodes initialize with the value from the first port
    - no documentation how port order is determined
    - initial (order of edge declaration) worked before multiplier
    - 1 (~~alphabetical order~~) works after multiplier implementation (wouldn't have worked before multiplier)
