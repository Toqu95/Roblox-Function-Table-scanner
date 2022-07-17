function fHook(func, pcall)
    print("Hooked "..debug.getinfo(func).name .. ": call " .. debug.getinfo(pcall).name .. " instead")
    hookfunction(func, pcall)
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
                    print(_,v2)
                end

                warn("------".." +Constants+ ".."------")
                for _,v2 in pairs(getconstants(v)) do
                    print(_,v2)
                end

                warn("------".." +Protos+ ".."------")
                for _,v2 in pairs(getprotos(v)) do
                    print(_,v2)
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
                                    print(k2,j2)
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
                                    print(k2,j2)
                                end
                            end)
                        end
                    end
                end
            end
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
            print(_, type(v2), v2)
        end
    end

    warn("------".." +Constants+ ".."------")
    for _,v2 in pairs(getconstants(func)) do
        print(_,v2)
    end

    warn("------".." +Protos+ ".."------")
    for _,v2 in pairs(getprotos(func)) do
        print(_,v2)
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
                        print(k2,j2)
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
                        print(k2,j2)
                    end
                end)
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
