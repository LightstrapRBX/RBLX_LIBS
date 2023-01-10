_G.MoonLib = {}

-- [ Variables ] --

local LibName = "MoonLib"

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
--local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local Mouse = Player:GetMouse()
local PlayerGui = Player.PlayerGui

-- [ Local Functions ] --

local function updateLayout(scrlFrame, listLayout)
    scrlFrame.CanvasSize = UDim2.new(0, listLayout.AbsoluteContentSize.X, 0, listLayout.AbsoluteContentSize.Y)
end

local function getNumberOfWindows()
    local num = 0
    for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
        if obj.Name.match("LightLibV2") then
            num = num + 1
        end
    end
    return num
end

local function getNumberOfTabsInWindow(window)
    return #window["MainContainer"]["TabContainer"]["TabScrolling"]:GetChildren() - 1
end

local function getNumberOfSectionsInTab(tab) -- unfinished
    local num = 0
    for _, obj in pairs(tab:GetChildren()) do
        if obj.Name == "" then
            num = num + 1
        end
    end
    return num
end

-- [ Library Functions ] --

local MoonLib_Main = Instance.new("ScreenGui")
local MainContainer = Instance.new("Frame")

MoonLib_Main.Name = "MoonLib_Main"
MoonLib_Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MoonLib_Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MoonLib_Main.ResetOnSpawn = false

MainContainer.Name = "MainContainer"
MainContainer.Parent = MoonLib_Main
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
MainContainer.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
MainContainer.Size = UDim2.new(0.4, 0, 0.5, 0)

local TabContainer = Instance.new("Frame")
local TabScrolling = Instance.new("ScrollingFrame")

TabContainer.Name = "TabContainer"
TabContainer.Parent = MainContainer
TabContainer.AnchorPoint = Vector2.new(0.5, 0.5)
TabContainer.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
TabContainer.BorderSizePixel = 0
TabContainer.Position = UDim2.new(0.165, 0, 0.5, 0)
TabContainer.Size = UDim2.new(0.3, 0, 0.95, 0)

TabScrolling.Name = "TabScrolling"
TabScrolling.Parent = TabContainer
TabScrolling.Active = true
TabScrolling.AnchorPoint = Vector2.new(0.5, 0.5)
TabScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabScrolling.BackgroundTransparency = 1.000
TabScrolling.BorderSizePixel = 0
TabScrolling.Position = UDim2.new(0.5, 0, 0.5, 0)
TabScrolling.Size = UDim2.new(0.875, 0, 0.96, 0)
TabScrolling.CanvasPosition = Vector2.new(0, 150)
TabScrolling.ScrollBarThickness = 0
TabScrolling.ScrollingDirection = Enum.ScrollingDirection.Y

