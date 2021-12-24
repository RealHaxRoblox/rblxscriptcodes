
-- Gui to Lua
-- Version: 3.1

-- Instances:

local flycar = Instance.new("ScreenGui")
local veryepic = Instance.new("Frame")
local background = Instance.new("TextLabel")
local title = Instance.new("TextLabel")
local close = Instance.new("TextButton")
local fly = Instance.new("TextButton")
local toogle = Instance.new("TextLabel")
local notice = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")

--Properties:

flycar.Name = "flycar"
flycar.Parent = game.CoreGui

veryepic.Name = "veryepic"
veryepic.Parent = flycar
veryepic.BackgroundColor3 = Color3.fromRGB(85, 255, 0)
veryepic.Position = UDim2.new(0.038906455, 0, 0.619164586, 0)
veryepic.Size = UDim2.new(0, 243, 0, 263)
veryepic.Active = true
veryepic.Draggable = true

background.Name = "background"
background.Parent = veryepic
background.BackgroundColor3 = Color3.fromRGB(85, 170, 0)
background.Position = UDim2.new(0.0370370373, 0, 0.0304182507, 0)
background.Size = UDim2.new(0, 224, 0, 246)
background.Font = Enum.Font.SourceSans
background.Text = ""
background.TextColor3 = Color3.fromRGB(0, 0, 0)
background.TextSize = 14.000

title.Name = "title"
title.Parent = veryepic
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.Position = UDim2.new(0.0864197537, 0, 0.0798479095, 0)
title.Size = UDim2.new(0, 163, 0, 28)
title.Font = Enum.Font.SciFi
title.Text = "FlyCar (for Prison Life.)"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true

close.Name = "close"
close.Parent = veryepic
close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
close.Position = UDim2.new(0.806584358, 0, 0.064638786, 0)
close.Size = UDim2.new(0, 30, 0, 33)
close.Font = Enum.Font.GothamBlack
close.Text = "X"
close.TextColor3 = Color3.fromRGB(0, 0, 0)
close.TextScaled = true
close.TextSize = 14.000
close.TextWrapped = true
close.MouseButton1Down:connect(function()
veryepic.Visible = false
end)

fly.Name = "fly"
fly.Parent = veryepic
fly.BackgroundColor3 = Color3.fromRGB(85, 255, 0)
fly.Position = UDim2.new(0.0864197537, 0, 0.266159713, 0)
fly.Size = UDim2.new(0, 200, 0, 50)
fly.Font = Enum.Font.SourceSans
fly.Text = "Press me to use FlyCar!"
fly.TextColor3 = Color3.fromRGB(0, 0, 0)
fly.TextScaled = true
fly.TextSize = 14.000
fly.TextWrapped = true
fly.MouseButton1Down:connect(function()
 local hint = Instance.new("Hint",game.Players.LocalPlayer.PlayerGui)
   hint.Text = "Press Z To Toggle"
   hint.Name = game.JobId
repeat wait()
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 500
local speed = 0
 
function Fly()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = false
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+125.0+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-250
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "z" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
wait(5)
hint:Destroy()
end)
Fly()
end)

toogle.Name = "toogle"
toogle.Parent = veryepic
toogle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toogle.Position = UDim2.new(0.0864197537, 0, 0.444867015, 0)
toogle.Size = UDim2.new(0, 200, 0, 29)
toogle.Font = Enum.Font.SourceSans
toogle.Text = "Press Z to Toggle"
toogle.TextColor3 = Color3.fromRGB(0, 0, 0)
toogle.TextSize = 14.000

notice.Name = "notice"
notice.Parent = veryepic
notice.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notice.Position = UDim2.new(0.0864197537, 0, 0.585551441, 0)
notice.Size = UDim2.new(0, 200, 0, 29)
notice.Font = Enum.Font.GothamBlack
notice.Text = "NOTE: you will have to press the TextButton again if you die."
notice.TextColor3 = Color3.fromRGB(0, 0, 0)
notice.TextScaled = true
notice.TextSize = 14.000
notice.TextWrapped = true

TextLabel.Parent = veryepic
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
TextLabel.Position = UDim2.new(0.0864197537, 0, 0.749049425, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.GothamBlack
TextLabel.Text = "Made by Arowix"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
