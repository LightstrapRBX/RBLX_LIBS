--[[


    .____    .__       .__     __  .____    ._____.    
    |    |   |__| ____ |  |___/  |_|    |   |__\_ |__  
    |    |   |  |/ ___\|  |  \   __\    |   |  || __ \ 
    |    |___|  / /_/  >   Y  \  | |    |___|  || \_\ \
    |_______ \__\___  /|___|  /__| |_______ \__||___  /
            \/ /_____/      \/             \/       \/ 
                ________                            
            ___  _\_____  \                           
            \  \/ //  ____/                           
            \   //       \                           
            \_/ \_______ \                          
                        \/

    
    Made by: Lightstrap#0658
    Design by: Lightstrap#0658

]]

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()

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
    return #window["C1"]["C2"]["TabC"]["TabH"]:GetChildren() - 1
end

local function getNumberOfSectionsInTab(tab)
    local num = 0
    for _, obj in pairs(tab:GetChildren()) do
        if obj.Name == "SectionDivider" then
            num = num + 1
        end
    end
    return num
end

local function createSectionDivider(mainHolder)
    local SectionDivider = Instance.new("Frame")
    SectionDivider.Name = "SectionDivider"
    SectionDivider.Parent = mainHolder
    SectionDivider.AnchorPoint = Vector2.new(0.5, 0.5)
    SectionDivider.BackgroundColor3 = Color3.fromRGB(244, 255, 143)
    SectionDivider.BorderSizePixel = 0
    SectionDivider.Position = UDim2.new(0.50000006, 0, 0.214330286, 0)
    SectionDivider.Size = UDim2.new(1, 0, 0.00760796294, 0)
end

local function createSectionEnder(mainHolder)
    local SectionEnder = Instance.new("Frame")
    SectionEnder.Name = "SectionDivider"
    SectionEnder.Parent = mainHolder
    SectionEnder.AnchorPoint = Vector2.new(0.5, 0.5)
    SectionEnder.BackgroundColor3 = Color3.fromRGB(244, 255, 143)
    SectionEnder.BackgroundTransparency = 1.000
    SectionEnder.BorderSizePixel = 0
    SectionEnder.Position = UDim2.new(0.50000006, 0, 0.154607832, 0)
    SectionEnder.Size = UDim2.new(1, 0, 0.0144788409, 0)
end

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

_G.LightLibV2 = {}

local library = {}

library.themes = {
    ["default"] = true,
    ["white"] = false,
    ["dark_grey"] = false,
    ["light_red"] = false,
    ["green"] = false,
    ["purple"] = false
}

function library:DeleteAllWindows()
    for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
        if obj.Name.match("LightLibV2") then
            obj:Destroy()
        end
    end
end

function library:DeleteWindow(windowName)
    if game:GetService("CoreGui"):FindFirstChild("LightLibV2_" .. windowName) then
        game:GetService("CoreGui")["LightLibV2_" .. windowName]:Destroy()
    end
end

