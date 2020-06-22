- gamepad_standardinput.xml needs "LatestUpdate[int]" ~~and "LatestUpdate[VistaTransformMatrix]"~~ to be added to vista
/VistaCoreLibs/VistaDataFlowNet/VdfnNodeCreators.cpp

- sticky buttons issue seems to be based on vrpn server or vista dfn implementation problems, no fix or solution has
 been found of attempted by me
 
- LatestUpdate Nodes initialize with the value from the first port
    - no documentation how port order is determined
    - initial (order of edge declaration) worked before multiplier
    - 1 (~~alphabetical order~~) works after multiplier implementation (wouldn't have worked before multiplier)

- Things to do to run:
```
cd .\install\windows-externals-release\bin\

echo vrpn_Microsoft_Controller_Raw_Xbox_360 microsoft0 \n vrpn_XInputGamepad XInput0 0 > vrpn.cfg

.\vrpn_server.exe
```

```
vrpn_Microsoft_controller_Raw_Xbox_360 [_Wireless]
```
