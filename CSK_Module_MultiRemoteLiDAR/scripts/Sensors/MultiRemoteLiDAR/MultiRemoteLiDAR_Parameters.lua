---@diagnostic disable: redundant-parameter, undefined-global

--***************************************************************
-- Inside of this script, you will find the relevant parameters
-- for this module and its default values
--***************************************************************

local functions = {}

local function getParameters()

  local multiRemoteLiDARParameters = {}

  multiRemoteLiDARParameters.flowConfigPriority = CSK_FlowConfig ~= nil or false -- Status if FlowConfig should have priority for FlowConfig relevant configurations
  multiRemoteLiDARParameters.interface = 'ETHERNET' -- Interface connection type to the sensor
  multiRemoteLiDARParameters.ipAddress = '192.168.1.100' -- IP of the LiDAR sensor (must be set individually)
  multiRemoteLiDARParameters.sensorType = 'LMSX00' --'LMSX00' -- LiDAR type
  multiRemoteLiDARParameters.processingFile = 'CSK_MultiRemoteLiDAR_Processing' -- which file to use for processing (will be started in own thread)
  multiRemoteLiDARParameters.internalProcessing = true -- should incoming scans be processed within this module or just provided for others
  multiRemoteLiDARParameters.viewerType = 'PointCloud' -- 'Scan' / 'PointCloud' - type of viewer to show data
  multiRemoteLiDARParameters.viewerActive = true -- Should the scan be shown in viewer
  multiRemoteLiDARParameters.encoderMode = false -- Combine scan data with encoder data to create point cloud
  multiRemoteLiDARParameters.encoderTriggerEvent = '' -- Event to start the encoder scan measurement
  multiRemoteLiDARParameters.encoderModeLoop = false -- Should it retrigger the encoder measurement automatically
  multiRemoteLiDARParameters.encoderDurationMode = 'TICKS' -- Encoder duration mode 'TICKS' (maybe add in future 'DISTANCE', 'TIME', 'CONVEYOR_TIMEOUT')
  multiRemoteLiDARParameters.encoderDurationModeValue = 200 -- Related to encoderDurationMode, value to determine how long LiDAR data should be collected combined with encoder data before providing PointCloud

  return multiRemoteLiDARParameters
end
functions.getParameters = getParameters

return functions