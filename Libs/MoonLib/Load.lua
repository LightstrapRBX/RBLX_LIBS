local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
--local coreGui = game:GetService("CoreGui")

local gui = playerGui --coreGui

local MoonLib_Load = Instance.new("ScreenGui")
local MoonLib_Logo = Instance.new("Frame")
local M_Text = Instance.new("TextLabel")

MoonLib_Load.Name = "MoonLib_Load"
MoonLib_Load.Parent = gui
MoonLib_Load.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MoonLib_Load.ResetOnSpawn = false

MoonLib_Logo.Name = "MoonLib_Logo"
MoonLib_Logo.Parent = MoonLib_Load
MoonLib_Logo.AnchorPoint = Vector2.new(0.5, 0.5)
MoonLib_Logo.BackgroundColor3 = Color3.fromRGB(70, 9, 117)
MoonLib_Logo.BorderColor3 = Color3.fromRGB(255, 255, 255)
MoonLib_Logo.BorderSizePixel = 0
MoonLib_Logo.Position = UDim2.new(0.5, 0, 0.5, 0)
MoonLib_Logo.Size = UDim2.new(0, 0, 0, 0)
MoonLib_Logo.Rotation = 180

M_Text.Parent = MoonLib_Logo
M_Text.AnchorPoint = Vector2.new(0.5, 0.5)
M_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
M_Text.BackgroundTransparency = 1.000
M_Text.BorderSizePixel = 0
M_Text.Position = UDim2.new(0.5, 0, 0.5, 0)
M_Text.Size = UDim2.new(1, 0, 1, 0)
M_Text.Font = Enum.Font.GothamBold
M_Text.Text = "M"
M_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
M_Text.TextScaled = true
M_Text.TextSize = 14.000
M_Text.TextWrapped = true

-- Main Functions --

local hiddenSize = UDim2.new(0, 0, 0, 0)
local shownSize = UDim2.new(0.115, 0, 0.165, 0)

game:GetService("TweenService"):Create(MoonLib_Logo, TweenInfo.new(.6), {
    Size = shownSize,
    BorderSizePixel = 6,
    Rotation = 0
}):Play()

task.wait(7)

task.spawn(function()
    local num = 1
    while MoonLib_Logo do
        num = num + 1
        MoonLib_Logo.Rotation = MoonLib_Logo.Rotation - num
        task.wait()
    end
end)

game:GetService("TweenService"):Create(MoonLib_Logo, TweenInfo.new(.6), {
    Size = hiddenSize,
    BorderSizePixel = 0
}):Play()

task.wait(.6)

MoonLib_Load:Destroy()