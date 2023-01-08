local function updateLayout(scrlFrame, listLayout)
    scrlFrame.CanvasSize = UDim2.new(0, listLayout.AbsoluteContentSize.X, 0, listLayout.AbsoluteContentSize.Y)
end

local function getNumberOfWindows()
    local num = 0
    for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
        if obj.Name.match("LightLibV2") then
            num += 1
        end
    end
    return num
end

local function getNumberOfTabsInWindow(windowName)
    local window = nil
    for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
        if obj.Name.match(windowName) then
            window = obj
            break
        end
    end
    if window == nil then
        return 0
    end
    return #window["C1"]["C2"]["TabC"]["TabH"]:GetChildren() - 1
end

local function getNumberOfSectionsInTab(tab)
    local num = 0
    for _, obj in pairs(tab:GetChildren()) do
        if obj.Name == "SectionDivider" then
            num += 1
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

library.DeleteAllWindows = function()
    for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
        if obj.Name.match("LightLibV2") then
            obj:Destroy()
        end
    end
end

library.DeleteWindow = function(windowName)
    for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
        if obj.Name.match(windowName) then
            obj:Destroy()
            break
        end
    end
end

library.CreateWindow = function(windowName)
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

    LightLibV2.Name = "LightLibV2_" + (windowName or getNumberOfWindows() + 1) 
    LightLibV2.Parent = game:GetService("CoreGui")
    LightLibV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LightLibV2.ResetOnSpawn = false

    C1.Name = "C1"
    C1.Parent = LightLibV2
    C1.AnchorPoint = Vector2.new(0.5, 0.5)
    C1.BackgroundColor3 = Color3.fromRGB(255, 250, 92)
    C1.BorderSizePixel = 0
    C1.Position = UDim2.new(0.5, 0, 0.502008021, 0)
    C1.Size = UDim2.new(0.550000072, 0, 0.545983911, 0)

    UICorner.CornerRadius = UDim.new(0.0199999996, 0)
    UICorner.Parent = C1

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

    task.spawn(function()
        TabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            updateLayout(TabH, TabLayout)
        end)
        TabH.CanvasSize = UDim2.new(0, TabLayout.AbsoluteContentSize.X, 0, TabLayout.AbsoluteContentSize.Y)
    end)

    ----------------------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------------------

    local windowFunctions = {}

    windowFunctions.CreateTab = function(tabName)
        local TabB = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local RealTabB = Instance.new("TextButton")
        local MainH = Instance.new("ScrollingFrame")
        local MainLayout = Instance.new("UIListLayout")
        local TabBSelected = Instance.new("BoolValue")

        TabB.Name = tabName or getNumberOfTabsInWindow(windowName) + 1
        TabB.Parent = game.StarterGui["LightLibV2"]["C1"]["C2"].TabC.TabH
        TabB.AnchorPoint = Vector2.new(0.5, 0.5)
        TabB.BackgroundColor3 = Color3.fromRGB(255, 203, 46)
        TabB.BorderSizePixel = 0
        TabB.Position = UDim2.new(0.5, 0, 0.038815178, 0)
        TabB.Size = UDim2.new(1, 0, 0.0599999987, 0)

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

        MainLayout.Parent = MainH
        MainLayout.SortOrder = Enum.SortOrder.LayoutOrder
        MainLayout.Padding = UDim.new(0.00999999978, 0)

		TabBSelected.Name = "TabBSelected"
		TabBSelected.Parent = TabB

        ----------------------------------------------------------------------------------------------
        ----------------------------------------------------------------------------------------------

        task.spawn(function()
            if getNumberOfTabsInWindow(windowName) == 0 then
                MainH.Visible = true
            end
        end)

        task.spawn(function()
            MainLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                updateLayout(MainH, MainLayout)
            end)
            MainH.CanvasSize = UDim2.new(0, MainLayout.AbsoluteContentSize.X, 0, MainLayout.AbsoluteContentSize.Y)
        end)

        task.spawn(function()
            RealTabB.MouseEnter:Connect(function()
                if TabBSelected.Value == true then return end
                game:GetService("TweenService"):Create(TabB, 0.25, {
                    BackgroundColor3 = Color3.fromRGB(236, 184, 25)
                }):Play()
            end)

            RealTabB.MouseLeave:Connect(function()
                if TabBSelected.Value == true then return end
                game:GetService("TweenService"):Create(TabB, 0.25, {
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

                    game:GetService("TweenService"):Create(TabB, 0.25, {
                        BackgroundColor3 = Color3.fromRGB(236, 184, 25)
                    }):Play()

                    game:GetService("TweenService"):Create(TabB, 0.25, {
                        BackgroundColor3 = Color3.fromRGB(255, 203, 46)
                    }):Play()

                end
            end)
        end)

        ----------------------------------------------------------------------------------------------
        ----------------------------------------------------------------------------------------------

        local tabFunctions = {}

        tabFunctions.CreateSection = function()
            if getNumberOfSectionsInTab(MainH) > 0 then
                createSectionEnder(MainH)
                createSectionDivider(MainH)
                createSectionEnder(MainH)
            end

            local sectionFunctions = {}

            sectionFunctions.CreateLabel = function(...)
                local args = {...}
                args = args[1]
    
                local labelText = args["Text"] or "This is just a text label. Nothing much, really. Why are you still reading this?"
    
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
    
            sectionFunctions.CreateButton = function(...)
                local args = {...}
                args = args[1]
    
                local buttonText = args["Text"] or args[1]
                local callback = args["Callback"] or args[2]
            end
    
            sectionFunctions.CreateNumberInput = function(...)
                local args = {...}
                args = args[1]
    
                
            end
    
            sectionFunctions.CreateDropdown = function(...)
                local args = {...}
                args = args[1]
    
                
            end
    
            sectionFunctions.CreateToggle = function(...)
                local args = {...}
                args = args[1]
    
                
            end
    
            sectionFunctions.CreateSlider = function(...)
                local args = {...}
                args = args[1]
    
                
            end
    
            sectionFunctions.CreateKeybind = function(...)
                local args = {...}
                args = args[1]
    
                
            end

            return sectionFunctions
        end

        return tabFunctions

    end

    windowFunctions.ChangeKeybind = function(newKeybind)
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
			warn("New window keybind for window \"" + windowName + "\":", str)
		end
    end

    return windowFunctions
    
end

return library