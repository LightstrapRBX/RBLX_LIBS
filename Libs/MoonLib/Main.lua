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

local GUI_Location = PlayerGui--CoreGui

-- [ Local Functions ] --

local function updateLayout(scrlFrame, listLayout)
    scrlFrame.CanvasSize = UDim2.new(0, listLayout.AbsoluteContentSize.X, 0, listLayout.AbsoluteContentSize.Y)
end

local function getNumberOfWindows()
    local num = 0
    for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
        if obj.Name.match(LibName) then
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

local Library = {}

function Library.CreateWindow(windowName, options)
    local MoonLib_Main = Instance.new("ScreenGui")
    local Drag = Instance.new("Frame")
    local Container = Instance.new("Frame")
    local TabContainer = Instance.new("Frame")
    local TabScrolling = Instance.new("ScrollingFrame")
    local TopbarContainer = Instance.new("Frame")
    local MainContainer = Instance.new("Frame")
    local MainScrolling = Instance.new("ScrollingFrame")

    MoonLib_Main.Name = "MoonLib_Main"
    MoonLib_Main.Parent = game.Players.LocalPlayer.PlayerGui
    MoonLib_Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    MoonLib_Main.ResetOnSpawn = false

    Drag.Name = "Drag"
    Drag.Parent = MoonLib_Main
    Drag.AnchorPoint = Vector2.new(0.5, 0.5)
    Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Drag.BackgroundTransparency = 1.000
    Drag.BorderSizePixel = 0
    Drag.Position = UDim2.new(0.5, 0, 0.25, 0)
    Drag.Size = UDim2.new(0.5, 0, 0.100000001, 0)

    Container.Name = "Container"
    Container.Parent = Drag
    Container.AnchorPoint = Vector2.new(0.5, 0.5)
    Container.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    Container.BorderSizePixel = 0
    Container.Position = UDim2.new(0.5, 0, 2.98996043, 0)
    Container.Size = UDim2.new(0.841958046, 0, 4.91767216, 0)

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Container
    TabContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    TabContainer.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0.163762093, 0, 0.545000076, 0)
    TabContainer.Size = UDim2.new(0.302475899, 0, 0.880000055, 0)

    TabScrolling.Name = "TabScrolling"
    TabScrolling.Parent = TabContainer
    TabScrolling.Active = true
    TabScrolling.AnchorPoint = Vector2.new(0.5, 0.5)
    TabScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabScrolling.BackgroundTransparency = 1.000
    TabScrolling.BorderSizePixel = 0
    TabScrolling.Position = UDim2.new(0.499999911, 0, 0.50000006, 0)
    TabScrolling.Size = UDim2.new(0.875, 0, 0.9599998, 0)
    TabScrolling.ScrollBarThickness = 0

    TopbarContainer.Name = "TopbarContainer"
    TopbarContainer.Parent = Container
    TopbarContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    TopbarContainer.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    TopbarContainer.BorderSizePixel = 0
    TopbarContainer.Position = UDim2.new(0.5, 0, 0.0549999997, 0)
    TopbarContainer.Size = UDim2.new(0.975000024, 0, 0.075000003, 0)

    MainContainer.Name = "MainContainer"
    MainContainer.Parent = Container
    MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    MainContainer.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    MainContainer.BorderSizePixel = 0
    MainContainer.Position = UDim2.new(0.656000018, 0, 0.545000017, 0)
    MainContainer.Size = UDim2.new(0.662, 0, 0.879999995, 0)

    MainScrolling.Name = "MainScrolling"
    MainScrolling.Parent = Container
    MainScrolling.Active = true
    MainScrolling.AnchorPoint = Vector2.new(0.5, 0.5)
    MainScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainScrolling.BackgroundTransparency = 1.000
    MainScrolling.BorderSizePixel = 0
    MainScrolling.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainScrolling.Size = UDim2.new(0.925000012, 0, 0.959999979, 0)
    MainScrolling.ScrollBarThickness = 0
end

return Library

-- local MoonLib_Main = Instance.new("ScreenGui")
-- local MainContainer = Instance.new("Frame")

-- MoonLib_Main.Name = "MoonLib_Main"
-- MoonLib_Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
-- MoonLib_Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
-- MoonLib_Main.ResetOnSpawn = false

-- MainContainer.Name = "MainContainer"
-- MainContainer.Parent = MoonLib_Main
-- MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
-- MainContainer.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
-- MainContainer.BorderSizePixel = 0
-- MainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
-- MainContainer.Size = UDim2.new(0.4, 0, 0.5, 0)

-- local TabContainer = Instance.new("Frame")
-- local TabScrolling = Instance.new("ScrollingFrame")

-- TabContainer.Name = "TabContainer"
-- TabContainer.Parent = MainContainer
-- TabContainer.AnchorPoint = Vector2.new(0.5, 0.5)
-- TabContainer.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
-- TabContainer.BorderSizePixel = 0
-- TabContainer.Position = UDim2.new(0.165, 0, 0.5, 0)
-- TabContainer.Size = UDim2.new(0.3, 0, 0.95, 0)

-- TabScrolling.Name = "TabScrolling"
-- TabScrolling.Parent = TabContainer
-- TabScrolling.Active = true
-- TabScrolling.AnchorPoint = Vector2.new(0.5, 0.5)
-- TabScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
-- TabScrolling.BackgroundTransparency = 1.000
-- TabScrolling.BorderSizePixel = 0
-- TabScrolling.Position = UDim2.new(0.5, 0, 0.5, 0)
-- TabScrolling.Size = UDim2.new(0.875, 0, 0.96, 0)
-- TabScrolling.CanvasPosition = Vector2.new(0, 150)
-- TabScrolling.ScrollBarThickness = 0
-- TabScrolling.ScrollingDirection = Enum.ScrollingDirection.Y

