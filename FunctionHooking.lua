function fHook(func, pcall)
    if (debug.getinfo(pcall).name == "") then
        print("Hooked "..debug.getinfo(func).name .. ": call " .. "a custom function " .. "instead")
        hookfunction(func, pcall)
    else
        print("Hooked "..debug.getinfo(func).name .. ": call " .. debug.getinfo(pcall).name .. " instead")
        hookfunction(func, pcall)
    end
end

function fSetUpvalues(func, indexTable, valueTable)
    for i = 1, #indexTable, 1 do
        debug.setupvalue(func, indexTable[i], valueTable[i])
        print("Hooked Upvalue ".. debug.getinfo(func).name, ": ", tostring(indexTable[i]), " = ", tostring(valueTable[i]))
    end
end

function fSetConstants(func, indexTable, valueTable)
    for i = 1, #indexTable, 1 do
        debug.setconstant(func, indexTable[i], valueTable[i])
        print("Hooked Constant ".. debug.getinfo(func).name, ": ", tostring(indexTable[i]), " = ", tostring(valueTable[i]))
    end
end

function fScanFunctionByName(funcName)
    for i,v in pairs(getgc()) do
        if type(v) == "function" then
            if debug.getinfo(v).name == funcName then
                warn(debug.getinfo(v).name)
                warn("------".." +Upvalues+ ".."------")
                for _,v2 in pairs(getupvalues(v)) do
                    if type(v2) == "function" then
                        print(debug.getinfo(v2).name)
                    else
                        print(_, "["..type(v2).."]", v2)
                    end
                end

                warn("------".." +Constants+ ".."------")
                for _,v2 in pairs(getconstants(v)) do
                    if type(v2) == "function" then
                        print(debug.getinfo(v2).name)
                    else
                        print(_, "["..type(v2).."]", v2)
                    end
                end

                warn("------".." +Protos+ ".."------")
                for _,v2 in pairs(getprotos(v)) do
                    if type(v2) == "function" then
                        print(debug.getinfo(v2).name)
                    else
                        print(_, "["..type(v2).."]", v2)
                    end
                end

                warn("------".." +Tables+ ".."------")
                warn("Upvalues")
                for _,v2 in pairs(getupvalues(func)) do
                    if type(v2) == "table" then
                        print(_,v2)
                        for k,j in pairs(v2) do
                            print(k,j)
                            pcall(function()
                                for k2,j2 in pairs(j) do
                                    if type(v2) == "function" then
                                        print(debug.getinfo(j2).name)
                                    else
                                        print(k2, "["..type(j2).."]", j2)
                                    end
                                end
                            end)
                        end
                    end
                end
                warn("Constants")
                for _,v2 in pairs(getconstants(func)) do
                    if type(v2) == "table" then
                        print(_,v2)
                        for k,j in pairs(v2) do
                            print(k,j)
                            pcall(function()
                                for k2,j2 in pairs(j) do
                                    if type(v2) == "function" then
                                        print(debug.getinfo(j2).name)
                                    else
                                        print(k2, "["..type(j2).."]", j2)
                                    end
                                end
                            end)
                        end
                    end
                end
            end
            return
        end
    end
end

function fScanFunction(func)
    print()
    warn(debug.getinfo(func).name)
    warn("------".." +Upvalues+ ".."------")
    for _,v2 in pairs(getupvalues(func)) do
        if type(v2) == "function" then
            print(debug.getinfo(v2).name)
        else
            print(_, "["..type(v2).."]", v2)
        end
    end

    warn("------".." +Constants+ ".."------")
    for _,v2 in pairs(getconstants(func)) do
        if type(v2) == "function" then
            print(debug.getinfo(v2).name)
        else
            print(_, "["..type(v2).."]", v2)
        end
    end

    warn("------".." +Protos+ ".."------")
    for _,v2 in pairs(getprotos(func)) do
        if type(v2) == "function" then
            print(debug.getinfo(v2).name)
        else
            print(_, "["..type(v2).."]", v2)
        end
    end

    warn("------".." +Tables+ ".."------")
    warn("Upvalues")
    for _,v2 in pairs(getupvalues(func)) do
        if type(v2) == "table" then
            print(_,v2)
            for k,j in pairs(v2) do
                print(k,j)
                pcall(function()
                    for k2,j2 in pairs(j) do
                        if type(v2) == "function" then
                            print(debug.getinfo(j2).name)
                        else
                            print(k2, "["..type(j2).."]", j2)
                        end
                    end
                end)
            end
        end
    end
    warn("Constants")
    for _,v2 in pairs(getconstants(func)) do
        if type(v2) == "table" then
            print(_,v2)
            for k,j in pairs(v2) do
                print(k,j)
                pcall(function()
                    for k2,j2 in pairs(j) do
                        if type(v2) == "function" then
                            print(debug.getinfo(j2).name)
                        else
                            print(k2, "["..type(j2).."]", j2)
                        end
                    end
                end)
            end
        end
    end
    return
end

function fSimpleScanByName(func)
    for i,v in pairs(getgc()) do
        if type(v) == "function" then
            if debug.getinfo(v).name == func then
                print()
                warn(debug.getinfo(v).name)
                warn("------".." +Upvalues+ ".."------")
                for _,v2 in pairs(getupvalues(v)) do
                    if type(v2) == "function" then
                        print(debug.getinfo(v2).name)
                    else
                        print(_, "["..type(v2).."]", v2)
                    end
                end

                warn("------".." +Constants+ ".."------")
                for _,v2 in pairs(getconstants(v)) do
                    if type(v2) == "function" then
                        print(debug.getinfo(v2).name)
                    else
                        print(_, "["..type(v2).."]", v2)
                    end
                end

                warn("------".." +Protos+ ".."------")
                for _,v2 in pairs(getprotos(v)) do
                    if type(v2) == "function" then
                        print(debug.getinfo(v2).name)
                    else
                        print(_, "["..type(v2).."]", v2)
                    end
                end
                return
            end
        end
    end
