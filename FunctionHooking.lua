function fHook(func, pcall)
    print("Hooked "..debug.getinfo(func).name .. ": call " .. debug.getinfo(pcall).name .. " instead")
    hookfunction(func, pcall)
end

function fHookUpvalue(func, index, value)
    print("Hooked Upvalue ".. debug.getinfo(func).name, ": ", tostring(getupvalue(func, index)), " = ", tostring(value))
    debug.setupvalue(func, index, value)
end

function fHookConstant(func, index, value)
    print("Hooked Constant ".. debug.getinfo(func).name, ": ", tostring(getconstant(func, index)), " = ", tostring(value))
    debug.setconstant(func, index, value)
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
                for _,v2 in pairs(getupvalues(v)) do
                    if type(v2) == "table" then
                        warn(_,v2)
                        for k,j in pairs(v2) do
                            print(k,j)
                            pcall(function()
                                for k2,j2 in pairs(j) do
                                    print(k2,j2)
                                    for k3,j3 in pairs(j2) do
                                        print(k3,j3)
                                        for k4,j4 in pairs(j3) do
                                            print(k4,j4)
                                        end
                                    end
                                end
                            end)
                        end
                    end
                end
                warn("Constants")
                for _,v2 in pairs(getconstants(v)) do
                    if type(v2) == "table" then
                        print(_,v2)
                        for k,j in pairs(v2) do
                            print(k,j)
                            pcall(function()
                                for k2,j2 in pairs(j) do
                                    print(k2,j2)
                                    for k3,j3 in pairs(j2) do
                                        print(k3,j3)
                                        for k4,j4 in pairs(j3) do
                                            print(k4,j4)
                                        end
                                    end
                                end
                            end)
                        end
                    end
                end
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