function library:CreateWindow(windowName, windowKeybind, deleteAllWindows)

    if deleteAllWindows then
        library:DeleteAllWindows()
    end

    local LightLibV2 = Instance.new("ScreenGui")
    local C1 = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local C2 = Instance.new("Frame")
    local TabC = Instance.new("Frame")
    local TabH = Instance.new("ScrollingFrame")
    local TabLayout = Instance.new("UIListLayout")
    local UserC = Instance.new("Frame")
    local BG = Instance.new("ImageLabel")
    local UserAvatar = Instance.new("ImageLabel")
    local Username = Instance.new("TextLabel")
    local Settings = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local Txt = Instance.new("TextLabel")
    local Div = Instance.new("Frame")
    local Choice1 = Instance.new("ImageButton")
    local Choice2 = Instance.new("ImageButton")
    local Choice3 = Instance.new("ImageButton")
    local Choice4 = Instance.new("ImageButton")
    local Choice5 = Instance.new("ImageButton")
    local Choice6 = Instance.new("ImageButton")
    local Div_2 = Instance.new("Frame")
    local MainC = Instance.new("Frame")
    local Div_3 = Instance.new("Frame")
    local InfoC = Instance.new("Frame")
    local HubName = Instance.new("TextLabel")
    local Drag = Instance.new("Frame")
    local UIStroke = Instance.new("UIStroke")

    LightLibV2.Name = "LightLibV2_" .. (windowName or getNumberOfWindows() + 1) 
    LightLibV2.Parent = game:GetService("CoreGui")
    LightLibV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LightLibV2.ResetOnSpawn = false

    Drag.Name = "Drag"
    Drag.Parent = LightLibV2
    Drag.AnchorPoint = Vector2.new(0.5, 0.5)
    Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Drag.BackgroundTransparency = 1.000
    Drag.BorderSizePixel = 0
    Drag.Position = UDim2.new(0.5, 0, 0.224999994, 0)
    Drag.Size = UDim2.new(0.459, 0, 0.089, 0)

    C1.Name = "C1"
    C1.Parent = Drag
    C1.AnchorPoint = Vector2.new(0.5, 0.5)
    C1.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
    C1.BorderSizePixel = 0
    C1.Position = UDim2.new(0.5, 0, 2.741, 0)
    C1.Size = UDim2.new(0.81, 0, 4.353, 0)

    UICorner.CornerRadius = UDim.new(0.0199999996, 0)
    UICorner.Parent = C1

    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    UIStroke.Color = Color3.fromRGB(244, 255, 143)
    UIStroke.Thickness = 5
    UIStroke.Parent = C1

    C2.Name = "C2"
    C2.Parent = C1
    C2.AnchorPoint = Vector2.new(0.5, 0.5)
    C2.BackgroundColor3 = Color3.fromRGB(255, 220, 46)
    C2.BorderSizePixel = 0
    C2.Position = UDim2.new(0.5, 0, 0.503750026, 0)
    C2.Size = UDim2.new(0.985000014, 0, 0.992500067, 0)

    TabC.Name = "TabC"
    TabC.Parent = C2
    TabC.AnchorPoint = Vector2.new(0.5, 0.5)
    TabC.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
    TabC.BorderSizePixel = 0
    TabC.ClipsDescendants = true
    TabC.Position = UDim2.new(0.149708316, 0, 0.488958746, 0)
    TabC.Size = UDim2.new(0.300000012, 0, 0.696290851, 0)

    TabH.Name = "TabH"
    TabH.Parent = TabC
    TabH.Active = true
    TabH.AnchorPoint = Vector2.new(0.5, 0.5)
    TabH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabH.BackgroundTransparency = 1.000
    TabH.BorderSizePixel = 0
    TabH.ClipsDescendants = false
    TabH.Position = UDim2.new(0.485000014, 0, 0.5, 0)
    TabH.Size = UDim2.new(0.888999999, 0, 0.949999988, 0)
    TabH.ScrollBarThickness = 0
    TabH.ScrollingDirection = Enum.ScrollingDirection.Y

    TabLayout.Parent = TabH
    TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabLayout.Padding = UDim.new(0.0149999997, 0)

    UserC.Name = "UserC"
    UserC.Parent = C2
    UserC.AnchorPoint = Vector2.new(0.5, 0.5)
    UserC.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
    UserC.BorderSizePixel = 0
    UserC.Position = UDim2.new(0.144290924, 0, 0.923552096, 0)
    UserC.Size = UDim2.new(0.303417981, 0, 0.152895838, 0)
    UserC.ZIndex = 2

    BG.Name = "BG"
    BG.Parent = UserC
    BG.AnchorPoint = Vector2.new(0.5, 0.5)
    BG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BG.BackgroundTransparency = 1.000
    BG.BorderSizePixel = 0
    BG.ClipsDescendants = true
    BG.Position = UDim2.new(0.150000006, 0, 0.5, 0)
    BG.Size = UDim2.new(0.240706086, 0, 0.77575767, 0)
    BG.Image = "rbxassetid://5629962387"
    BG.ImageColor3 = Color3.fromRGB(255, 220, 79)

    UserAvatar.Name = "UserAvatar"
    UserAvatar.Parent = BG
    UserAvatar.AnchorPoint = Vector2.new(0.5, 0.5)
    UserAvatar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UserAvatar.BackgroundTransparency = 1.000
    UserAvatar.BorderSizePixel = 0
    UserAvatar.Position = UDim2.new(0.5, 0, 0.5, 0)
    UserAvatar.Size = UDim2.new(1, 0, 1, 0)
    UserAvatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    UserAvatar.ImageTransparency = 1.000

    Username.Name = "Username"
    Username.Parent = UserC
    Username.AnchorPoint = Vector2.new(0.5, 0.5)
    Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Username.BackgroundTransparency = 1.000
    Username.BorderSizePixel = 0
    Username.ClipsDescendants = true
    Username.Position = UDim2.new(0.648490846, 0, 0.50000006, 0)
    Username.Size = UDim2.new(0.661929965, 0, 0.393999994, 0)
    Username.Font = Enum.Font.GothamBold
    Username.Text = game.Players.LocalPlayer.Name or "Username"
    Username.TextColor3 = Color3.fromRGB(255, 250, 92)
    Username.TextSize = 12.000
    Username.TextXAlignment = Enum.TextXAlignment.Left

    Settings.Name = "Settings"
    Settings.Parent = UserC
    Settings.AnchorPoint = Vector2.new(0.5, 0.5)
    Settings.BackgroundColor3 = Color3.fromRGB(255, 220, 46)
    Settings.BorderSizePixel = 0
    Settings.Position = UDim2.new(0.650441289, 0, -1.20909107, 0)
    Settings.Size = UDim2.new(1, 0, 3.5696969, 0)
    Settings.Visible = false

    UICorner_3.CornerRadius = UDim.new(0.125, 0)
    UICorner_3.Parent = Settings

    Txt.Name = "Txt"
    Txt.Parent = Settings
    Txt.AnchorPoint = Vector2.new(0.5, 0.5)
    Txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Txt.BackgroundTransparency = 1.000
    Txt.BorderSizePixel = 0
    Txt.Position = UDim2.new(0.5, 0, 0.119694352, 0)
    Txt.Size = UDim2.new(0.949999988, 0, 0.100000001, 0)
    Txt.Font = Enum.Font.GothamBold
    Txt.Text = "THEME"
    Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
    Txt.TextSize = 14.000

    Div.Name = "Div"
    Div.Parent = Settings
    Div.AnchorPoint = Vector2.new(0.5, 0.5)
    Div.BackgroundColor3 = Color3.fromRGB(244, 255, 143)
    Div.BorderSizePixel = 0
    Div.Position = UDim2.new(0.497999996, 0, 0.194999993, 0)
    Div.Size = UDim2.new(0.755999982, 0, 0.0149999997, 0)

    Choice1.Name = "Choice1"
    Choice1.Parent = Settings
    Choice1.AnchorPoint = Vector2.new(0.5, 0.5)
    Choice1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Choice1.BackgroundTransparency = 1.000
    Choice1.BorderSizePixel = 0
    Choice1.Position = UDim2.new(0.351999998, 0, 0.333999991, 0)
    Choice1.Size = UDim2.new(0.202999994, 0, 0.171000004, 0)
    Choice1.AutoButtonColor = false
    Choice1.Image = "rbxassetid://5629962387"
    Choice1.ImageColor3 = Color3.fromRGB(255, 250, 92)

    Choice2.Name = "Choice2"
    Choice2.Parent = Settings
    Choice2.AnchorPoint = Vector2.new(0.5, 0.5)
    Choice2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Choice2.BackgroundTransparency = 1.000
    Choice2.BorderSizePixel = 0
    Choice2.Position = UDim2.new(0.640999973, 0, 0.333999991, 0)
    Choice2.Size = UDim2.new(0.202999994, 0, 0.171000004, 0)
    Choice2.AutoButtonColor = false
    Choice2.Image = "rbxassetid://5629962387"

    Choice3.Name = "Choice3"
    Choice3.Parent = Settings
    Choice3.AnchorPoint = Vector2.new(0.5, 0.5)
    Choice3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Choice3.BackgroundTransparency = 1.000
    Choice3.BorderSizePixel = 0
    Choice3.Position = UDim2.new(0.351999998, 0, 0.584999979, 0)
    Choice3.Size = UDim2.new(0.202999994, 0, 0.171000004, 0)
    Choice3.AutoButtonColor = false
    Choice3.Image = "rbxassetid://5629962387"
    Choice3.ImageColor3 = Color3.fromRGB(49, 49, 49)

    Choice4.Name = "Choice4"
    Choice4.Parent = Settings
    Choice4.AnchorPoint = Vector2.new(0.5, 0.5)
    Choice4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Choice4.BackgroundTransparency = 1.000
    Choice4.BorderSizePixel = 0
    Choice4.Position = UDim2.new(0.640999973, 0, 0.584999979, 0)
    Choice4.Size = UDim2.new(0.202999994, 0, 0.171000004, 0)
    Choice4.AutoButtonColor = false
    Choice4.Image = "rbxassetid://5629962387"
    Choice4.ImageColor3 = Color3.fromRGB(255, 113, 84)

    Choice5.Name = "Choice5"
    Choice5.Parent = Settings
    Choice5.AnchorPoint = Vector2.new(0.5, 0.5)
    Choice5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Choice5.BackgroundTransparency = 1.000
    Choice5.BorderSizePixel = 0
    Choice5.Position = UDim2.new(0.351999998, 0, 0.828999996, 0)
    Choice5.Size = UDim2.new(0.202999994, 0, 0.171000004, 0)
    Choice5.AutoButtonColor = false
    Choice5.Image = "rbxassetid://5629962387"
    Choice5.ImageColor3 = Color3.fromRGB(116, 255, 74)

    Choice6.Name = "Choice6"
    Choice6.Parent = Settings
    Choice6.AnchorPoint = Vector2.new(0.5, 0.5)
    Choice6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Choice6.BackgroundTransparency = 1.000
    Choice6.BorderSizePixel = 0
    Choice6.Position = UDim2.new(0.640999973, 0, 0.828999996, 0)
    Choice6.Size = UDim2.new(0.202999994, 0, 0.171000004, 0)
    Choice6.AutoButtonColor = false
    Choice6.Image = "rbxassetid://5629962387"
    Choice6.ImageColor3 = Color3.fromRGB(173, 101, 255)

    Div_2.Name = "Div"
    Div_2.Parent = C2
    Div_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Div_2.BackgroundColor3 = Color3.fromRGB(244, 255, 143)
    Div_2.BorderSizePixel = 0
    Div_2.Position = UDim2.new(0.145999998, 0, 0.839999974, 0)
    Div_2.Size = UDim2.new(0.306880057, 0, 0.00999999978, 0)

    MainC.Name = "MainC"
    MainC.Parent = C2
    MainC.AnchorPoint = Vector2.new(0.5, 0.5)
    MainC.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
    MainC.BorderSizePixel = 0
    MainC.ClipsDescendants = true
    MainC.Position = UDim2.new(0.65199995, 0, 0.496221662, 0)
    MainC.Size = UDim2.new(0.69599992, 0, 1.0075568, 0)
    MainC.ZIndex = 0

    Div_3.Name = "Div"
    Div_3.Parent = C2
    Div_3.AnchorPoint = Vector2.new(0.5, 0.5)
    Div_3.BackgroundColor3 = Color3.fromRGB(244, 255, 143)
    Div_3.BorderSizePixel = 0
    Div_3.Position = UDim2.new(0.300000012, 0, 0.5, 0)
    Div_3.Size = UDim2.new(0.00800000038, 0, 1, 0)

    InfoC.Name = "InfoC"
    InfoC.Parent = C2
    InfoC.AnchorPoint = Vector2.new(0.5, 0.5)
    InfoC.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
    InfoC.BorderSizePixel = 0
    InfoC.Position = UDim2.new(0.147854105, 0, 0.0666282997, 0)
    InfoC.Size = UDim2.new(0.29629153, 0, 0.148370057, 0)
    InfoC.ZIndex = 2

    HubName.Name = "HubName"
    HubName.Parent = InfoC
    HubName.AnchorPoint = Vector2.new(0.5, 0.5)
    HubName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HubName.BackgroundTransparency = 1.000
    HubName.BorderSizePixel = 0
    HubName.ClipsDescendants = true
    HubName.Position = UDim2.new(0.5, 0, 0.5, 0)
    HubName.Size = UDim2.new(0.899999976, 0, 0.925000012, 0)
    HubName.Font = Enum.Font.GothamBold
    HubName.Text = windowName or "HubName"
    HubName.TextColor3 = Color3.fromRGB(255, 250, 92)
    HubName.TextScaled = true
    HubName.TextSize = 12.000
    HubName.TextWrapped = true

    ----------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------

    _G.LightLibV2.WindowKeybind = windowKeybind or Enum.KeyCode.RightShift

    task.spawn(function()
        TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            updateLayout(TabH, TabLayout)
        end)
        TabH.CanvasSize = UDim2.new(0, TabLayout.AbsoluteContentSize.X, 0, TabLayout.AbsoluteContentSize.Y)
    end)

    task.spawn(function()
		local UI_TOGGLED = true
		local debounce = false
		UIS.InputBegan:Connect(function(input)
			if input.KeyCode == _G.LightLibV2.WindowKeybind then
				if debounce then return end
				debounce = true
				UI_TOGGLED = not UI_TOGGLED
				if UI_TOGGLED then
					C1:TweenSize(
						UDim2.new(1, 0, 7.746, 0),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						0.6,
						true
					)
				elseif UI_TOGGLED ~= true then
					C1:TweenSize(
                        UDim2.new(0, 0, 0, 0),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quart,
                        0.6,
                        true
                    )
				end
				task.wait(0.25)
				debounce = false
			end
		end)
	end)

    local dragInput = nil
	local dragStart = nil
	local startPos = nil
    local dragging = nil

	local function update(input)
		local delta = input.Position - dragStart
		Drag:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), 'Out', 'Linear', 0.01, true)
	end

	Drag.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Drag.Position
			repeat
				wait()
			until input.UserInputState == Enum.UserInputState.End
			dragging = false
		end
	end)

	Drag.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

    ----------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------

    local windowFunctions = {}

    function windowFunctions:CreateTab(tabName)
        local TabB = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local RealTabB = Instance.new("TextButton")
        local MainH = Instance.new("ScrollingFrame")
        local MainLayout = Instance.new("UIListLayout")
        local TabBSelected = Instance.new("BoolValue")

        TabB.Name = tabName or getNumberOfTabsInWindow(LightLibV2) + 1
        TabB.Parent = TabH
        TabB.AnchorPoint = Vector2.new(0.5, 0.5)
        TabB.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
        TabB.BorderSizePixel = 0
        TabB.Position = UDim2.new(0.5, 0, 0.038815178, 0)
        TabB.Size = UDim2.new(1, 0, 0.25, 0)

        UICorner.CornerRadius = UDim.new(0.125, 0)
        UICorner.Parent = TabB

        RealTabB.Parent = TabB
        RealTabB.AnchorPoint = Vector2.new(0.5, 0.5)
        RealTabB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        RealTabB.BackgroundTransparency = 1.000
        RealTabB.BorderSizePixel = 0
        RealTabB.Position = UDim2.new(0.5, 0, 0.5, 0)
        RealTabB.Size = UDim2.new(1, 0, 1, 0)
        RealTabB.AutoButtonColor = false
        RealTabB.Font = Enum.Font.GothamBold
        RealTabB.Text = tabName or "TAB"
        RealTabB.TextColor3 = Color3.fromRGB(255, 250, 92)
        RealTabB.TextSize = 14.000
        RealTabB.TextWrapped = true

        MainH.Name = tabName or getNumberOfTabsInWindow(windowName) + 1
        MainH.Parent = MainC
        MainH.Active = true
        MainH.AnchorPoint = Vector2.new(0.5, 0.5)
        MainH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainH.BackgroundTransparency = 1.000
        MainH.BorderSizePixel = 0
        MainH.ClipsDescendants = false
        MainH.Position = UDim2.new(0.5, 0, 0.5, 0)
        MainH.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
        MainH.ScrollBarThickness = 0
        MainH.Visible = false
        MainH.ScrollingDirection = Enum.ScrollingDirection.Y

        MainLayout.Parent = MainH
        MainLayout.SortOrder = Enum.SortOrder.LayoutOrder
        MainLayout.Padding = UDim.new(0.00999999978, 0)

		TabBSelected.Name = "TabBSelected"
		TabBSelected.Parent = TabB
        TabBSelected.Value = false

        ----------------------------------------------------------------------------------------------
        ----------------------------------------------------------------------------------------------

        task.spawn(function()
            if getNumberOfTabsInWindow(windowName) == 0 then
                MainH.Visible = true
            end
        end)

        MainLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            updateLayout(MainH, MainLayout)
        end)
        MainH.CanvasSize = UDim2.new(0, MainLayout.AbsoluteContentSize.X, 0, MainLayout.AbsoluteContentSize.Y)

        RealTabB.MouseEnter:Connect(function()
            if TabBSelected.Value == true then return end
            game:GetService("TweenService"):Create(TabB, TweenInfo.new(0.25), {
                BackgroundColor3 = Color3.fromRGB(236, 184, 25)
            }):Play()
        end)

        RealTabB.MouseLeave:Connect(function()
            if TabBSelected.Value == true then return end
            game:GetService("TweenService"):Create(TabB, TweenInfo.new(0.25), {
                BackgroundColor3 = Color3.fromRGB(255, 203, 46)
            }):Play()
        end)

        RealTabB.Activated:Connect(function()
            if TabBSelected.Value == false then
                TabBSelected.Value = true

                task.spawn(function()
                    for _, obj in pairs(MainC:GetChildren()) do
                        obj.Visible = false
                    end
                    MainH.Visible = true
                end)

                task.spawn(function()
                    for _, obj in pairs(TabH:GetChildren()) do
                        if obj.Name ~= tabName then
                            obj.TabBSelected.Value = false
                            obj.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                        end
                    end
                end)

                game:GetService("TweenService"):Create(TabB, TweenInfo.new(0.25), {
                    BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                }):Play()

                game:GetService("TweenService"):Create(TabB, TweenInfo.new(0.25), {
                    BackgroundColor3 = Color3.fromRGB(236, 184, 25)
                }):Play()

            end
        end)

        ----------------------------------------------------------------------------------------------
        ----------------------------------------------------------------------------------------------

        local tabFunctions = {}

        function tabFunctions:CreateSection()
            if getNumberOfSectionsInTab(MainH) > 0 then
                createSectionEnder(MainH)
                createSectionDivider(MainH)
                createSectionEnder(MainH)
            end

            local sectionFunctions = {}

            function sectionFunctions:CreateLabel(args)
                local labelText = args["Text"] or args[1] or "Text here."
    
                local Section_Label = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local LabelH = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
    
                Section_Label.Name = "Section_Label"
                Section_Label.Parent = MainH
                Section_Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Section_Label.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Section_Label.BorderSizePixel = 0
                Section_Label.Position = UDim2.new(0.498244613, 0, 0.0631578341, 0)
                Section_Label.Size = UDim2.new(1.00399995, 0, 0.0599999987, 0)
    
                UICorner.CornerRadius = UDim.new(0.125, 0)
                UICorner.Parent = Section_Label
    
                LabelH.Name = "LabelH"
                LabelH.Parent = Section_Label
                LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelH.BackgroundTransparency = 1.000
                LabelH.BorderSizePixel = 0
                LabelH.Position = UDim2.new(0.5, 0, 0.5, 0)
                LabelH.Size = UDim2.new(0.975000024, 0, 0.774999976, 0)
    
                Label.Name = "Label"
                Label.Parent = LabelH
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.Text = labelText
                Label.TextColor3 = Color3.fromRGB(255, 203, 46)
                Label.TextScaled = true
                Label.TextSize = 21.000
                Label.TextWrapped = true
            end
    
            function sectionFunctions:CreateButton(args)
                local buttonText = args["Text"] or args[1] or "Text here."
                local callback = args["Callback"] or args[2]

                if not callback or typeof(callback) ~= "function" then return end

                local Section_Button = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Button = Instance.new("TextButton")
                local LabelH = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
                local MousePointer = Instance.new("ImageLabel")

                Section_Button.Name = "Section_Button"
                Section_Button.Parent = MainH
                Section_Button.AnchorPoint = Vector2.new(0.5, 0.5)
                Section_Button.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Section_Button.BorderSizePixel = 0
                Section_Button.Position = UDim2.new(0.498244613, 0, 0.0631578341, 0)
                Section_Button.Size = UDim2.new(1.00399995, 0, 0.0599999987, 0)

                UICorner.CornerRadius = UDim.new(0.125, 0)
                UICorner.Parent = Section_Button

                Button.Name = "Button"
                Button.Parent = Section_Button
                Button.AnchorPoint = Vector2.new(0.5, 0.5)
                Button.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Button.BackgroundTransparency = 1.000
                Button.BorderSizePixel = 0
                Button.Position = UDim2.new(0.5, 0, 0.5, 0)
                Button.Size = UDim2.new(1, 0, 1, 0)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.GothamBold
                Button.Text = ""
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button.TextScaled = true
                Button.TextSize = 21.000
                Button.TextWrapped = true

                LabelH.Name = "LabelH"
                LabelH.Parent = Section_Button
                LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelH.BackgroundTransparency = 1.000
                LabelH.BorderSizePixel = 0
                LabelH.Position = UDim2.new(0.451438934, 0, 0.50000006, 0)
                LabelH.Size = UDim2.new(0.877877831, 0, 0.774999976, 0)

                Label.Name = "Label"
                Label.Parent = LabelH
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.Text = buttonText
                Label.TextColor3 = Color3.fromRGB(255, 203, 46)
                Label.TextScaled = true
                Label.TextSize = 21.000
                Label.TextWrapped = true

                MousePointer.Name = "MousePointer"
                MousePointer.Parent = Section_Button
                MousePointer.AnchorPoint = Vector2.new(0.5, 0.5)
                MousePointer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                MousePointer.BackgroundTransparency = 1.000
                MousePointer.BorderSizePixel = 0
                MousePointer.Position = UDim2.new(0.949999988, 0, 0.479999989, 0)
                MousePointer.Size = UDim2.new(0.0750001594, 0, 0.675001621, 0)
                MousePointer.Image = "rbxassetid://11400928498"

                ----------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------

                local buttonBusy = false
                
                Button.MouseEnter:Connect(function()
                    if buttonBusy then return end
                    game:GetService("TweenService"):Create(Section_Button, TweenInfo.new(0.25), {
                        BackgroundColor3 = Color3.fromRGB(241, 236, 87)
                    }):Play()
                end)

                Button.MouseLeave:Connect(function()
                    if buttonBusy then return end
                    game:GetService("TweenService"):Create(Section_Button, TweenInfo.new(0.25), {
                        BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                    }):Play()
                end)

                Button.Activated:Connect(function()
                    buttonBusy = true

                    task.spawn(function()
                        pcall(callback)
                    end)

                    local tween1 = game:GetService("TweenService"):Create(Section_Button, TweenInfo.new(0.25), {
                        BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                    })
                    local tween2 = game:GetService("TweenService"):Create(Section_Button, TweenInfo.new(0.25), {
                        BackgroundColor3 = Color3.fromRGB(241, 236, 87)
                    })

                    tween1:Play()
                    tween1.Completed:Wait()

                    tween2:Play()
                    tween2.Completed:Wait()

                    buttonBusy = false
                end)

            end
    
            function sectionFunctions:CreateNumberInput(args)

                local labelText = args["Text"] or args[1] or "Text here."
                local callback = args["Callback"] or args[2]

                if not callback or typeof(callback) ~= "function" then return end

                local Section_Number = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local LabelH = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
                local NumberBox = Instance.new("TextBox")

                Section_Number.Name = "Section_Number"
                Section_Number.Parent = MainH
                Section_Number.AnchorPoint = Vector2.new(0.5, 0.5)
                Section_Number.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Section_Number.BorderSizePixel = 0
                Section_Number.Position = UDim2.new(0.498244613, 0, 0.0631578341, 0)
                Section_Number.Size = UDim2.new(1.00399995, 0, 0.0599999987, 0)

                UICorner.CornerRadius = UDim.new(0.125, 0)
                UICorner.Parent = Section_Number

                LabelH.Name = "LabelH"
                LabelH.Parent = Section_Number
                LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelH.BackgroundTransparency = 1.000
                LabelH.BorderSizePixel = 0
                LabelH.Position = UDim2.new(0.352518082, 0, 0.50000006, 0)
                LabelH.Size = UDim2.new(0.680036128, 0, 0.774999976, 0)

                Label.Name = "Label"
                Label.Parent = LabelH
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.Text = labelText
                Label.TextColor3 = Color3.fromRGB(255, 203, 46)
                Label.TextScaled = true
                Label.TextSize = 21.000
                Label.TextWrapped = true

                NumberBox.Name = "NumberBox"
                NumberBox.Parent = Section_Number
                NumberBox.AnchorPoint = Vector2.new(0.5, 0.5)
                NumberBox.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                NumberBox.BorderSizePixel = 0
                NumberBox.Position = UDim2.new(0.846402764, 0, 0.469172329, 0)
                NumberBox.Size = UDim2.new(0.257194251, 0, 0.5, 0)
                NumberBox.Font = Enum.Font.GothamBold
                NumberBox.PlaceholderColor3 = Color3.fromRGB(244, 255, 143)
                NumberBox.PlaceholderText = "Input"
                NumberBox.Text = ""
                NumberBox.TextColor3 = Color3.fromRGB(255, 250, 92)
                NumberBox.TextSize = 12.000

                ----------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------
                
                NumberBox:GetPropertyChangedSignal("Text"):Connect(function()
                    NumberBox.Text = NumberBox.Text:gsub('[^%d.]', '')
                end)

                NumberBox.FocusLost:Connect(function(enterPressed)
                    if not enterPressed then return end
                    task.spawn(function()
                        pcall(callback, NumberBox.Text)
                    end)
                end)
            
            end

            function sectionFunctions:CreateTextInput(args)
                local labelText = args["Text"] or args[1] or "Text here."
                local callback = args["Callback"] or args[2]

                if not callback or typeof(callback) ~= "function" then return end

                local Section_Text = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local LabelH = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")

                Section_Text.Name = "Section_Text"
                Section_Text.Parent = MainH
                Section_Text.AnchorPoint = Vector2.new(0.5, 0.5)
                Section_Text.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Section_Text.BorderSizePixel = 0
                Section_Text.Position = UDim2.new(0.498244613, 0, 0.0631578341, 0)
                Section_Text.Size = UDim2.new(1.00399995, 0, 0.0599999987, 0)

                UICorner.CornerRadius = UDim.new(0.125, 0)
                UICorner.Parent = Section_Text

                LabelH.Name = "LabelH"
                LabelH.Parent = Section_Text
                LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelH.BackgroundTransparency = 1.000
                LabelH.BorderSizePixel = 0
                LabelH.Position = UDim2.new(0.352518082, 0, 0.50000006, 0)
                LabelH.Size = UDim2.new(0.680036128, 0, 0.774999976, 0)

                Label.Name = "Label"
                Label.Parent = LabelH
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.Text = labelText
                Label.TextColor3 = Color3.fromRGB(255, 203, 46)
                Label.TextScaled = true
                Label.TextSize = 21.000
                Label.TextWrapped = true

                TextBox.Name = "TextBox"
                TextBox.Parent = Section_Text
                TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
                TextBox.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                TextBox.BorderSizePixel = 0
                TextBox.Position = UDim2.new(0.846402764, 0, 0.469172329, 0)
                TextBox.Size = UDim2.new(0.257194251, 0, 0.5, 0)
                TextBox.Font = Enum.Font.GothamBold
                TextBox.PlaceholderColor3 = Color3.fromRGB(244, 255, 143)
                TextBox.PlaceholderText = "Input"
                TextBox.Text = ""
                TextBox.TextColor3 = Color3.fromRGB(255, 250, 92)
                TextBox.TextSize = 12.000

                ----------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------

                TextBox.FocusLost:Connect(function(enterPressed)
                    if not enterPressed then return end
                    task.spawn(function()
                        pcall(callback, TextBox.Text)
                    end)
                end)
            end
    
            function sectionFunctions:CreateToggle(args)
                local labelText = args["Text"] or args[1] or "Text here."
                local default = args["Default"] or args[2] or false
                local callback = args["Callback"] or args[3]

                if not callback or typeof(callback) ~= "function" then return end

                local Section_Toggle = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local LabelH = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
                local Toggle = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")

                Section_Toggle.Name = "Section_Toggle"
                Section_Toggle.Parent = MainH
                Section_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                Section_Toggle.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Section_Toggle.BorderSizePixel = 0
                Section_Toggle.Position = UDim2.new(0.498244613, 0, 0.0631578341, 0)
                Section_Toggle.Size = UDim2.new(1.00399995, 0, 0.0599999987, 0)
                
                UICorner.CornerRadius = UDim.new(0.125, 0)
                UICorner.Parent = Section_Toggle
                
                LabelH.Name = "LabelH"
                LabelH.Parent = Section_Toggle
                LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelH.BackgroundTransparency = 1.000
                LabelH.BorderSizePixel = 0
                LabelH.Position = UDim2.new(0.444244683, 0, 0.50000006, 0)
                LabelH.Size = UDim2.new(0.863489389, 0, 0.774999976, 0)
                
                Label.Name = "Label"
                Label.Parent = LabelH
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.Text = labelText
                Label.TextColor3 = Color3.fromRGB(255, 203, 46)
                Label.TextScaled = true
                Label.TextSize = 21.000
                Label.TextWrapped = true
                
                Toggle.Name = "Toggle"
                Toggle.Parent = Section_Toggle
                Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                Toggle.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                Toggle.BorderSizePixel = 0
                Toggle.Position = UDim2.new(0.939999998, 0, 0.5, 0)
                Toggle.Size = UDim2.new(0.0805037767, 0, 0.715589166, 0)
                Toggle.AutoButtonColor = false
                Toggle.Font = Enum.Font.GothamBold
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
                Toggle.TextSize = 18.000
                Toggle.TextWrapped = true
                
                UICorner_2.CornerRadius = UDim.new(0.25, 0)
                UICorner_2.Parent = Toggle

                ----------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------

                local toggled = default
                local toggleBusy = false

                local tween1 = nil
                local tween2 = nil

                if toggled then
                    Toggle.BackgroundColor3 = Color3.fromRGB(251, 255, 170)
                end
                
                Toggle.MouseEnter:Connect(function()
                    if toggleBusy then return end
                    tween1 = game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.12), {
                        Size = UDim2.new(0.1, 0, 0.75, 0)
                    })
                    tween1:Play()
                end)

                Toggle.MouseLeave:Connect(function()
                    if toggleBusy then return end
                    tween2 = game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.12), {
                        Size = UDim2.new(0.081, 0, 0.716, 0)
                    })
                    tween2:Play()
                end)

                Toggle.Activated:Connect(function()
                    toggleBusy = true
                    if tween1.PlaybackState == Enum.PlaybackState.Playing then
                        tween1:Cancel()
                    end
                    if tween2.PlaybackState == Enum.PlaybackState.Playing then
                        tween2:Cancel()
                    end
                    if not toggled then
                        toggled = true
                        game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.25), {
                            BackgroundColor3 = Color3.fromRGB(251, 255, 170)
                        }):Play()
                    else
                        toggled = false
                        game:GetService("TweenService"):Create(Toggle, TweenInfo.new(0.25), {
                            BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                        }):Play()
                    end
                    toggleBusy = false
                    task.spawn(function()
                        pcall(callback, toggled)
                    end)
                end)

            end

            function sectionFunctions:CreateKeybind(args)
                local labelText = args["Text"] or args[1] or "Text here."
                local default = args["Default"] or args[2]
                local callback = args["Callback"] or args[3]

                if not callback or typeof(callback) ~= "function" then return end
            
                local Section_Keybind = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local KeybindBox = Instance.new("TextBox")
                local LabelH = Instance.new("Frame")
                local Label = Instance.new("TextLabel")

                Section_Keybind.Name = "Section_Keybind"
                Section_Keybind.Parent = MainH
                Section_Keybind.AnchorPoint = Vector2.new(0.5, 0.5)
                Section_Keybind.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Section_Keybind.BorderSizePixel = 0
                Section_Keybind.Position = UDim2.new(0.498244613, 0, 0.0631578341, 0)
                Section_Keybind.Size = UDim2.new(1.00399995, 0, 0.0599999987, 0)
                
                UICorner.CornerRadius = UDim.new(0.125, 0)
                UICorner.Parent = Section_Keybind
                
                KeybindBox.Name = "KeybindBox"
                KeybindBox.Parent = Section_Keybind
                KeybindBox.AnchorPoint = Vector2.new(0.5, 0.5)
                KeybindBox.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                KeybindBox.BorderSizePixel = 0
                KeybindBox.Position = UDim2.new(0.846402764, 0, 0.469172329, 0)
                KeybindBox.Size = UDim2.new(0.257194251, 0, 0.5, 0)
                KeybindBox.Font = Enum.Font.GothamBold
                KeybindBox.PlaceholderColor3 = Color3.fromRGB(244, 255, 143)
                KeybindBox.PlaceholderText = "[...]"
                KeybindBox.Text = ""
                KeybindBox.TextColor3 = Color3.fromRGB(255, 250, 92)
                KeybindBox.TextSize = 12.000
                
                LabelH.Name = "LabelH"
                LabelH.Parent = Section_Keybind
                LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelH.BackgroundTransparency = 1.000
                LabelH.BorderSizePixel = 0
                LabelH.Position = UDim2.new(0.352518082, 0, 0.50000006, 0)
                LabelH.Size = UDim2.new(0.680036128, 0, 0.774999976, 0)
                
                Label.Name = "Label"
                Label.Parent = LabelH
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.Text = labelText
                Label.TextColor3 = Color3.fromRGB(255, 203, 46)
                Label.TextScaled = true
                Label.TextSize = 21.000
                Label.TextWrapped = true

                ----------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------

                if default then
                    if typeof(default) == "string" then
                        KeybindBox.Text = "[" .. default .. "]" 
                    elseif typeof(default) == "EnumItem" then
                        KeybindBox.Text = "[" .. default.Name .. "]" 
                    end
                end
                
                KeybindBox:GetPropertyChangedSignal("Text"):Connect(function()
                    local kbText = KeybindBox.Text
                    if not kbText or kbText == "" then return end

                    local kb = nil

                    if Enum.KeyCode[kbText] then
                        kb = Enum.KeyCode[kbText].Name
                    else
                        kb = "Unknown Key"
                    end

                    KeybindBox.Text = "[" .. kb .. "]" 
                end)
                
                KeybindBox.FocusLost:Connect(function(enterPressed)
                    if not enterPressed then return end

                    local kbText = KeybindBox.Text

                    if Enum.KeyCode[kbText] then
                        task.spawn(function()
                            pcall(callback, Enum.KeyCode[KeybindBox.Text])
                        end)
                    end
                end)

            end

            function sectionFunctions:CreateSlider(args)
                local labelText = args["Text"] or args[1] or "Text here."
                local min = args["Min"] or args[2]
                local max = args["Max"] or args[3]
                local default = args["Default"] or args[4]
                local callback = args["Callback"] or args[5]

                if not min or not max or not callback or typeof(callback) ~= "function" then return end
                
                default = default or min

                local Section_Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local LabelH = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
                local SliderBG = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local Slider = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local NumberBox = Instance.new("TextBox")
                local Drag = Instance.new("TextButton")

                Section_Slider.Name = "Section_Slider"
                Section_Slider.Parent = MainH
                Section_Slider.AnchorPoint = Vector2.new(0.5, 0.5)
                Section_Slider.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Section_Slider.BorderSizePixel = 0
                Section_Slider.Position = UDim2.new(0.502000034, 0, 0.034457434, 0)
                Section_Slider.Size = UDim2.new(1.00399995, 0, 0.0689148307, 0)
                
                UICorner.CornerRadius = UDim.new(0.125, 0)
                UICorner.Parent = Section_Slider
                
                LabelH.Name = "LabelH"
                LabelH.Parent = Section_Slider
                LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelH.BackgroundTransparency = 1.000
                LabelH.BorderSizePixel = 0
                LabelH.Position = UDim2.new(0.5, 0, 0.349999994, 0)
                LabelH.Size = UDim2.new(0.949999988, 0, 0.400000006, 0)
                
                Label.Name = "Label"
                Label.Parent = LabelH
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.Text = labelText
                Label.TextColor3 = Color3.fromRGB(255, 203, 46)
                Label.TextScaled = true
                Label.TextSize = 21.000
                Label.TextWrapped = true
                Label.TextXAlignment = Enum.TextXAlignment.Left
                
                SliderBG.Name = "SliderBG"
                SliderBG.Parent = Section_Slider
                SliderBG.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderBG.BackgroundColor3 = Color3.fromRGB(221, 176, 40)
                SliderBG.BorderSizePixel = 0
                SliderBG.Position = UDim2.new(0.5, 0, 0.764999986, 0)
                SliderBG.Size = UDim2.new(0.975000024, 0, 0.200000003, 0)
                
                UICorner_2.CornerRadius = UDim.new(5, 0)
                UICorner_2.Parent = SliderBG
                
                Slider.Name = "Slider"
                Slider.Parent = SliderBG
                Slider.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                Slider.BorderSizePixel = 0
                Slider.Size = UDim2.new(0, 0, 1, 0)
                
                UICorner_3.CornerRadius = UDim.new(5, 0)
                UICorner_3.Parent = Slider
                
                NumberBox.Name = "NumberBox"
                NumberBox.Parent = Section_Slider
                NumberBox.AnchorPoint = Vector2.new(0.5, 0.5)
                NumberBox.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                NumberBox.BorderSizePixel = 0
                NumberBox.Position = UDim2.new(0.855000019, 0, 0.349999994, 0)
                NumberBox.Size = UDim2.new(0.257194251, 0, 0.5, 0)
                NumberBox.Font = Enum.Font.GothamBold
                NumberBox.PlaceholderColor3 = Color3.fromRGB(244, 255, 143)
                NumberBox.PlaceholderText = "Input"
                NumberBox.Text = ""
                NumberBox.TextColor3 = Color3.fromRGB(255, 250, 92)
                NumberBox.TextSize = 12.000

                Drag.Name = "Drag"
                Drag.Parent = SliderBG
                Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Drag.BackgroundTransparency = 1.000
                Drag.BorderSizePixel = 0
                Drag.Position = UDim2.new(0, 0, -0.736000001, 0)
                Drag.Size = UDim2.new(0.0729999989, 0, 2.1789999, 0)
                Drag.AutoButtonColor = false
                Drag.Font = Enum.Font.SourceSans
                Drag.Text = ""
                Drag.TextColor3 = Color3.fromRGB(0, 0, 0)
                Drag.TextSize = 14.000

                ----------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------

                Slider.Size = UDim2.fromScale(default/max, Slider.Size.Y)
                NumberBox.Text = default

                local MoveConnection = nil

                Drag.MouseButton1Click:Connect(function()
                    MoveConnection = RS.Heartbeat:Connect(function()
                        local s = math.clamp(mouse.X - Drag.AbsolutePosition.X, 0, Drag.AbsoluteSize.X) / Drag.AbsoluteSize.X
                        local val = math.floor(min + ((max - min) * s))

                        Slider:TweenSize(
                            UDim2.fromScale(val, Slider.Size.Y),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quint,
                            .05
                        )

                        NumberBox.Text = val
                    end)

                    UIS.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if MoveConnection then
                                MoveConnection:Disconnect()
                                MoveConnection = nil
                                task.spawn(function()
                                    pcall(callback, NumberBox.Text)
                                end)
                            end
                        end
                    end)
                end)

                NumberBox:GetPropertyChangedSignal("Text"):Connect(function()
                    NumberBox.Text = NumberBox.Text:gsub('[^%d.]', '')
                end)

                NumberBox.FocusLost:Connect(function(enterPressed)
                    if not enterPressed then return end
                    local number = NumberBox.Text
                    if number > max then return end
                    Slider:TweenSize(
                        UDim2.fromScale(number/max, Slider.Size.Y),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quint,
                        .4
                    )
                    task.spawn(function()
                        pcall(callback, number)
                    end)
                end)
            
            end

            function sectionFunctions:CreateDropdown(args)
                local labelText = args["Text"] or args[1] or "Text here."
                local list = args["List"] or args[2]
                local callback = args["Callback"] or args[3]

                if not list or not callback or typeof(list) ~= "table" or typeof(callback) ~= "function" then return end

                local Section_Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropdownC = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local DropdownH = Instance.new("ScrollingFrame")
                local DropdownLayout = Instance.new("UIListLayout")
                local LabelH = Instance.new("Frame")
                local Label = Instance.new("TextLabel")
                local Arrow = Instance.new("ImageButton")

                Section_Dropdown.Name = "Section_Dropdown"
                Section_Dropdown.Parent = MainH
                Section_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
                Section_Dropdown.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                Section_Dropdown.BorderSizePixel = 0
                Section_Dropdown.Position = UDim2.new(0.498244613, 0, 0.0631578341, 0)
                Section_Dropdown.Size = UDim2.new(1.00399995, 0, 0.0599999987, 0)
                
                UICorner.CornerRadius = UDim.new(0.125, 0)
                UICorner.Parent = Section_Dropdown
                
                DropdownC.Name = "DropdownC"
                DropdownC.Parent = Section_Dropdown
                DropdownC.AnchorPoint = Vector2.new(0.5, 0.5)
                DropdownC.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                DropdownC.BorderSizePixel = 0
                DropdownC.ClipsDescendants = true
                DropdownC.Position = UDim2.new(0.5, 0, 2.81939244, 0)
                DropdownC.Size = UDim2.new(1.00399995, 0, 0, 0)
                
                UICorner_2.CornerRadius = UDim.new(0.0500000007, 0)
                UICorner_2.Parent = DropdownC
                
                DropdownH.Name = "DropdownH"
                DropdownH.Parent = DropdownC
                DropdownH.Active = true
                DropdownH.AnchorPoint = Vector2.new(0.5, 0.5)
                DropdownH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownH.BackgroundTransparency = 1.000
                DropdownH.BorderSizePixel = 0
                DropdownH.ClipsDescendants = false
                DropdownH.Position = UDim2.new(0.5, 0, 0.5, 0)
                DropdownH.Size = UDim2.new(0.970532596, 0, 0.925000012, 0)
                DropdownH.ScrollBarThickness = 0
                DropdownH.ScrollingDirection = Enum.ScrollingDirection.Y
                
                DropdownLayout.Parent = DropdownH
                DropdownLayout.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownLayout.Padding = UDim.new(0.00999999978, 0)
                
                LabelH.Name = "LabelH"
                LabelH.Parent = Section_Dropdown
                LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelH.BackgroundTransparency = 1.000
                LabelH.BorderSizePixel = 0
                LabelH.Position = UDim2.new(0.454350829, 0, 0.50000006, 0)
                LabelH.Size = UDim2.new(0.858658791, 0, 0.49755013, 0)
                
                Label.Name = "Label"
                Label.Parent = LabelH
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.BorderSizePixel = 0
                Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                Label.Size = UDim2.new(1, 0, 1, 0)
                Label.Font = Enum.Font.GothamBold
                Label.Text = labelText
                Label.TextColor3 = Color3.fromRGB(255, 203, 46)
                Label.TextScaled = true
                Label.TextSize = 21.000
                Label.TextWrapped = true
                Label.TextXAlignment = Enum.TextXAlignment.Left
                
                Arrow.Name = "Arrow"
                Arrow.Parent = Section_Dropdown
                Arrow.AnchorPoint = Vector2.new(0.5, 0.5)
                Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Arrow.BackgroundTransparency = 1.000
                Arrow.BorderSizePixel = 0
                Arrow.Position = UDim2.new(0.935000002, 0, 0.5, 0)
                Arrow.Rotation = -90.000
                Arrow.Size = UDim2.new(0.075000003, 0, 0.600000024, 0)
                Arrow.Image = "rbxassetid://10928743268"
                Arrow.ImageColor3 = Color3.fromRGB(255, 216, 76)

                ----------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------

                DropdownLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    updateLayout(DropdownH, DropdownLayout)
                end)
                DropdownH.CanvasSize = UDim2.new(0, DropdownLayout.AbsoluteContentSize.X, 0, DropdownLayout.AbsoluteContentSize.Y)

                ----------------------------------------------------------------------------------------------
                ----------------------------------------------------------------------------------------------
                
                local debounce = false
                local open = false

                local function loadItems()
                    for _, item in next, list do
                        if typeof(item) == "string" then
                            local Section_Selection = Instance.new("Frame")
                            local UICorner = Instance.new("UICorner")
                            local Button = Instance.new("TextButton")
                            local LabelH = Instance.new("Frame")
                            local Label = Instance.new("TextLabel")
                            local MousePointer = Instance.new("ImageLabel")

                            Section_Selection.Name = "Section_Selection"
                            Section_Selection.Parent = DropdownH
                            Section_Selection.AnchorPoint = Vector2.new(0.5, 0.5)
                            Section_Selection.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                            Section_Selection.BorderSizePixel = 0
                            Section_Selection.Position = UDim2.new(0.501999974, 0, 0.068039082, 0)
                            Section_Selection.Size = UDim2.new(1.00399995, 0, 0.136078179, 0)
                            
                            UICorner.CornerRadius = UDim.new(0.125, 0)
                            UICorner.Parent = Section_Selection
                            
                            Button.Name = "Button"
                            Button.Parent = Section_Selection
                            Button.AnchorPoint = Vector2.new(0.5, 0.5)
                            Button.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
                            Button.BackgroundTransparency = 1.000
                            Button.BorderSizePixel = 0
                            Button.Position = UDim2.new(0.5, 0, 0.5, 0)
                            Button.Size = UDim2.new(1, 0, 1, 0)
                            Button.AutoButtonColor = false
                            Button.Font = Enum.Font.GothamBold
                            Button.Text = ""
                            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Button.TextScaled = true
                            Button.TextSize = 21.000
                            Button.TextWrapped = true
                            
                            LabelH.Name = "LabelH"
                            LabelH.Parent = Section_Selection
                            LabelH.AnchorPoint = Vector2.new(0.5, 0.5)
                            LabelH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            LabelH.BackgroundTransparency = 1.000
                            LabelH.BorderSizePixel = 0
                            LabelH.Position = UDim2.new(0.451438934, 0, 0.50000006, 0)
                            LabelH.Size = UDim2.new(0.877877831, 0, 0.774999976, 0)
                            
                            Label.Name = "Label"
                            Label.Parent = LabelH
                            Label.AnchorPoint = Vector2.new(0.5, 0.5)
                            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Label.BackgroundTransparency = 1.000
                            Label.BorderSizePixel = 0
                            Label.Position = UDim2.new(0.5, 0, 0.5, 0)
                            Label.Size = UDim2.new(1, 0, 1, 0)
                            Label.Font = Enum.Font.GothamBold
                            Label.Text = item
                            Label.TextColor3 = Color3.fromRGB(255, 250, 92)
                            Label.TextScaled = true
                            Label.TextSize = 21.000
                            Label.TextWrapped = true
                            
                            MousePointer.Name = "MousePointer"
                            MousePointer.Parent = Section_Selection
                            MousePointer.AnchorPoint = Vector2.new(0.5, 0.5)
                            MousePointer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            MousePointer.BackgroundTransparency = 1.000
                            MousePointer.BorderSizePixel = 0
                            MousePointer.Position = UDim2.new(0.949999988, 0, 0.479999989, 0)
                            MousePointer.Size = UDim2.new(0.0750001594, 0, 0.675001621, 0)
                            MousePointer.Image = "rbxassetid://11400928498"

                            ----------------------------------------------------------------------------------------------
                            ----------------------------------------------------------------------------------------------

                            local buttonBusy = false
                
                            Button.MouseEnter:Connect(function()
                                if buttonBusy then return end
                                game:GetService("TweenService"):Create(Section_Selection, TweenInfo.new(0.25), {
                                    BackgroundColor3 = Color3.fromRGB(227, 180, 41)
                                }):Play()
                            end)
            
                            Button.MouseLeave:Connect(function()
                                if buttonBusy then return end
                                game:GetService("TweenService"):Create(Section_Selection, TweenInfo.new(0.25), {
                                    BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                                }):Play()
                            end)
            
                            Button.Activated:Connect(function()
                                buttonBusy = true
            
                                task.spawn(function()
                                    pcall(callback, item)
                                end)
            
                                local tween1 = game:GetService("TweenService"):Create(Section_Selection, TweenInfo.new(0.25), {
                                    BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                                })
                                local tween2 = game:GetService("TweenService"):Create(Section_Selection, TweenInfo.new(0.25), {
                                    BackgroundColor3 = Color3.fromRGB(227, 180, 41)
                                })
            
                                tween1:Play()
                                tween1.Completed:Wait()
            
                                tween2:Play()
                                tween2.Completed:Wait()
            
                                buttonBusy = false
                            end)

                        end
                    end
                end

                local function unloadItems()
                    for _, obj in pairs(DropdownH:GetChildren()) do
                        if obj:IsA("Frame") then
                            obj:Destroy()
                        end
                    end
                end

                local function initDropdown()
                    if not open then
                        loadItems()
                        DropdownC:TweenSize(
                            UDim2.fromScale(DropdownC.Size.X, 3.237),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quint,
                            .25
                        )
                    else
                        DropdownC:TweenSize(
                            UDim2.fromScale(DropdownC.Size.X, 0),
                            Enum.EasingDirection.Out,
                            Enum.EasingStyle.Quint,
                            .25
                        )
                        task.wait(.25)
                        unloadItems()
                    end
                end

                Arrow.Activated:Connect(function()
                    if not debounce then
                        debounce = true
                        if not open then
                            local tween = game:GetService("TweenService"):Create(Arrow, TweenInfo.new(.25), {
                                Rotation = 0
                            })
                            task.spawn(initDropdown)
                            tween:Play()
                            tween.Completed:Wait()
                            open = true
                        else
                            local tween = game:GetService("TweenService"):Create(Arrow, TweenInfo.new(.25), {
                                Rotation = -90
                            })
                            task.spawn(initDropdown)
                            tween:Play()
                            tween.Completed:Wait()
                            open = false
                        end
                        debounce = false
                    end
                end)

            end

            return sectionFunctions
        end

        return tabFunctions

    end

    function windowFunctions:ChangeKeybind(newKeybind)
        if not newKeybind then
			return
		end
		local succ = false
		if typeof(newKeybind) == "string" then
			if Enum.KeyCode[newKeybind] then
				_G.LightLibV2.WindowKeybind = Enum.KeyCode[newKeybind]
				succ = true
			end
		elseif typeof(newKeybind) == "EnumItem" then
			if not string.match(tostring(newKeybind), "Enum.KeyCode") then
				return
			end
			_G.LightLibV2.WindowKeybind = newKeybind
			succ = true
		end
		if succ then
			local str = tostring(_G.LightLibV2.WindowKeybind)
			str = string.gsub(str, "Enum.KeyCode.", "")
			warn("New window keybind for window \"" .. windowName .. "\":", str)
		end
    end

    return windowFunctions
    
end

return library