end

function fHookNil(func)
    print("Hooked "..debug.getinfo(func).name .. " : return nil")
    hookfunction(func, function() return nil end)
end

function fHookString(func, string)
    print("Hooked "..debug.getinfo(func).name .. " : return " .. string)
    hookfunction(func, function() return tostring(string) end)
end

function fHookNumber(func, number)
    print("Hooked "..debug.getinfo(func).name .. " : return " .. number)
    hookfunction(func, function() return tonumber(number) end)
end

function fHookTrue(func)
    print("Hooked "..debug.getinfo(func).name .. " : return true")
    hookfunction(func, function() return true end)
end

function fHookFalse(func)
    print("Hooked "..debug.getinfo(func).name .. " : return false")
    hookfunction(func, function() return false end)
end

function getFunctionByName(funcName)
    for i,v in pairs(getgc()) do
        if type(v) == "function" then
            if debug.getinfo(v).name == funcName then
                return v
            end
        end
    end
end

function fGetConstants(func)
    return getconstants(func)
end

function fGetUpvalues(func)
    return getupvalues(func)
end

function fGetUpvalue(func, index)
    return getupvalue(func, index)
end

function fGetProtos(func)
    return getprotos(func)
end

function fGetProto(func, index)
    return getproto(func, index)
end

function fGetConstant(func, index)
    return getconstant(func, index)
end

function fPrintConstantType(func, index)
    print(type(getconstant(func, index)))
end

function fPrintUpvalueType(func, index)
    print(type(getupvalue(func, index)))
end

function fSetProtos(func, index, newfunc)
    print("Hooked "..debug.getinfo(func).name .. " : call " .. debug.getinfo(newfunc).name .. "instead")
    setproto(func, index, newfunc)
end

function useFunction(func, ...)
    return func(...)
end

function useFunctionNA(func)
    return func()
end

function fScanForFunctionsWithValues(valuesList)
    for i,v in pairs(getgc()) do
        if type(v) == "function" then
            if debug.getinfo(v).name ~= ""
        and debug.getinfo(v).name ~= "Connect"
        and debug.getinfo(v).name ~= "connect"
        and debug.getinfo(v).name ~= "update"
        and debug.getinfo(v).name ~= "link"
        and debug.getinfo(v).name ~= "Wait"
        and debug.getinfo(v).name ~= "wait"
        and debug.getinfo(v).name ~= "HandleCreation"
        and debug.getinfo(v).name ~= "Initial"
        and debug.getinfo(v).name ~= "Update"
        and debug.getinfo(v).name ~= "update"
        and debug.getinfo(v).name ~= "extrapolate"
        and debug.getinfo(v).name ~= "onTextFocusGained"
        and debug.getinfo(v).name ~= "FadeOutFunction"
        and debug.getinfo(v).name ~= "FadeInFunction"
        and debug.getinfo(v).name ~= "PushBack"
        and debug.getinfo(v).name ~= "Get"
        and debug.getinfo(v).name ~= "get"
        and debug.getinfo(v).name ~= "Post"
        and debug.getinfo(v).name ~= "Front"
        and debug.getinfo(v).name ~= "Empty"
        and debug.getinfo(v).name ~= "Size"
        and debug.getinfo(v).name ~= "AnimGuiObjects"
        and debug.getinfo(v).name ~= "UpdateAnimFunction"
        and debug.getinfo(v).name ~= "GetData"
        and debug.getinfo(v).name ~= "UpdateTextFunction"
        and debug.getinfo(v).name ~= "Disconnect"
        and debug.getinfo(v).name ~= "__index"
        and debug.getinfo(v).name ~= "__call"
        and debug.getinfo(v).name ~= "_compute"
        and debug.getinfo(v).name ~= "__newindex"
        and debug.getinfo(v).name ~= "setstate"
        and debug.getinfo(v).name ~= "step"
        and debug.getinfo(v).name ~= "IsA"
        and debug.getinfo(v).name ~= "pairs"
        and debug.getinfo(v).name ~= "ServerInitial"
        and debug.getinfo(v).name ~= "UrlEncode"
        and debug.getinfo(v).name ~= "new"
        and debug.getinfo(v).name ~= "Spawn"
        and debug.getinfo(v).name ~= "spawn"
        and debug.getinfo(v).name ~= "Halt"
        and debug.getinfo(v).name ~= "characterAdded"
        and debug.getinfo(v).name ~= "characterRemoving"
        and debug.getinfo(v).name ~= "fire"
        and debug.getinfo(v).name ~= "Destroy"
        and debug.getinfo(v).name ~= "GetHeightFunction" then
                for _,v2 in pairs(getupvalues(v)) do
                    for i3 = 1, #valuesList, 1 do
                        if v2 == valuesList[i3] then
                            print(debug.getinfo(v).name)
                        end
                    end
                end
                for _,v2 in pairs(getconstants(v)) do
                    for i3 = 1, #valuesList, 1 do
                        if v2 == valuesList[i3] then
                            print(debug.getinfo(v).name)
                        end
                    end
                end
            end
        end
    end
end
