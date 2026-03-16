-- Block namespace
local BLOCK_NAMESPACE = 'MultiRemoteLiDAR_FC.EncoderSource'
local nameOfModule = 'CSK_MultiRemoteLiDAR'

--*************************************************************
--*************************************************************

-- Required to keep track of already allocated resource
local instanceTable = {}

local function setEncoderSource(handle, encoder, trigger)

  local instance = Container.get(handle, 'Instance')

  -- Check if amount of instances is valid
  -- if not: add multiple additional instances
  while true do
    local amount = CSK_MultiRemoteLiDAR.getInstancesAmount()
    if amount < instance then
      CSK_MultiRemoteLiDAR.addInstance()
    else
      CSK_MultiRemoteLiDAR.setSelectedInstance(instance)

      local check = string.find(encoder, 'HANDLE_ENC')
      if check then
        CSK_MultiRemoteLiDAR.setEncoderMode(true)
        if trigger then
          CSK_MultiRemoteLiDAR.setEncoderTriggerEvent(trigger)
        end
      else
        _G.logger:warning("Not able to set encoder")
        break
      end
      break
    end
  end
end
Script.serveFunction(BLOCK_NAMESPACE .. '.encoderSource', setEncoderSource)

--*************************************************************
--*************************************************************

local function create(instance)

  -- Check if same instance is already configured
  if instance < 1 or nil ~= instanceTable[instance] then
    _G.logger:warning(nameOfModule .. ': Instance invalid or already in use, please choose another one')
    return nil
  else
    -- Otherwise create handle and store the restriced resource
    local handle = Container.create()
    instanceTable[instance] = instance
    Container.add(handle, 'Instance', instance)
    return handle
  end
end
Script.serveFunction(BLOCK_NAMESPACE .. '.create', create)

--- Function to reset instances if FlowConfig was cleared
local function handleOnClearOldFlow()
  Script.releaseObject(instanceTable)
  instanceTable = {}
end
Script.register('CSK_FlowConfig.OnClearOldFlow', handleOnClearOldFlow)