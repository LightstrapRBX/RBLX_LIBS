local library = {}

function library:CreateWindow(windowName, keybind)

	for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
		if obj.Name == "LightLib_Hub" then
			obj:Destroy()
		end
	end

	local LightLib_Hub = Instance.new("ScreenGui")
	local Container = Instance.new("Frame")
	local Drag = Instance.new("Frame")
	
	local Border = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	
	local Window = Instance.new("Frame")
	local WindowCorner = Instance.new("UICorner")
	
	local TitleContainer = Instance.new("Frame")
	local HubNameText = Instance.new("TextLabel")
	
	local UpdatedContainer = Instance.new("Frame")
	local UpdatedTimeText = Instance.new("TextLabel")
	
	local TabContainer = Instance.new("Frame")
	local TabCorner = Instance.new("UICorner")
	local TabHolder = Instance.new("ScrollingFrame")
	local TabHolderLayout = Instance.new("UIListLayout")
	
	local TabDataContainer = Instance.new("Frame")
	local TabDataCorner = Instance.new("UICorner")
	local DataHolder = Instance.new("ScrollingFrame")
	local DataHolderLayout = Instance.new("UIListLayout")
	
	LightLib_Hub.Name = "LightLib_Hub"
	LightLib_Hub.Parent = game:GetService("CoreGui")
	LightLib_Hub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	LightLib_Hub.ResetOnSpawn = false

	Container.Name = "Container"
	Container.Parent = LightLib_Hub
	Container.AnchorPoint = Vector2.new(0.5, 0.5)
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0.5, 0, 0.5, 0)
	Container.Size = UDim2.new(0.5, 0, 0.5, 0)

	Drag.Name = "Drag"
	Drag.Parent = Container
	Drag.Active = true
	Drag.AnchorPoint = Vector2.new(0.5, 0.5)
	Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Drag.BackgroundTransparency = 1.000
	Drag.BorderSizePixel = 0
	Drag.Draggable = true
	Drag.Position = UDim2.new(0.5, 0, 0.0500000007, 0)
	Drag.Size = UDim2.new(1, 0, 0.100000001, 0)
	Drag.ZIndex = 0
	
	Border.Name = "Border"
	Border.Parent = Drag
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Border.BackgroundTransparency = 1.000
	Border.Position = UDim2.new(0.5, 0, 4.98170328, 0)
	Border.Size = UDim2.new(0.646, 0, 11.176, 0)
	
	local originalBorderPosition = Border.Position
	local originalBorderSize = Border.Size

	UICorner.CornerRadius = UDim.new(0.0199999996, 0)
	UICorner.Parent = Border
	
	Window.Name = "Window"
	Window.Parent = Drag
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Window.BackgroundTransparency = 0.050
	Window.Position = UDim2.new(0.5, 0, 4.98170471, 0)
	Window.Size = UDim2.new(0.63, 0, 10.746, 0)
	
	local originalWindowPosition = Window.Position
	local originalWindowSize = Window.Size

	WindowCorner.CornerRadius = UDim.new(0.0199999996, 0)
	WindowCorner.Name = "WindowCorner"
	WindowCorner.Parent = Window

	TabContainer.Name = "TabContainer"
	TabContainer.Parent = Window
	TabContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	TabContainer.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	TabContainer.BorderSizePixel = 0
	TabContainer.Position = UDim2.new(0.185000032, 0, 0.537698388, 0)
	TabContainer.Size = UDim2.new(0.328999996, 0, 0.864603221, 0)

	TabCorner.CornerRadius = UDim.new(0.0199999996, 0)
	TabCorner.Name = "TabCorner"
	TabCorner.Parent = TabContainer

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = TabContainer
	TabHolder.Active = true
	TabHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	TabHolder.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	TabHolder.BackgroundTransparency = 1.000
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0.555480063, 0, 0.5, 0)
	TabHolder.Size = UDim2.new(1.11096001, 0, 1, 0)
	TabHolder.ScrollBarThickness = 9

	TabHolderLayout.Name = "TabHolderLayout"
	TabHolderLayout.Parent = TabHolder
	TabHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabHolderLayout.Padding = UDim.new(0.00300000003, 0)
	
	TabDataContainer.Name = "TabDataContainer"
	TabDataContainer.Parent = Window
	TabDataContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	TabDataContainer.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	TabDataContainer.BorderSizePixel = 0
	TabDataContainer.Position = UDim2.new(0.678481102, 0, 0.535849214, 0)
	TabDataContainer.Size = UDim2.new(0.610616624, 0, 0.860904753, 0)
	
	TabDataCorner.CornerRadius = UDim.new(0.0199999996, 0)
	TabDataCorner.Name = "TabDataCorner"
	TabDataCorner.Parent = TabDataContainer
	
	DataHolder.Name = "DataHolder"
	DataHolder.Parent = TabDataContainer
	DataHolder.Active = true
	DataHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	DataHolder.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	DataHolder.BackgroundTransparency = 1.000
	DataHolder.BorderSizePixel = 0
	DataHolder.Position = UDim2.new(0.555480063, 0, 0.5, 0)
	DataHolder.Size = UDim2.new(1.11096001, 0, 1, 0)
	DataHolder.ScrollBarThickness = 9

	DataHolderLayout.Name = "DataHolderLayout"
	DataHolderLayout.Parent = DataHolder
	DataHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
	DataHolderLayout.Padding = UDim.new(0.00300000003, 0)
	
	TitleContainer.Name = "TitleContainer"
	TitleContainer.Parent = Window
	TitleContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	TitleContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleContainer.BackgroundTransparency = 1.000
	TitleContainer.BorderSizePixel = 0
	TitleContainer.Position = UDim2.new(0.189999998, 0, 0.0520000011, 0)
	TitleContainer.Size = UDim2.new(0.329584777, 0, 0.0523809493, 0)
	
	HubNameText.Name = "HubNameText"
	HubNameText.Parent = TitleContainer
	HubNameText.AnchorPoint = Vector2.new(0.5, 0.5)
	HubNameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HubNameText.BackgroundTransparency = 1.000
	HubNameText.BorderSizePixel = 0
	HubNameText.Position = UDim2.new(0.5, 0, 0.5, 0)
	HubNameText.Size = UDim2.new(1, 0, 1, 0)
	HubNameText.Font = Enum.Font.GothamBlack
	HubNameText.Text = windowName or "HUB"
	HubNameText.TextColor3 = Color3.fromRGB(58, 58, 58)
	HubNameText.TextScaled = true
	HubNameText.TextSize = 14.000
	HubNameText.TextWrapped = true
	HubNameText.TextXAlignment = Enum.TextXAlignment.Left
	
	UpdatedContainer.Name = "UpdatedContainer"
	UpdatedContainer.Parent = Window
	UpdatedContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	UpdatedContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UpdatedContainer.BackgroundTransparency = 1.000
	UpdatedContainer.BorderSizePixel = 0
	UpdatedContainer.Position = UDim2.new(0.81400001, 0, 0.0520000011, 0)
	UpdatedContainer.Size = UDim2.new(0.329584777, 0, 0.0523809493, 0)

	UpdatedTimeText.Name = "UpdatedTimeText"
	UpdatedTimeText.Parent = UpdatedContainer
	UpdatedTimeText.AnchorPoint = Vector2.new(0.5, 0.5)
	UpdatedTimeText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UpdatedTimeText.BackgroundTransparency = 1.000
	UpdatedTimeText.BorderSizePixel = 0
	UpdatedTimeText.Position = UDim2.new(0.5, 0, 0.5, 0)
	UpdatedTimeText.Size = UDim2.new(1, 0, 1, 0)
	UpdatedTimeText.Font = Enum.Font.GothamBlack
	UpdatedTimeText.Text = "Last Updated: 08/24/2022"
	UpdatedTimeText.TextColor3 = Color3.fromRGB(58, 58, 58)
	UpdatedTimeText.TextScaled = true
	UpdatedTimeText.TextSize = 14.000
	UpdatedTimeText.TextWrapped = true
	UpdatedTimeText.TextXAlignment = Enum.TextXAlignment.Right

	keybind = keybind or Enum.KeyCode.RightControl
	
	task.spawn(function()
		local UIS = game:GetService("UserInputService")
		local UI_TOGGLED = true
		local debounce = false
		UIS.InputBegan:Connect(function(input)
			if input.KeyCode == keybind then
				if debounce then return end
				debounce = true
				UI_TOGGLED = not UI_TOGGLED
				if UI_TOGGLED then
					task.spawn(function()
						Window:TweenSizeAndPosition(
							originalWindowSize,
							originalWindowPosition,
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Cubic,
							.5
						)
					end)
					Border:TweenSizeAndPosition(
						originalBorderSize,
						originalBorderPosition,
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Cubic,
						.5
					)
					Drag.Active = true
					Drag.Visible = true
				elseif UI_TOGGLED ~= true then
					task.spawn(function()
						Window:TweenSizeAndPosition(
							UDim2.fromScale(0, 0),
							UDim2.fromScale(0, 0),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Cubic,
							.5
						)
					end)
					Border:TweenSizeAndPosition(
						UDim2.fromScale(0, 0),
						UDim2.fromScale(0, 0),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Cubic,
						.5
					)
					Drag.Active = false
					Drag.Visible = false
				end
				task.wait(.25)
				debounce = false
			end
		end)
	end)
	
	local tabs = {tabOBJs = {}}
	
	tabs.CreateTab = function(tabName)
		if not tabs.tabOBJs[tabName] then
			table.insert(tabs.tabOBJs, tabName)
		else
			local amt = 0
			for _, tabObjName in pairs(tabs.tabOBJs) do
				if tabObjName == tabName then
					amt = amt + 1
				end
			end
			table.insert(tabs.tabOBJs, tabName .. "_" .. amt)
		end
		
		local TabBtn = Instance.new("TextButton")
		local TabBtnText = Instance.new("TextLabel")
		local TabBtnDivider = Instance.new("Frame")
		
		TabBtn.Name = "TabBtn"
		TabBtn.Parent = TabHolder
		TabBtn.AnchorPoint = Vector2.new(0.5, 0.5)
		TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		TabBtn.BorderSizePixel = 0
		TabBtn.Size = UDim2.new(0.899999976, 0, 0.0599999987, 0)
		TabBtn.AutoButtonColor = false
		TabBtn.Font = Enum.Font.Oswald
		TabBtn.Text = ""
		TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabBtn.TextScaled = true
		TabBtn.TextSize = 14.000
		TabBtn.TextWrapped = true

		TabBtnText.Name = "TabBtnText"
		TabBtnText.Parent = TabBtn
		TabBtnText.AnchorPoint = Vector2.new(0.5, 0.5)
		TabBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabBtnText.BackgroundTransparency = 1.000
		TabBtnText.BorderSizePixel = 0
		TabBtnText.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabBtnText.Size = UDim2.new(0.699999988, 0, 0.600000024, 0)
		TabBtnText.Font = Enum.Font.GothamBold
		TabBtnText.Text = tabName or ("Tab " .. #tabs.tabOBJs)
		TabBtnText.TextColor3 = Color3.fromRGB(58, 58, 58)
		TabBtnText.TextScaled = true
		TabBtnText.TextSize = 14.000
		TabBtnText.TextWrapped = true
		
		TabBtnDivider.Name = "TabBtnDivider"
		TabBtnDivider.Parent = TabBtn
		TabBtnDivider.AnchorPoint = Vector2.new(0.5, 0.5)
		TabBtnDivider.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
		TabBtnDivider.BorderSizePixel = 0
		TabBtnDivider.Position = UDim2.new(0.5, 0, 1, 0)
		TabBtnDivider.Size = UDim2.new(1, 0, 0.075000003, 0)
		
		local tabData = {}
		
		tabData.CreateButton = function(name, callback)
			if typeof(callback) == "function" then
				local DataBtn = Instance.new("TextButton")
				local BtnText = Instance.new("TextLabel")
				local DataBtnDivider = Instance.new("Frame")
				
				local function getNumOfBTNs()
					local numOfBTNs = 0
					for _, obj in DataHolder:GetChildren() do
						if obj:IsA("TextButton") then
							numOfBTNs = numOfBTNs + 1
						end
					end
					return numOfBTNs
				end
				
				DataBtn.Name = "DataBtn"
				DataBtn.Parent = DataHolder
				DataBtn.AnchorPoint = Vector2.new(0.5, 0.5)
				DataBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				DataBtn.BorderSizePixel = 0
				DataBtn.Size = UDim2.new(0.899999976, 0, 0.0599999987, 0)
				DataBtn.AutoButtonColor = false
				DataBtn.Font = Enum.Font.Oswald
				DataBtn.Text = ""
				DataBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
				DataBtn.TextScaled = true
				DataBtn.TextSize = 14.000
				DataBtn.TextWrapped = true

				BtnText.Name = "BtnText"
				BtnText.Parent = DataBtn
				BtnText.AnchorPoint = Vector2.new(0.5, 0.5)
				BtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BtnText.BackgroundTransparency = 1.000
				BtnText.BorderSizePixel = 0
				BtnText.Position = UDim2.new(0.5, 0, 0.5, 0)
				BtnText.Size = UDim2.new(0.699999988, 0, 0.600000024, 0)
				BtnText.Font = Enum.Font.GothamBold
				BtnText.Text = name or ("Button " .. getNumOfBTNs())
				BtnText.TextColor3 = Color3.fromRGB(58, 58, 58)
				BtnText.TextScaled = true
				BtnText.TextSize = 14.000
				BtnText.TextWrapped = true
				
				DataBtnDivider.Name = "DataBtnDivider"
				DataBtnDivider.Parent = DataBtn
				DataBtnDivider.AnchorPoint = Vector2.new(0.5, 0.5)
				DataBtnDivider.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
				DataBtnDivider.BorderSizePixel = 0
				DataBtnDivider.Position = UDim2.new(0.5, 0, 1, 0)
				DataBtnDivider.Size = UDim2.new(1, 0, 0.075000003, 0)
				
				DataBtn.Activated:Connect(callback)
			end
		end
		
		tabData.CreateLabel = function(text)
			local DataTxtLbl = Instance.new("Frame")
			local Lbl = Instance.new("TextLabel")
			local DataTxtLblDivider = Instance.new("Frame")
			
			local function getNumOfLBLs()
				local numOfLBLs = 0
				for _, obj in DataHolder:GetChildren() do
					if obj.Name == "DataTxtLbl" then
						numOfLBLs = numOfLBLs + 1
					end
				end
				return numOfLBLs
			end
			
			DataTxtLbl.Name = "DataTxtLbl"
			DataTxtLbl.Parent = DataHolder
			DataTxtLbl.AnchorPoint = Vector2.new(0.5, 0.5)
			DataTxtLbl.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			DataTxtLbl.BorderColor3 = Color3.fromRGB(27, 42, 53)
			DataTxtLbl.BorderSizePixel = 0
			DataTxtLbl.Size = UDim2.new(0.899999976, 0, 0.0599999987, 0)
			
			Lbl.Name = "Lbl"
			Lbl.Parent = DataTxtLbl
			Lbl.AnchorPoint = Vector2.new(0.5, 0.5)
			Lbl.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Lbl.BackgroundTransparency = 1.000
			Lbl.BorderSizePixel = 0
			Lbl.Position = UDim2.new(0.5, 0, 0.5, 0)
			Lbl.Size = UDim2.new(0.699999988, 0, 0.600000024, 0)
			Lbl.Font = Enum.Font.GothamBold
			Lbl.Text = text or ("Label " .. getNumOfLBLs())
			Lbl.TextColor3 = Color3.fromRGB(58, 58, 58)
			Lbl.TextScaled = true
			Lbl.TextSize = 14.000
			Lbl.TextWrapped = true
			
			DataTxtLblDivider.Name = "DataTxtLblDivider"
			DataTxtLblDivider.Parent = DataTxtLbl
			DataTxtLblDivider.AnchorPoint = Vector2.new(0.5, 0.5)
			DataTxtLblDivider.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
			DataTxtLblDivider.BorderSizePixel = 0
			DataTxtLblDivider.Position = UDim2.new(0.5, 0, 1, 0)
			DataTxtLblDivider.Size = UDim2.new(1, 0, 0.075000003, 0)
		end
		
		tabData.CreateToggle = function(name, default, callback)
			if typeof(callback) == "function" then
				local DataTgl = Instance.new("Frame")
				local DataTglLbl = Instance.new("TextLabel")
				local DataTglDivider = Instance.new("Frame")
				local TglBtn = Instance.new("TextButton")
				local TglStatus = Instance.new("TextLabel")
				
				local function getNumOfTGLs()
					local numOfTGLs = 0
					for _, obj in DataHolder:GetChildren() do
						if obj.Name == "DataTgl" then
							numOfTGLs = numOfTGLs + 1
						end
					end
					return numOfTGLs
				end
				
				local status
				
				if default then
					status = "ON"
				elseif default ~= true then
					status = "OFF"
				end
				
				local onColor = Color3.fromRGB(139, 139, 139)
				local offColor = Color3.fromRGB(58, 58, 58)
				
				local toggled = default
				
				DataTgl.Name = "DataTgl"
				DataTgl.Parent = DataHolder
				DataTgl.AnchorPoint = Vector2.new(0.5, 0.5)
				DataTgl.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				DataTgl.BorderColor3 = Color3.fromRGB(27, 42, 53)
				DataTgl.BorderSizePixel = 0
				DataTgl.Size = UDim2.new(0.899999976, 0, 0.0599999987, 0)
				
				DataTglLbl.Name = "DataTglLbl"
				DataTglLbl.Parent = DataTgl
				DataTglLbl.AnchorPoint = Vector2.new(0.5, 0.5)
				DataTglLbl.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				DataTglLbl.BackgroundTransparency = 1.000
				DataTglLbl.BorderSizePixel = 0
				DataTglLbl.Position = UDim2.new(0.324374288, 0, 0.5, 0)
				DataTglLbl.Size = UDim2.new(0.450000077, 0, 0.600000024, 0)
				DataTglLbl.Font = Enum.Font.GothamBold
				DataTglLbl.Text = name or getNumOfTGLs()
				DataTglLbl.TextColor3 = Color3.fromRGB(58, 58, 58)
				DataTglLbl.TextScaled = true
				DataTglLbl.TextSize = 14.000
				DataTglLbl.TextWrapped = true
				
				DataTglDivider.Name = "Divider"
				DataTglDivider.Parent = DataTgl
				DataTglDivider.AnchorPoint = Vector2.new(0.5, 0.5)
				DataTglDivider.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
				DataTglDivider.BorderSizePixel = 0
				DataTglDivider.Position = UDim2.new(0.5, 0, 1, 0)
				DataTglDivider.Size = UDim2.new(1, 0, 0.075000003, 0)

				TglBtn.Name = "TglBtn"
				TglBtn.Parent = DataTgl
				TglBtn.AnchorPoint = Vector2.new(0.5, 0.5)
				TglBtn.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
				TglBtn.BorderSizePixel = 0
				TglBtn.Position = UDim2.new(0.73078078, 0, 0.499999851, 0)
				TglBtn.Size = UDim2.new(0.164690003, 0, 0.649999976, 0)
				TglBtn.AutoButtonColor = false
				TglBtn.Font = Enum.Font.SourceSans
				TglBtn.Text = ""
				TglBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				TglBtn.TextSize = 14.000

				TglStatus.Name = "TglStatus"
				TglStatus.Parent = DataTgl
				TglStatus.AnchorPoint = Vector2.new(0.5, 0.5)
				
				if status == "OFF" then
					TglStatus.BackgroundColor3 = offColor
				elseif status == "ON" then
					TglStatus.BackgroundColor3 = onColor
				end
				
				TglStatus.BackgroundTransparency = 1.000
				TglStatus.BorderSizePixel = 0
				TglStatus.Position = UDim2.new(0.899374306, 0, 0.5, 0)
				TglStatus.Size = UDim2.new(0.100000001, 0, 0.600000024, 0)
				TglStatus.Font = Enum.Font.GothamBold
				TglStatus.Text = status
				TglStatus.TextColor3 = Color3.fromRGB(58, 58, 58)
				TglStatus.TextScaled = true
				TglStatus.TextSize = 14.000
				TglStatus.TextWrapped = true
				
				TglBtn.Activated:Connect(function()
					toggled = not toggled
					if toggled then
						status = "ON"
						TglStatus.BackgroundColor3 = onColor
					elseif toggled ~= true then
						status = "OFF"
						TglStatus.BackgroundColor3 = offColor
					end
					TglStatus.Text = status
					
					callback(toggled)
				end)
			end
		end
		
		return tabData
	end
	
	return tabs
end

return library