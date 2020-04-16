## IVistaDeviceDriver
- base class for device drivers
- exports sensors and aspects
- realizes periodic sampling of hardware sensors

### Important Methods for Custom Drivers
#### `PreUpdate()`
is called right before `Update()`, used to realize e.g. polling requests.
Is realized independent of driver'S enable state.
Must be called by same thread as `Update()` is called from.
###### `Update()`
causes the driver to take a new snapshot of device values.
Returns `FALSE` if enabled flag is set to false.
Also determines time stamp for sensor data
#### `PostUpdate()`
is called right after `Update()` regardless of its return value, used to realize cleanup after update poll.
#### `PhysicalEnable()`
internal method to stop device from sending data/overflow when driver enabled flag is set to false.
#### `DoSensorUpdate()`
uses [Sensor Measure Protocol](#sensor-measure-protocol) to update Sensor Values.
Is called when the driver is enabled and either an update request is pending by the interaction manager or the
 threaded method detects that an update is possible.
A timestamp is used to indicate the time of the update.

### Sensor Measure Protocol
1. decode the data to store in the `VistaDeviceSensor` and determine its storage index
2. call `MeasureStart()` with the appropriate index for the sensor
3. set the data in the `VistaDeviceSensor` storage area
4. call `MeasureStop()` with the appropriate index
5. call `VistaDeviceSensor::SetUpdateTimeStamp()` on the sensor updated.

### Using Custom Device Drivers
- create driver using the factory from the plugin (?)
- query aspects for configuration
- call `IVistaDeviceDriver::Connect()`
- loop over `IVistaDeviceDriver::Update()` (somehow?)
- query sensors for new data

## `IVistaDeviceDriver`

### Update Type API
#### `eUpdateType`
Enum for the update type of the driver instance
##### `UPDATE_EXPLICIT_POLL`
updated once per frame by [interaction manager](#interaction-manager)
##### `UPDATE_CONNECTION_THREADED`
use [interaction manager](#interaction-manager)'s threaded update mechanism when there is one control connection
##### `UPDATE_CUSTOM_THREADED`
the device driver has its own update thread as an [aspect](#aspect)

#### `Connect()` / `Disconnect()`
Implement this for device setup (and shutdown).
The device should perform all initialization and feature detection up to the point where processing/measuring can be
 started right away.
Starting & stopping of actual measurement is done via [PhysicalEnable API](#physicalenable).

### Sensor Query API
Contains functions to get the total number of sensors, and find sensors by index or name.
Also contains functions to add dynamically configured sensors and remove sensors by pointer.
#### `SetupSensorHistory()`
Sets up history propertiesof a specified sensor (e.g. for asynchronous running drivers).

Params:
- [`VistaDeviceSensor`](#vistadevicesensor) - sensor to setup history for
- `int` - Maximum time any reader on the history is accessing the history.
- `int` - Maximum number of slots to read within the access time frame.
