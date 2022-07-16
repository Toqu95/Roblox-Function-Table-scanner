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
            print("------".." +Tables+ ".."------")
            for i2,v2 in pairs(v) do
                if type(v2) == "table" then
                    print(i2,v2)
                end
            end
            print("------".." +Protos+ ".."------")
            for i2,v2 in pairs(v) do
                if type(v2) == "function" then
                    print(debug.getinfo(v2).name, v2)
                end
            end
            print("------".." +All+ ".."------")
            for i2,v2 in pairs(v) do
                print(i2,v2)
            end
        end)
    end
end

local hooking_page = venyx:addPage("Hooking", 5012544693)

for i,v in pairs(getgc()) do
    if type(v) == "function" then
        if debug.getinfo(v).name ~= ""
        and debug.getinfo(v).name ~= "Connect"
        and debug.getinfo(v).name ~= "connect"
        and debug.getinfo(v).name ~= "update"
        and debug.getinfo(v).name ~= "link"
        and debug.getinfo(v).name ~= "Wait"
        and debug.getinfo(v).name ~= "wait"
        and debug.getinfo(v).name ~= "extrapolate"
        and debug.getinfo(v).name ~= "onTextFocusGained"
        and debug.getinfo(v).name ~= "FadeOutFunction"
        and debug.getinfo(v).name ~= "FadeInFunction"
        and debug.getinfo(v).name ~= "PushBack"
        and debug.getinfo(v).name ~= "Get"
        and debug.getinfo(v).name ~= "Post"
        and debug.getinfo(v).name ~= "Front"
        and debug.getinfo(v).name ~= "Empty"
        and debug.getinfo(v).name ~= "Size"
        and debug.getinfo(v).name ~= "AnimGuiObjects"
        and debug.getinfo(v).name ~= "UpdateAnimFunction"
        and debug.getinfo(v).name ~= "GetData"
        and debug.getinfo(v).name ~= "UpdateTextFunction"
        and debug.getinfo(v).name ~= "Disconnect"
        and debug.getinfo(v).name ~= "GetHeightFunction" then

            local HookSection = hooking_page:addSection(tostring(debug.getinfo(v).name))
            HookSection:addButton(tostring("Values")..": "..debug.getinfo(v).name, function()
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
            end)

            HookSection:addButton("Hook: return true", function()
                hookfunction(v, function()
                    return true
                end)
            end)

            HookSection:addButton("Hook: return false", function()
                hookfunction(v, function()
                    return false
                end)
            end)

            HookSection:addTextbox("Hook: number", "", function(text)
                hookfunction(v, function()
                    return tonumber(text)
                end)
            end)

            HookSection:addButton("Hook: nil", function()
                hookfunction(v, function()
                    return nil
                end)
            end)

            HookSection:addTextbox("Hook: string", "", function(text)
                hookfunction(v, function()
                    return tostring(text)
                end)
            end)
        end
    end
end


venyx:SelectPage(venyx.pages[1], true)
