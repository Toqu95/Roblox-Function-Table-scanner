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

local UserInputService = game:GetService("UserInputService")
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))() --someone reuploaded it so I put it in place of the original back up so guy can get free credit.
local venyx = library.new("ToolsX", 5013109572)

local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(255, 255, 255)
}

local tables_page = venyx:addPage("Tables", 5012544693)
local tables = tables_page:addSection("Tables")

for i,v in pairs(getreg()) do
    if typeof(v) == "table" then
        tables:addButton(tostring(i), function()
            warn(tostring(i))
            warn("------".." +Tables+ ".."------")
            for i2,v2 in pairs(v) do
                if type(v2) == "table" then
                    print(i2,v2)
                end
            end
            warn("------".." +Protos+ ".."------")
            for i2,v2 in pairs(v) do
                if type(v2) == "function" then
                    print(debug.getinfo(v2).name, v2)
                end
            end
            warn("------".." +All+ ".."------")
            for i2,v2 in pairs(v) do
                print(i2,v2)
            end
        end)
    end
end

local hooking_page = venyx:addPage("Functions", 5012544693)

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

            local HookSection = hooking_page:addSection(tostring(debug.getinfo(v).name))
        end
    end
end


local funcsearch = venyx:addPage("Function Info/Hook", 5012544693)
local funcsearch_section = funcsearch:addSection("Function")
local funcsearch_textbox = funcsearch_section:addTextbox("Function Name", "", function(text, focuslost)
    if focuslost then
        local newSection = funcsearch:addSection("Function: "..debug.getinfo(getFunctionByName(text)).name)
    
        local a = newSection:addButton(tostring("Values")..": "..debug.getinfo(getFunctionByName(text)).name, function()
            fScanFunction(getFunctionByName(text))
        end)
        
        local b = newSection:addButton("Hook functon: return true", function()
            fHookTrue(getFunctionByName(text))
        end)
        
        local c = newSection:addButton("Hook functon: return false", function()
            fHookFalse(getFunctionByName(text))
        end)
        
        local e = newSection:addButton("Hook functon: nil", function()
            fHookNil(getFunctionByName(text))
        end)
        
        local d = newSection:addTextbox("Hook functon: number", "", function(_text)
            fHookNumber(getFunctionByName(text), _text)
        end)
        
        local f = newSection:addTextbox("Hook functon: string", "", function(_text)
            fHookString(getFunctionByName(text), _text)
        end)

        local table = {}

        newSection:addTextbox("Add number to table", "", function(_text, focuslost)
            if focuslost then
                table.insert(table, tonumber(_text))
            end
        end)

        newSection:addTextbox("Add string to table", "", function(_text, focuslost)
            if focuslost then
                table.insert(table, _text)
            end
        end)

        newSection:addButton("Hook functon: table", function()
            hookfunction(getFunctionByName(text), function() return table end)
        end)

        newSection:addTextbox("Replace Table at index", "", function(index, focuslost)
            if focuslost then
                setupvalue(getFunctionByName(text), index, table)
            end
        end)

        local upvalue

        newSection:addTextbox("Set local upvalue", "", function(_text, focuslost)
            if focuslost then
                upvalue = _text
            end
        end)

        newSection:addTextbox("SetUpvalue at index", "", function(index, focuslost)
            if focuslost then
                setupvalue(getFunctionByName(text), index, upvalue)
            end
            print("Hooked Upvalue ".. debug.getinfo(getFunctionByName(text)).name, ": ", tostring(index), " = ", tostring(upvalue))
        end)

        local constant

        newSection:addTextbox("Set constant", "", function(_text, focuslost)
            if focuslost then
                constant = _text
            end
        end)

        newSection:addTextbox("SetConstant at index", "", function(index, focuslost)
            if focuslost then
                setconstant(getFunctionByName(text), index, constant)
            end
        end)
    end
end)

venyx:SelectPage(venyx.pages[1], true)
