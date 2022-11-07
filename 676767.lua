-- 67 lol
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xfarzad/SplixPrivateDrawingLibrary/main/gwa"))()

local window = library:new({textsize = 13.5,font = Enum.Font.RobotoMono,name = "676767",color = Color3.fromRGB(247, 7, 7)})

-- Tabs

local Blatant = window:page({name = "Blatant"});

local Misc = window:page({name = "Misc"});

local Visual = window:page({name = "Visual"});

-- Blatant Tab

local BoxLock = Blatant:section({name = "Target Aim",side = "left",size = 250})

local enable = BoxLock:toggle({name = "Enable",def = false,callback = function(ha_DF121231)
    getgenv().Settings.rewrittenmain.Enabled = ha_DF121231
end})

local key BoxLock:keybind({name = "Keybind",def = nil,callback = function(key)
    getgenv().Settings.rewrittenmain.Key = key
end})

local airshot = BoxLock:toggle({name = "Airshot",def = false,callback = function(ha_DF121231)
    getgenv().Settings.rewrittenmain.AIRSHOT = ha_DF121231
end})

local autopred = BoxLock:toggle({name = "Auto prediction",def = false,callback = function(ha_DF121231)
    getgenv().Settings.rewrittenmain.AUTOPRED = ha_DF121231
end})

local tptoplayer = BoxLock:toggle({name = "TP To Player",def = false,callback = function(ha_DF12_3)
    getgenv().Settings.rewrittenmain.TPToPlayer = ha_DF12_3
end})

local pred = BoxLock:textbox({name = "Enter Prediction",def = "0.135",placeholder = ".gg/streamable",callback = function(value)
    getgenv().PredictionValue = value
end})

-- Start of Box lock

getgenv().Settings = {
    rewrittenmain = {
        Enabled = false,
        Key = Enum.KeyCode.Q,
        DOT = true,
        AIRSHOT = false,
        NOTIF = true,
        AUTOPRED = false,
        FOV = math.huge,
        RESOVLER = false,
        TPToPlayer = false,
        ViewMode = false
    }
}

local uis = game:service'UserInputService'

local Settings = getgenv().Settings

getgenv().SelectedPart = "HumanoidRootPart"
getgenv().Prediction = true
getgenv().PredictionValue = 0.135


local AnchorCount = 0
local MaxAnchor = 50

local CC = game:GetService"Workspace".CurrentCamera
local Plr;
local enabled = false
local accomidationfactor = 0.139
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = Settings.rewrittenmain.DOT
    local a = Instance.new("Frame", e)
    if Settings.rewrittenmain.DOT == true then
        a.Size = UDim2.new(1, 0, 1, 0)
    else
        a.Size = UDim2.new(0, 0, 0, 0)
    end
    if Settings.rewrittenmain.DOT == true then
        a.Transparency = 0
        a.BackgroundTransparency = 0
    else
        a.Transparency = 1
        a.BackgroundTransparency = 1
    end
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    if Settings.rewrittenmain.DOT == false then
        g.CornerRadius = UDim.new(0, 0)
    else
        g.CornerRadius = UDim.new(1, 1) 
    end
    return(e)
end


local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat wait() until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(98, 71, 50), 0.3, 3)
    handler.Name = player.Name
    player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)


    spawn(function()
        while wait() do
            if player.Character then
            end
        end
    end)
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(function(Player)
    noob(Player)
end)

spawn(function()
    placemarker.Anchored = true
    placemarker.CanCollide = false
    if Settings.rewrittenmain.DOT == true then
        placemarker.Size = Vector3.new(8, 8, 8)
    else
        placemarker.Size = Vector3.new(0, 0, 0)
    end
    placemarker.Transparency = 0.85
    if Settings.rewrittenmain.DOT then
        makemarker(placemarker, placemarker, Color3.fromRGB(98, 71, 50), 0.40, 0)
    end
end)

uis.InputBegan:Connect(function(i, t)
    if i.KeyCode == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled and not t then
        if enabled == true then
            enabled = false
            Plr = getClosestPlayerToCursor()
            if getgenv().ViewMode == true then
                game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
            end
            if Settings.rewrittenmain.NOTIF == true then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "";
                    Text = "🐵Unlocked🐵",
                    Icon = "rbxassetid://10010974755",
                    Duration = 5
                })
            end
        else
            enabled = true
            Plr = getClosestPlayerToCursor()
            if getgenv().ViewMode == true then
                game.Workspace.CurrentCamera.CameraSubject = Plr.Character
            end
            if getgenv().TPToPlayer == true then
                LocalPlayer.Character.HumanoidRootPart.CFrame = Plr.Character.HumanoidRootPart.CFrame
            end
            if getgenv().LookAt then
                    local Char = game.Players.LocalPlayer.Character
                local PrimaryPartOfChar = game.Players.LocalPlayer.Character.PrimaryPart
                local NearestChar = Plr.Character
            local NearestRoot = Plr.Character.HumanoidRootPart
                local NearestPos = CFrame.new(PrimaryPartOfChar.Position, Vector3.new(NearestRoot.Position.X, NearestRoot.Position.Y, NearestRoot.Position.Z))
                Char:SetPrimaryPartCFrame(NearestPos)
            end
        if Settings.rewrittenmain.NOTIF == true then
                game.StarterGui:SetCore("SendNotification", {
                Title = "";
                Text = "🐵Target🐵:"..tostring(Plr.Character.Humanoid.DisplayName),
                Icon = "rbxassetid://10010974755",
                Duration = 5
                })
            end
        end
    end
end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = Settings.rewrittenmain.FOV

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

local pingvalue = nil;
local split = nil;
local ping = nil;

game:GetService"RunService".Stepped:connect(function()
    if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
        placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
    else
        placemarker.CFrame = CFrame.new(0, 9999, 0)
    end
    if Settings.rewrittenmain.AUTOPRED == true then
        pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        split = string.split(pingvalue,'(')
        ping = tonumber(split[1])
        if ping < 130 then
            PredictionValue = 0.151
        elseif ping < 125 then
            PredictionValue = 0.149
        elseif ping < 110 then
            PredictionValue = 0.146
        elseif ping < 105 then
            PredictionValue = 0.138
        elseif ping < 90 then
            PredictionValue = 0.136
        elseif ping < 80 then
            PredictionValue = 0.134
        elseif ping < 70 then
            PredictionValue = 0.131
        elseif ping < 60 then
            PredictionValue = 0.1229
        elseif ping < 50 then
            PredictionValue = 0.1225
        elseif ping < 40 then
            PredictionValue = 0.1256
        end
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then

        -- args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
            --[[
            if Settings.rewrittenmain.AIRSHOT == true then
                if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
                    
                    --// Airshot
                    args[3] = Plr.Character.LeftFoot.Position+(Plr.Character.LeftFoot.Velocity*PredictionValue)

                else
                    args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)

                end
            else
                    args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
            end
            ]]
        if Prediction == true then

            args[3] = Plr.Character[SelectedPart].Position+(Plr.Character[SelectedPart].Velocity*PredictionValue)

        else

            args[3] = Plr.Character[SelectedPart].Position

        end

        return old(unpack(args))
    end
    return old(...)
end)
