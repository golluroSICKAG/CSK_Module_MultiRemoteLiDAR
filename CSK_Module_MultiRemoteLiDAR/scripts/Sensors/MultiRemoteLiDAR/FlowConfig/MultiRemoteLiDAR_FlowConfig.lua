-- Include all relevant FlowConfig scripts

--*****************************************************************
-- Here you will find all the required content to provide specific
-- features of this module via the 'CSK FlowConfig'.
--*****************************************************************

require('Sensors.MultiRemoteLiDAR.FlowConfig.MultiRemoteLiDAR_OnNewScan')
require('Sensors.MultiRemoteLiDAR.FlowConfig.MultiRemoteLiDAR_EncoderSource')

--- Function to react if FlowConfig was updated
local function handleOnClearOldFlow()
  if _G.availableAPIs.default and _G.availableAPIs.scanner then
    CSK_MultiRemoteLiDAR.clearFlowConfigRelevantConfiguration()
  end
end
Script.register('CSK_FlowConfig.OnClearOldFlow', handleOnClearOldFlow)