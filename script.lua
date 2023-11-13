local Lighting = game:GetService("Lighting")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local menu = Library.new("FNAF: CO-OP")

local main = menu:addPage("Main")
local segment1 = main:addSection("Main Features")

local basement = menu:addPage("Minigame")
local segment2 = basement:addSection("Basement Hunt")

local misc = menu:addPage("Misc")
local segment4 = misc:addSection("Misc")

local settings = menu:addPage("Settings")
local segment3 = settings:addSection("Settings")

_G.espActive = false
_G.Foxy = false

local function night()
    local animatronics = game:GetService("Workspace").Animatronics
    local number

    if animatronics:FindFirstChild("Springtrap") then
        number = 3
    elseif animatronics:FindFirstChild("ToyBonnie") then
        number = 2
    elseif animatronics:FindFirstChild("Nightmare") then
        number = 4
    elseif animatronics:FindFirstChild("GoldenFreddy") then
        number = 1
    end

    return number
end

local function setEsp(parent)
    local RenderStepped = game:GetService("RunService").RenderStepped
    local camera = game.Workspace.CurrentCamera
    local plr = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    local text = Drawing.new("Text")
    text.Center = true
    text.Size = 17
    text.Outline = false
    text.Font = 3
    text.Color = Color3.fromRGB(255, 0, 0)

    local Disconnect
    local Disconnect2

    Disconnect2 = parent.Parent.ChildRemoved:Connect(function(childMain)
        text.Visible = false
        text:Remove()

        if childMain == parent then
            Disconnect:Disconnect()
            Disconnect2:Disconnect()
            Disconnect2 = nil
            Disconnect = nil
        end
    end)

    Disconnect = RenderStepped:Connect(function()
        if parent and _G.espActive and parent.Parent:FindFirstChild(parent.Name) then
            local vector, inViewport = camera:WorldToViewportPoint(parent.Position)
            local Vnew = vector
            local plrToAnim = (parent.Position - plr.Position).magnitude

            if inViewport then
                text.Position = Vector2.new(Vnew.X, Vnew.Y)
                text.Text = tostring(parent.Parent.Name):gsub("%Part", "") .. " [" .. math.ceil(plrToAnim) .. "]"
                text.Visible = true
            else
                text.Visible = false
            end
        else
            text.Visible = false
            text:Remove()
            Disconnect:Disconnect()
            Disconnect2:Disconnect()
        end
    end)
end

local function night2(parent)
    parent.ChildAdded:Connect(function(child)
        if child:IsA("Part") then
            setEsp(child)
        end
    end)
end

local function dofullbright()
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
    Lighting.ColorShift_Top = Color3.new(1, 1, 1)
end

-- animatronic esp
segment1:addToggle("Animatronic ESP", false, function(bool)
    local animatronics = game:GetService("Workspace").Animatronics

    if bool then
        _G.espActive = true

        if night() == 1 then
            for _, v in pairs(animatronics:GetDescendants()) do
                if string.find(v.Name, "Part") and v:IsA("Part") and not v:FindFirstChild("FUCK") and v.Parent.Parent == animatronics then
                    setEsp(v)
                end
            end
        elseif night() == 2 then
            for _, v in pairs(animatronics:GetDescendants()) do
                if string.find(v.Name, "Part") and v:IsA("Part") and v.Parent.Parent == animatronics then
                    night2(v)
                end
            end
        elseif night() == 3 then
            for _, v in pairs(animatronics:GetDescendants()) do
                if string.find(v.Name, "SpringtrapPart") and v:IsA("Part") and v.Parent.Parent.Name == "Springtrap" and v.Parent.Parent.Parent == animatronics then
                    setEsp(v)
                end
            end
        elseif night() == 4 then
            for _, v in pairs(animatronics:GetDescendants()) do
                if string.find(v.Name, "Part") and v:IsA("Part") and v.Parent.Parent.Parent == animatronics and not string.find(v.Parent.Name, "Closet") then
                    setEsp(v)
                end
            end
        end
    else
        _G.espActive = false
    end
end)

-- godmode
segment1:addToggle("Animatronics Don't Affect you", false, function(bool)
    game:GetService("Players").ReflectedReality.PlayerGui.JumpscareGui.jumpscareScript.Disabled = bool
end)

-- tp to office
segment1:addButton("TP to office", function()
    local player = game:GetService("Players").LocalPlayer

    if night() == 1 then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(399.330139, 4.00000048, 7.83736849)
    elseif night() == 2 then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(23.309967, 2.99999928, -24.9838963)
    elseif night() == 3 then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-268.407959, 4.42830229, -63.4402657)
    elseif night() == 4 then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(107.655678, 2.4982717, -18.9428253)
    end
end)

-- fullbright
segment1:addButton("Fullbright", function()
    dofullbright()
    Lighting.LightingChanged:Connect(dofullbright)
end)

-- minigames
-- inf sprint
_G.sprint = false

segment2:addToggle("Infinite Sprint", false, function(bool)
    local moveMent = game:GetService("Players").LocalPlayer.Character.playerMovementScript

    if bool then
        _G.sprint = true

        for _, v in next, getgc() do
            if type(v) == "function" and getfenv(v).script == moveMent then
                if debug.getinfo(v).name == "startRun" then
                    spawn(function()
                        while _G.sprint do
                            debug.setupvalue(v, 1, 100)
                            wait(1)
                        end
                    end)
                end
            end
        end
    else
        _G.sprint = false
    end
end)

segment2:addButton("Lever ESP", function()
    local levers = game:GetService("Workspace").Levers

    for _, v in pairs(levers:GetDescendants()) do
        if v:IsA("Part") and v.Name ~= "blackPart" and v.Name ~= "lightPart" and v.Parent.Name ~= "Lights" then
            local adorn = Instance.new("BoxHandleAdornment", v)
            adorn.Adornee = v
            adorn.Color3 = Color3.new(0, 1, 0)
            adorn.Transparency = 0.5
            adorn.AlwaysOnTop = true
            adorn.ZIndex = 2
            adorn.Size = v.Size
        end
    end
end)

-- misc
segment4:addToggle("Auto wind Music Box (FNAF 2)", false, function(bool)
    spawn(function()
        while bool do
            game:GetService("ReplicatedStorage").RemoteEvents.MusicBoxWindUpEvent:FireServer(true)
            wait(0.5)
        end
    end)
end)

segment4:addToggle("Detect Nightmare Foxy (FNAF 4)", false, function(bool)
    local animatronics = game:GetService("Workspace").Animatronics

    if night() == 4 and animatronics:FindFirstChild("Foxy") then
        local Fox = game:GetService("Workspace").Animatronics.Foxy.NightmareFoxy.Head.Eye
        _G.Foxy = bool

        local Disconnect
        Disconnect = Fox:GetPropertyChangedSignal("Transparency"):Connect(function()
            if _G.Foxy then
                if Fox.Transparency == 0 then
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Alert!",
                        Text = "Nightmare Foxy has APPEARED!"
                    })
                else
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Alert!",
                        Text = "Nightmare Foxy has DISAPPEARED"
                    })
                end
            else
                Disconnect:Disconnect()
            end
        end)
    end
end)

-- settings
segment3:addKeybind("Toggle GUI", Enum.KeyCode.RightShift, function()
    menu:toggle()
end)

segment3:addButton("Credits", function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Credits",
        Text = "Script: Asphro\nUI: Venyx"
    })
end)

menu:SelectPage(menu.pages[1], true)
