# Changelog
All notable changes to this project will be documented in this file.

## Release 0.5.0

### New features
- Check if persistent data to load provides all relevant parameters. Otherwise add default values
- Supports FlowConfig feature
- Provide version of module via 'OnNewStatusModuleVersion'
- Function 'getParameters' to provide PersistentData parameters
- Check if features of module can be used on device and provide this via 'OnNewStatusModuleIsActive' event / 'getStatusModuleActive' function
- Function to 'resetModule' to default setup

### Improvements
- New UI design available (e.g. selectable via CSK_Module_PersistentData v4.1.0 or higher), see 'OnNewStatusCSKStyle'
- check if instance exists if selected
- 'loadParameters' returns its success
- 'sendParameters' can control if sent data should be saved directly by CSK_Module_PersistentData
- Changed log level of some messages from 'info' to 'fine'
- Added UI icon and browser tab information

### Bugfix
- Legacy bindings of ValueDisplay elements within UI did not work if deployed with VS Code AppSpace SDK
- UI differs if deployed via Appstudio or VS Code AppSpace SDK
- Fullscreen icon of iFrame was visible

## Release 0.4.0

### Improvements
- Renamed abbreviations (Lidar - LiDAR, Id-ID, Ip-IP)
- Using recursive helper functions to convert Container <-> Lua table

## Release 0.3.0

### Improvements
- Update to EmmyLua annotations
- Usage of lua diagnostics
- Documentation updates

## Release 0.2.0

### New features
- "setEncoderMode" and additional features / events to merge incoming scanner data with encoder data
- Configure if viewer of module should show content or not ("setViewerActive")
- Check if APIs are available on device

### Improvements
- Loading only required APIs ('LuaLoadAllEngineAPI = false') -> less time for GC needed
- Docu updates

## Release 0.1.0
- Initial commit