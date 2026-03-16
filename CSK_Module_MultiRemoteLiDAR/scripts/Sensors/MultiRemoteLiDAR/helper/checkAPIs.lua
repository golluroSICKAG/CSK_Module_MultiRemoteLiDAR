---@diagnostic disable: undefined-global, redundant-parameter, missing-parameter

-- Load all relevant APIs for this module
--**************************************************************************

local availableAPIs = {}

-- Function to load all default APIs
local function loadAPIs()
  CSK_MultiRemoteLiDAR = require 'API.CSK_MultiRemoteLiDAR'

  Log = require 'API.Log'
  Log.Handler = require 'API.Log.Handler'
  Log.SharedLogger = require 'API.Log.SharedLogger'

  Container = require 'API.Container'
  Engine = require 'API.Engine'
  Object = require 'API.Object'
  Timer = require 'API.Timer'

  -- Check if related CSK modules are available to be used
  local appList = Engine.listApps()
  for i = 1, #appList do
    if appList[i] == 'CSK_Module_PersistentData' then
      CSK_PersistentData = require 'API.CSK_PersistentData'
    elseif appList[i] == 'CSK_Module_UserManagement' then
      CSK_UserManagement = require 'API.CSK_UserManagement'
    elseif appList[i] == 'CSK_Module_FlowConfig' then
      CSK_FlowConfig = require 'API.CSK_FlowConfig'
    end
  end
end

-- Function to load specific scanner APIs
local function loadScannerAPIs()
  -- If you want to check for specific APIs/functions supported on the device the module is running, place relevant APIs here
  -- e.g.:
  PointCloud = require 'API.PointCloud'
  PointCloud.Collector = require 'API.PointCloud.Collector'
  Scan = require 'API.Scan'
  Scan.Provider = {}
  Scan.Provider.RemoteScanner = require 'API.Scan.Provider.RemoteScanner'
  Scan.Transform = require 'API.Scan.Transform'
  View = require 'API.View'
  View.PointCloudDecoration = require 'API.View.PointCloudDecoration'
  View.ScanDecoration = require 'API.View.ScanDecoration'
end

-- Function to load specific encoder APIs
local function loadEncoderAPIs()
  -- If you want to check for specific APIs/functions supported on the device the module is running, place relevant APIs here
  -- e.g.:
  CSK_Encoder = require 'API.CSK_Encoder'
  Encoder = require 'API.Encoder'
end

availableAPIs.default = xpcall(loadAPIs, debug.traceback) -- TRUE if all default APIs were loaded correctly
availableAPIs.scanner = xpcall(loadScannerAPIs, debug.traceback) -- TRUE if all scan specific APIs were loaded correctly
availableAPIs.encoder = xpcall(loadEncoderAPIs, debug.traceback) -- TRUE if all encoder feature specific APIs were loaded correctly

return availableAPIs
--**************************************************************************