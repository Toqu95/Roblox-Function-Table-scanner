function getFunctionByName(funcName)
    for i,v in pairs(getgc()) do
        if type(v) == "function" then
            if debug.getinfo(v).name == funcName then
                return v
            end
        end
    end
end

local a = getFunctionByName("UpdateReticle")
local b = getupvalue(a, 3)

-- crosshair size
b["Size"] = 100

-- set crosshairColor to red
b["CrosshairColor"] = Color3.new(1, 0, 0)

-- inf ammo
b["EnableAmmo"] = false
