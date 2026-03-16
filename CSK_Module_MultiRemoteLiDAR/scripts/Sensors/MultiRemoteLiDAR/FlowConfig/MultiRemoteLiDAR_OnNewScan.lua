-- Block namespace
local BLOCK_NAMESPACE = "MultiRemoteLiDAR_FC.OnNewScan"
local nameOfModule = 'CSK_MultiRemoteLiDAR'

--*************************************************************
--*************************************************************

-- Required to keep track of already allocated resource
local instanceTable = {}

local function register(handle, _ , callback)

  Container.remove(handle, "CB_Function")
  Container.add(handle, "CB_Function", callback)

  local instance = Container.get(handle, 'Instance')

  -- Check if amount of instances is valid
  -- if not: add multiple additional instances
  while true do
    local amount = CSK_MultiRemoteLiDAR.getInstancesAmount()
    if amount < instance then
      CSK_MultiRemoteLiDAR.addInstance()
    else
      break
    end
  end

  local function localCallback()
    local mode = Container.get(handle, 'Mode')
    local cbFunction = Container.get(handle,"CB_Function")

    if cbFunction ~= nil then

      -- Check what mode shoud be used
      if mode == 'HANDLE' then
        Script.callFunction(callback, 'HANDLE' .. tostring(instance))
      else
        Script.callFunction(callback, 'CSK_MultiRemoteLiDAR.OnNewScanSensor' .. tostring(instance))
      end

    else
      _G.logger:warning(nameOfModule .. ": " .. BLOCK_NAMESPACE .. ".CB_Function missing!")
    end
  end
  Script.register('CSK_FlowConfig.OnNewFlowConfig', localCallback)

  return true
end
Script.serveFunction(BLOCK_NAMESPACE ..".register", register)

--*************************************************************
--*************************************************************

local function create(instance, mode)

  local fullInstanceName = tostring(instance) .. tostring(mode)

  -- Check if same instance is already configured
  if instance < 1 or instanceTable[fullInstanceName] ~=  nil then
    _G.logger:warning(nameOfModule .. ': Instance invalid already in use, please choose another one')
    return nil
  else
    -- Otherwise create handle and store the restriced resource
    local handle = Container.create()
    instanceTable[instance] = instance
    Container.add(handle, 'Instance', instance)
    Container.add(handle, 'Mode', mode)
    Container.add(handle, "CB_Function", "")
    return handle
  end
end
Script.serveFunction(BLOCK_NAMESPACE .. ".create", create)

-- Function to clear instances
local function handleOnClearOldFlow()
  Script.releaseObject(instanceTable)
  instanceTable = {}
end
Script.register('CSK_FlowConfig.OnClearOldFlow', handleOnClearOldFlow)