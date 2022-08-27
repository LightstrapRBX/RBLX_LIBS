local library = {
	VERSION = "1.0.2.4 [PATCH 1.82]",
	THEMES = {
		Default = {

		},
		Dark = {
			Window = {
				BackgroundColor3 = Color3.fromRGB(25, 25, 25),
				WindowStroke = {
					Color = Color3.fromRGB(0, 0, 0),
				},
				TabContainer = {
					BackgroundColor3 = Color3.fromRGB(43, 43, 43),
					TabStroke = {
						Color = Color3.fromRGB(16, 16, 16)
					},
					TabHolder = {
						BackgroundColor3 = Color3.fromRGB(43, 43, 43),
						TabBtn = {
							NoHover = Color3.fromRGB(35, 35, 35),
							Hover = Color3.fromRGB(24, 24, 24),
							Selected = Color3.fromRGB(53, 53, 53),
							TabBtnStroke = {
								NoHover = Color3.fromRGB(21, 21, 21),
								Hover = Color3.fromRGB(104, 104, 104),
								Selected = Color3.fromRGB(87, 87, 87)
							},
							TabBtnText = {
								TextColor3 = Color3.fromRGB(157, 157, 157)
							},
							TglBg = {
								BackgroundColor3 = Color3.fromRGB(25, 25, 25)
							},
							TglBtn = {
								BackgroundColor3 = Color3.fromRGB(77, 77, 77)
							}
						}
					},
				},
				TabDataContainer = {
					BackgroundColor3 = Color3.fromRGB(43, 43, 43),
					TabDataStroke = {
						Color = Color3.fromRGB(16, 16, 16)
					},
					DataHolder = {
						TabData = {
							DataBtn = {
								NoHover = Color3.fromRGB(35, 35, 35),
								Hover = Color3.fromRGB(24, 24, 24),
								Clicked = Color3.fromRGB(16, 16, 16),
								TextColor3 = Color3.fromRGB(255, 255, 255),
								DataBtnStroke = {
									NoHover = Color3.fromRGB(21, 21, 21),
									Hover = Color3.fromRGB(104, 104, 104),
									Clicked = Color3.fromRGB(63, 63, 63),
								}
							},
							DataTxtLbl = {
								NoHover = Color3.fromRGB(35, 35, 35),
								Hover = Color3.fromRGB(24, 24, 24),
								BackgroundColor3 = Color3.fromRGB(35, 35, 35),
								Lbl = {
									BackgroundColor3 = Color3.fromRGB(35, 35, 35)
								},
								DataTxtStroke = {
									NoHover = Color3.fromRGB(21, 21, 21),
									Hover = Color3.fromRGB(104, 104, 104),
								}
							},
							DataTgl = {
								NoHover = Color3.fromRGB(35, 35, 35),
								Hover = Color3.fromRGB(24, 24, 24),
								DataTxtLbl = {
									BackgroundColor3 = Color3.fromRGB(35, 35, 35),
									ON = Color3.fromRGB(139, 139, 139),
									OFF = Color3.fromRGB(58, 58, 58)
								},
								TglBg = {
									BackgroundColor3 = Color3.fromRGB(25, 25, 25),
									Hover = Color3.fromRGB(38, 38, 38),
									NoHover = Color3.fromRGB(25, 25, 25),
									TglBtn = {
										BackgroundColor3 = Color3.fromRGB(77, 77, 77),
										ON = Color3.fromRGB(139, 139, 139),
										OFF = Color3.fromRGB(58, 58, 58)
									}
								},
								DataTglLbl = {
									ON = Color3.fromRGB(139, 139, 139),
									OFF = Color3.fromRGB(58, 58, 58)
								},
								TglStatus = {
									ON = Color3.fromRGB(139, 139, 139),
									OFF = Color3.fromRGB(58, 58, 58)
								},
								DataTglStroke = {
									NoHover = Color3.fromRGB(21, 21, 21),
									Hover = Color3.fromRGB(104, 104, 104),
								}
							}
						}
					}
				},
				TitleContainer = {
					HubNameText = {
						TextColor3 = Color3.fromRGB(58, 58, 58)
					}
				},
				UpdatedContainer = {
					UpdatedTimeText = {
						TextColor3 = Color3.fromRGB(58, 58, 58)
					}
				}
			}
		}
	}
}

warn("Required library: VERSION = ", library.VERSION)

function library:CreateWindow(windowName, keybind, theme)

	for _, obj in pairs(game:GetService("CoreGui"):GetChildren()) do
		if obj.Name == "LightLib_Hub" then
			obj:Destroy()
		end
	end

	theme = tostring(theme)
	theme = string.upper(string.sub(theme, 1, 1)) .. string.lower(string.sub(theme, 2, #theme))

	if typeof(theme) ~= "string" or not theme or not library.THEMES[theme] then
		_G.LightLib_Hub_THEME = library.THEMES.Default
	else
		_G.LightLib_Hub_THEME = library.THEMES[theme]
	end

	local LightLib_Hub = Instance.new("ScreenGui")
	local Container = Instance.new("Frame")
	local Drag = Instance.new("Frame")

	local Window = Instance.new("Frame")
	local WindowCorner = Instance.new("UICorner")
	local WindowStroke = Instance.new("UIStroke")

	local TitleContainer = Instance.new("Frame")
	local HubNameText = Instance.new("TextLabel")

	local UpdatedContainer = Instance.new("Frame")
	local UpdatedTimeText = Instance.new("TextLabel")

	local TabContainer = Instance.new("Frame")
	local TabCorner = Instance.new("UICorner")
	local TabStroke = Instance.new("UIStroke")
	local TabHolder = Instance.new("ScrollingFrame")
	local TabHolderLayout = Instance.new("UIListLayout")

	local TabDataContainer = Instance.new("Frame")
	local TabDataCorner = Instance.new("UICorner")
	local TabDataStroke = Instance.new("UIStroke")

	local DataHolder = Instance.new("Frame")

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
	Drag.Position = UDim2.new(0.5, 0, 0.1, 0)
	Drag.Size = UDim2.new(0.6, 0, 0.1, 0)
	Drag.ZIndex = 0
	Drag.SelectionOrder = 10

	Window.Name = "Window"
	Window.Parent = Drag
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.BackgroundColor3
	Window.BackgroundTransparency = 0.050
	Window.Position = UDim2.new(0.5, 0, 4, 0)
	Window.Size = UDim2.new(1, 0, 7.746, 0)

	WindowCorner.CornerRadius = UDim.new(0.02, 0)
	WindowCorner.Name = "WindowCorner"
	WindowCorner.Parent = Window

	WindowStroke.Name = "WindowStroke"
	WindowStroke.Parent = Window
	WindowStroke.ApplyStrokeMode = "Contextual"
	WindowStroke.Color = _G.LightLib_Hub_THEME.Window.WindowStroke.Color
	WindowStroke.LineJoinMode = "Round"
	WindowStroke.Thickness = 2.5

	TabContainer.Name = "TabContainer"
	TabContainer.Parent = Window
	TabContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	TabContainer.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.BackgroundColor3
	TabContainer.BorderSizePixel = 0
	TabContainer.Position = UDim2.new(0.171, 0, 0.538, 0)
	TabContainer.Size = UDim2.new(0.3, 0, 0.864, 0)
	TabContainer.ClipsDescendants = true

	TabCorner.CornerRadius = UDim.new(0.02, 0)
	TabCorner.Name = "TabCorner"
	TabCorner.Parent = TabContainer

	TabStroke.ApplyStrokeMode = "Contextual"
	TabStroke.Color = _G.LightLib_Hub_THEME.Window.TabContainer.TabStroke.Color
	TabStroke.LineJoinMode = "Round"
	TabStroke.Thickness = 2
	TabStroke.Name = "TabStroke"
	TabStroke.Parent = TabContainer

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = TabContainer
	TabHolder.Active = true
	TabHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	TabHolder.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.BackgroundColor3
	TabHolder.BackgroundTransparency = 1.000
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0.501, 0, 0.5, 0)
	TabHolder.Size = UDim2.new(0.928, 0, 0.953, 0)
	TabHolder.ScrollBarImageTransparency = 1
	TabHolder.ClipsDescendants = false

	TabHolderLayout.Name = "TabHolderLayout"
	TabHolderLayout.Parent = TabHolder
	TabHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabHolderLayout.Padding = UDim.new(0.02, 0)

	TabDataContainer.Name = "TabDataContainer"
	TabDataContainer.Parent = Window
	TabDataContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	TabDataContainer.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.BackgroundColor3
	TabDataContainer.BorderSizePixel = 0
	TabDataContainer.Position = UDim2.new(0.661, 0, 0.538, 0)
	TabDataContainer.Size = UDim2.new(0.645, 0, 0.864, 0)
	TabDataContainer.ClipsDescendants = true

	TabDataCorner.CornerRadius = UDim.new(0.02, 0)
	TabDataCorner.Name = "TabDataCorner"
	TabDataCorner.Parent = TabDataContainer

	TabDataStroke.Name = "TabDataStroke"
	TabDataStroke.Parent = TabDataContainer
	TabDataStroke.ApplyStrokeMode = "Contextual"
	TabDataStroke.Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.TabDataStroke.Color
	TabDataStroke.LineJoinMode = "Round"
	TabDataStroke.Thickness = 2

	DataHolder.Name = "DataHolder"
	DataHolder.Parent = TabDataContainer
	DataHolder.Active = true
	DataHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	DataHolder.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	DataHolder.BackgroundTransparency = 1.000
	DataHolder.BorderSizePixel = 0
	DataHolder.Position = UDim2.new(0.555, 0, 0.5, 0)
	DataHolder.Size = UDim2.new(1.111, 0, 1, 0)
	DataHolder.ClipsDescendants = false

	local function update1()
		TabHolder.CanvasSize = UDim2.new(0, TabHolderLayout.AbsoluteContentSize.X, 0, TabHolderLayout.AbsoluteContentSize.Y)
	end
	TabHolderLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(update1)
	TabHolder.CanvasSize = UDim2.new(0, TabHolderLayout.AbsoluteContentSize.X, 0, TabHolderLayout.AbsoluteContentSize.Y)

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
	HubNameText.TextColor3 = _G.LightLib_Hub_THEME.Window.TitleContainer.HubNameText.TextColor3
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

	task.spawn(function()
		while LightLib_Hub do
			local time = os.date("*t")
			UpdatedTimeText.Text = tostring((os.date("%A, %m %B %Y | ") .. ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec)))
			task.wait(0.1)
		end
	end)

	UpdatedTimeText.TextColor3 = _G.LightLib_Hub_THEME.Window.UpdatedContainer.UpdatedTimeText.TextColor3
	UpdatedTimeText.TextScaled = true
	UpdatedTimeText.TextSize = 14.000
	UpdatedTimeText.TextWrapped = true
	UpdatedTimeText.TextXAlignment = Enum.TextXAlignment.Right

	if not keybind then
		_G.LightLib_Hub_KEYBIND = Enum.KeyCode.RightControl
	else
		if typeof(keybind) == "string" then
			keybind = keybind:upper()
			if not Enum.KeyCode[keybind] then
				_G.LightLib_Hub_KEYBIND = Enum.KeyCode.RightControl
			else
				_G.LightLib_Hub_KEYBIND = Enum.KeyCode[keybind]
			end
		elseif typeof(keybind) == "EnumItem" then
			if not string.match(tostring(keybind), "Enum.KeyCode") then
				_G.LightLib_Hub_KEYBIND = Enum.KeyCode.RightControl
			else
				_G.LightLib_Hub_KEYBIND = keybind
			end
		end
	end

	task.spawn(function()
		local UIS = game:GetService("UserInputService")
		local UI_TOGGLED = true
		local debounce = false
		UIS.InputBegan:Connect(function(input)
			if input.KeyCode == _G.LightLib_Hub_KEYBIND then
				if debounce then return end
				debounce = true
				UI_TOGGLED = not UI_TOGGLED
				if UI_TOGGLED then
					Window:TweenSize(
						UDim2.new(1, 0, 7.746, 0),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						0.6,
						true
					)
					task.wait(0.6)
					Drag.Active = true
					Drag.Visible = true
				elseif UI_TOGGLED ~= true then
					Window:TweenSize(
						UDim2.new(0, 0, 0, 0),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						0.6,
						true
					)
					task.wait(0.6)
					Drag.Active = false
					Drag.Visible = false
				end
				task.wait(0.25)
				debounce = false
			end
		end)
	end)

	local tabs = {
		currentTabs = {}
	}

	function tabs:CreateTab(tabName)
		local TabData = Instance.new("ScrollingFrame")
		local TabDataLayout = Instance.new("UIListLayout")

		local TabBtn = Instance.new("TextButton")
		local TabBtnText = Instance.new("TextLabel")
		local TabBtnCorner = Instance.new("UICorner")
		local TabBtnStroke = Instance.new("UIStroke")
		local TabBtnSelected = Instance.new("BoolValue")

		TabData.AnchorPoint = Vector2.new(0.5, 0.5)
		TabData.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabData.BackgroundTransparency = 1.000
		TabData.Position = UDim2.new(0.497, 0, 0.486, 0)
		TabData.Size = UDim2.new(0.952, 0, 0.93, 0)
		TabData.Name = #DataHolder:GetChildren() + 1
		TabData.Parent = DataHolder
		TabData.ClipsDescendants = false

		--print("New tab name:", TabData.Name)

		if not table.find(tabs.currentTabs, TabData.Name) then
			table.insert(tabs.currentTabs, TabData.Name)
		else
			local amtOfSame = 0
			for _, tn in ipairs(tabs.currentTabs) do
				if tn == TabData.Name then
					amtOfSame = amtOfSame + 1
				end
			end
			table.insert(tabs.currentTabs, TabData.Name .. "_SAME_NAME_" .. tostring(amtOfSame))
		end

		--[[for ind, val in ipairs(tabs.currentTabs) do
			print(ind, ": ", val)
		end]]

		TabDataLayout.Name = "TabDataLayout"
		TabDataLayout.Parent = TabData
		TabDataLayout.SortOrder = Enum.SortOrder.LayoutOrder
		TabDataLayout.Padding = UDim.new(0.02, 0)

		TabBtn.Name = #TabHolder:GetChildren() --- 1 --"TabBtn"
		TabBtn.Parent = TabHolder
		TabBtn.AnchorPoint = Vector2.new(0.5, 0.5)
		TabBtn.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.Selected
		TabBtn.BorderSizePixel = 0
		TabBtn.Size = UDim2.new(1, 0, 0.075, 0)
		TabBtn.AutoButtonColor = false
		TabBtn.Font = Enum.Font.Oswald
		TabBtn.Text = ""
		TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabBtn.TextScaled = true
		TabBtn.TextSize = 14.000
		TabBtn.TextWrapped = true
		
		TabBtnCorner.CornerRadius = UDim.new(0.02, 0)
		TabBtnCorner.Name = "TabBtnCorner"
		TabBtnCorner.Parent = TabBtn

		TabBtnStroke.Name = "TabBtnStroke"
		TabBtnStroke.Parent = TabBtn
		TabBtnStroke.Color = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.TabBtnStroke.Selected
		TabBtnStroke.ApplyStrokeMode = "Border"
		TabBtnStroke.LineJoinMode = "Round"
		TabBtnStroke.Thickness = 2
		TabBtnStroke.Transparency = 0.5

		TabBtnText.Name = "TabBtnText"
		TabBtnText.Parent = TabBtn
		TabBtnText.AnchorPoint = Vector2.new(0.5, 0.5)
		TabBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabBtnText.BackgroundTransparency = 1.000
		TabBtnText.BorderSizePixel = 0
		TabBtnText.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabBtnText.Size = UDim2.new(0.7, 0, 0.6, 0)
		TabBtnText.Font = Enum.Font.GothamBold

		TabBtnSelected.Value = false
		TabBtnSelected.Name = "TabBtnSelected"
		TabBtnSelected.Parent = TabBtn

		if tabName and typeof(tabName) == "string" and tabName ~= "" and tabName ~= nil then
			TabBtnText.Text = tabName
		else
			TabBtnText.Text = "Tab "..#tabs.currentTabs
		end

		TabBtnText.TextColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.TabBtnText.TextColor3
		TabBtnText.TextScaled = true
		TabBtnText.TextSize = 14.000
		TabBtnText.TextWrapped = true

		for _, obj in pairs(DataHolder:GetChildren()) do
			if obj.Name == "1" then
				TabHolder[obj.Name].TabBtnSelected.Value = true
				TabHolder[obj.Name].BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.Selected
				TabHolder[obj.Name].TabBtnStroke.Color = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.TabBtnStroke.Selected
				obj.Visible = true
			else
				TabHolder[obj.Name].BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.NoHover
				TabHolder[obj.Name].TabBtnStroke.Color = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.TabBtnStroke.NoHover
				obj.Visible = false
			end
		end

		task.spawn(function()
			local function update2()
				TabData.CanvasSize = UDim2.new(0, TabDataLayout.AbsoluteContentSize.X, 0, TabDataLayout.AbsoluteContentSize.Y)
			end
			TabDataLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(update2)
			TabData.CanvasSize = UDim2.new(0, TabDataLayout.AbsoluteContentSize.X, 0, TabDataLayout.AbsoluteContentSize.Y)
		end)

		task.spawn(function()
			TabBtn.MouseEnter:Connect(function()
				if TabBtnSelected.Value == true then return end
				game:GetService("TweenService"):Create(TabBtn, TweenInfo.new(0.25), {
					BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.Hover
				}):Play()
				game:GetService("TweenService"):Create(TabBtnStroke, TweenInfo.new(0.25), {
					Color = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.TabBtnStroke.Hover
				}):Play()
			end)
			TabBtn.MouseLeave:Connect(function()
				if TabBtnSelected.Value == true then return end
				game:GetService("TweenService"):Create(TabBtn, TweenInfo.new(0.25), {
					BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.NoHover
				}):Play()
				game:GetService("TweenService"):Create(TabBtnStroke, TweenInfo.new(0.25), {
					Color = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.TabBtnStroke.NoHover
				}):Play()
			end)
		end)

		task.spawn(function()
			TabBtn.Activated:Connect(function()
				if TabBtnSelected.Value ~= true then
					TabBtnSelected.Value = true
					task.spawn(function()
						for _, obj in pairs(DataHolder:GetChildren()) do
							obj.Visible = false
						end
						TabData.Visible = true
						for _, obj in pairs(TabHolder:GetChildren()) do
							if obj:IsA("TextButton") and obj.Name ~= TabBtn.Name then
								obj.TabBtnSelected.Value = false
								game:GetService("TweenService"):Create(obj, TweenInfo.new(0.25), {
									BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.NoHover
								}):Play()
								game:GetService("TweenService"):Create(obj.TabBtnStroke, TweenInfo.new(0.25), {
									Color = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.TabBtnStroke.NoHover
								}):Play()
							end
						end
					end)
					game:GetService("TweenService"):Create(TabBtn, TweenInfo.new(0.25), {
						BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.Selected
					}):Play()
					game:GetService("TweenService"):Create(TabBtnStroke, TweenInfo.new(0.25), {
						Color = _G.LightLib_Hub_THEME.Window.TabContainer.TabHolder.TabBtn.TabBtnStroke.Selected
					}):Play()
				end
			end)
		end)

		local tabData = {}

		function tabData:CreateButton(name, callback)
			if typeof(callback) == "function" then
				local DataBtn = Instance.new("TextButton")
				local BtnText = Instance.new("TextLabel")
				local DataBtnStroke = Instance.new("UIStroke")
				local DataBtnCorner = Instance.new("UICorner")

				local function getNumOfBTNs()
					local numOfBTNs = 0
					for _, obj in TabData:GetChildren() do
						if obj:IsA("TextButton") then
							numOfBTNs = numOfBTNs + 1
						end
					end
					return numOfBTNs
				end

				DataBtn.Name = "DataBtn"
				DataBtn.Parent = TabData
				DataBtn.AnchorPoint = Vector2.new(0.5, 0.5)
				DataBtn.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.NoHover
				DataBtn.BorderSizePixel = 0
				DataBtn.Size = UDim2.new(0.9, 0, 0.045, 0)
				DataBtn.AutoButtonColor = false
				DataBtn.Font = Enum.Font.Oswald
				DataBtn.Text = ""
				DataBtn.TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.TextColor3
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

				if name and typeof(name) == "string" and name ~= nil and name ~= "" then
					BtnText.Text = name
				else
					BtnText.Text = "Button " .. getNumOfBTNs()
				end

				BtnText.TextColor3 = Color3.fromRGB(58, 58, 58)
				BtnText.TextScaled = true
				BtnText.TextSize = 14.000
				BtnText.TextWrapped = true

				DataBtnCorner.Name = "DataBtnCorner"
				DataBtnCorner.Parent = DataBtn
				DataBtnCorner.CornerRadius = UDim.new(0.2, 0)

				DataBtnStroke.Name = "DataBtnStroke"
				DataBtnStroke.Parent = DataBtn
				DataBtnStroke.Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.DataBtnStroke.NoHover
				DataBtnStroke.ApplyStrokeMode = "Border"
				DataBtnStroke.LineJoinMode = "Round"
				DataBtnStroke.Thickness = 2
				DataBtnStroke.Transparency = 0.5

				TabData.CanvasSize = UDim2.new(0, TabDataLayout.AbsoluteContentSize.X, 0, TabDataLayout.AbsoluteContentSize.Y)

				local busy2 = false
				DataBtn.MouseEnter:Connect(function()
					if busy2 then return end
					game:GetService("TweenService"):Create(DataBtn, TweenInfo.new(0.25), {
						BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.Hover
					}):Play()
					game:GetService("TweenService"):Create(DataBtnStroke, TweenInfo.new(0.25), {
						Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.DataBtnStroke.Hover
					}):Play()
				end)

				DataBtn.MouseLeave:Connect(function()
					if busy2 then return end
					game:GetService("TweenService"):Create(DataBtn, TweenInfo.new(0.25), {
						BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.NoHover
					}):Play()
					game:GetService("TweenService"):Create(DataBtnStroke, TweenInfo.new(0.25), {
						Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.DataBtnStroke.NoHover
					}):Play()
				end)

				DataBtn.Activated:Connect(function()
					busy2 = true
					DataBtn.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.Clicked
					DataBtnStroke.Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.DataBtnStroke.Clicked
					task.wait(.125)
					DataBtn.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.NoHover
					DataBtnStroke.Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataBtn.DataBtnStroke.NoHover
					busy2 = false
					pcall(callback)
				end)
			end
		end

		function tabData:CreateLabel(text)
			if not text then return end
			local DataTxtLbl = Instance.new("Frame")
			local Lbl = Instance.new("TextLabel")
			local DataTxtStroke = Instance.new("UIStroke")
			local DataTxtCorner = Instance.new("UICorner")

			local function getNumOfLBLs()
				local numOfLBLs = 0
				for _, obj in TabData:GetChildren() do
					if obj.Name == "DataTxtLbl" then
						numOfLBLs = numOfLBLs + 1
					end
				end
				return numOfLBLs
			end

			DataTxtLbl.Name = "DataTxtLbl"
			DataTxtLbl.Parent = TabData
			DataTxtLbl.AnchorPoint = Vector2.new(0.5, 0.5)
			DataTxtLbl.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTxtLbl.BackgroundColor3
			DataTxtLbl.BorderColor3 = Color3.fromRGB(27, 42, 53)
			DataTxtLbl.BorderSizePixel = 0
			DataTxtLbl.Size = UDim2.new(0.9, 0, 0.045, 0)

			Lbl.Name = "Lbl"
			Lbl.Parent = DataTxtLbl
			Lbl.AnchorPoint = Vector2.new(0.5, 0.5)
			Lbl.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTxtLbl.Lbl.BackgroundColor3
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

			DataTxtCorner.Name = "DataTxtCorner"
			DataTxtCorner.Parent = DataTxtLbl
			DataTxtCorner.CornerRadius = UDim.new(0.2, 0)

			DataTxtStroke.Name = "DataTxtStroke"
			DataTxtStroke.Parent = DataTxtLbl
			DataTxtStroke.Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTxtLbl.DataTxtStroke.NoHover
			DataTxtStroke.ApplyStrokeMode = "Border"
			DataTxtStroke.LineJoinMode = "Round"
			DataTxtStroke.Thickness = 2
			DataTxtStroke.Transparency = 0.5
			
			TabData.CanvasSize = UDim2.new(0, TabDataLayout.AbsoluteContentSize.X, 0, TabDataLayout.AbsoluteContentSize.Y)

			DataTxtLbl.MouseEnter:Connect(function()
				game:GetService("TweenService"):Create(DataTxtLbl, TweenInfo.new(0.25), {
					BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTxtLbl.Hover
				}):Play()
				game:GetService("TweenService"):Create(DataTxtStroke, TweenInfo.new(0.25), {
					Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTxtLbl.DataTxtStroke.Hover
				}):Play()
			end)

			DataTxtLbl.MouseLeave:Connect(function()
				game:GetService("TweenService"):Create(DataTxtLbl, TweenInfo.new(0.25), {
					BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTxtLbl.NoHover
				}):Play()
				game:GetService("TweenService"):Create(DataTxtStroke, TweenInfo.new(0.25), {
					Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTxtLbl.DataTxtStroke.NoHover
				}):Play()
			end)
		end

		function tabData:CreateToggle(name, default, callback)
			if typeof(callback) == "function" then
				local DataTgl = Instance.new("Frame")
				local DataTglLbl = Instance.new("TextLabel")
				local DataTglCorner = Instance.new("UICorner")
				local DataTglStroke = Instance.new("UIStroke")

				local TglBg = Instance.new("Frame")
				local TglBtn = Instance.new("TextButton")
				local TglStatus = Instance.new("TextLabel")

				local function getNumOfTGLs()
					local numOfTGLs = 0
					for _, obj in TabData:GetChildren() do
						if obj.Name == "DataTgl" then
							numOfTGLs = numOfTGLs + 1
						end
					end
					return numOfTGLs
				end

				local status
				local toggled = default

				if default then
					status = "ON"
				elseif default ~= true then
					status = "OFF"
				end

				DataTgl.Name = "DataTgl"
				DataTgl.Parent = TabData
				DataTgl.AnchorPoint = Vector2.new(0.5, 0.5)
				DataTgl.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.NoHover
				DataTgl.BorderColor3 = Color3.fromRGB(27, 42, 53)
				DataTgl.BorderSizePixel = 0
				DataTgl.Size = UDim2.new(0.9, 0, 0.045, 0)

				DataTglLbl.Name = "DataTglLbl"
				DataTglLbl.Parent = DataTgl
				DataTglLbl.AnchorPoint = Vector2.new(0.5, 0.5)

				if status == "ON" then
					DataTglLbl.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglLbl.ON
				elseif status == "OFF" then
					DataTglLbl.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglLbl.OFF
				end

				DataTglLbl.BackgroundTransparency = 1.000
				DataTglLbl.BorderSizePixel = 0
				DataTglLbl.Position = UDim2.new(0.324374288, 0, 0.5, 0)
				DataTglLbl.Size = UDim2.new(0.450000077, 0, 0.600000024, 0)
				DataTglLbl.Font = Enum.Font.GothamBold

				if name and typeof(name) == "string" and name ~= nil and name ~= "" then
					DataTglLbl.Text = name
				else
					DataTglLbl.Text = "Toggle " .. getNumOfTGLs
				end

				if status == "ON" then
					DataTglLbl.TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglLbl.ON
				elseif status == "OFF" then
					DataTglLbl.TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglLbl.OFF
				end

				DataTglLbl.TextScaled = true
				DataTglLbl.TextSize = 14.000
				DataTglLbl.TextWrapped = true

				TglBg.Name = "TglBg"
				TglBg.Parent = DataTgl
				TglBg.AnchorPoint = Vector2.new(0.5, 0.5)
				TglBg.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglBg.BackgroundColor3
				TglBg.BorderSizePixel = 0
				TglBg.Position = UDim2.new(0.708, 0, 0.5, 0)
				TglBg.Size = UDim2.new(0.211, 0, 0.65, 0)

				TglBtn.Name = "TglBtn"
				TglBtn.Parent = TglBg
				TglBtn.AnchorPoint = Vector2.new(0.5, 0.5)
				TglBtn.BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglBg.TglBtn.BackgroundColor3
				TglBtn.BorderSizePixel = 0
				TglBtn.Position = UDim2.new(0.236, 0, 0.5, 0)
				TglBtn.Size = UDim2.new(0.5, 0, 1, 0)
				TglBtn.AutoButtonColor = false
				TglBtn.Font = Enum.Font.GothamBold
				TglBtn.Text = ""
				TglBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				TglBtn.TextSize = 14.000

				TglStatus.Name = "TglStatus"
				TglStatus.Parent = DataTgl
				TglStatus.AnchorPoint = Vector2.new(0.5, 0.5)

				if status == "OFF" then
					TglStatus.TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglStatus.OFF
				elseif status == "ON" then
					TglStatus.TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglStatus.ON
				end

				TglStatus.BackgroundTransparency = 1.000
				TglStatus.BorderSizePixel = 0
				TglStatus.Position = UDim2.new(0.899374306, 0, 0.5, 0)
				TglStatus.Size = UDim2.new(0.100000001, 0, 0.600000024, 0)
				TglStatus.Font = Enum.Font.GothamBold
				TglStatus.Text = status
				TglStatus.TextScaled = true
				TglStatus.TextSize = 14.000
				TglStatus.TextWrapped = true

				DataTglCorner.Name = "DataTglCorner"
				DataTglCorner.Parent = DataTgl
				DataTglCorner.CornerRadius = UDim.new(0.2, 0)

				DataTglStroke.Name = "DataTglStroke"
				DataTglStroke.Parent = DataTgl
				DataTglStroke.Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglStroke.NoHover
				DataTglStroke.ApplyStrokeMode = "Border"
				DataTglStroke.LineJoinMode = "Round"
				DataTglStroke.Thickness = 2
				DataTglStroke.Transparency = 0.5

				TabData.CanvasSize = UDim2.new(0, TabDataLayout.AbsoluteContentSize.X, 0, TabDataLayout.AbsoluteContentSize.Y)

				local busy = false
				local t1, t2, r1, r2

				task.spawn(function()
					DataTgl.MouseEnter:Connect(function()
						game:GetService("TweenService"):Create(DataTgl, TweenInfo.new(0.25), {
							BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.Hover
						}):Play()
						game:GetService("TweenService"):Create(DataTglStroke, TweenInfo.new(0.25), {
							Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglStroke.Hover
						}):Play()
						game:GetService("TweenService"):Create(TglBg, TweenInfo.new(0.25), {
							Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglBg.Hover
						}):Play()
					end)
					DataTgl.MouseLeave:Connect(function()
						game:GetService("TweenService"):Create(DataTgl, TweenInfo.new(0.25), {
							BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.NoHover
						}):Play()
						game:GetService("TweenService"):Create(DataTglStroke, TweenInfo.new(0.25), {
							Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglStroke.NoHover
						}):Play()
						game:GetService("TweenService"):Create(TglBg, TweenInfo.new(0.25), {
							Color = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglBg.NoHover
						}):Play()
					end)
				end)

				task.spawn(function()
					TglBtn.MouseEnter:Connect(function()
						if busy then return end
						t1 = game:GetService("TweenService"):Create(TglBtn, TweenInfo.new(0.12), {
							Size = UDim2.new(0.52, 0, 1.2, 0)
						})
						r1 = true
						t1:Play()
					end)
					TglBtn.MouseLeave:Connect(function()
						if busy then return end
						t2 = game:GetService("TweenService"):Create(TglBtn, TweenInfo.new(0.12), {
							Size = UDim2.new(0.5, 0, 1, 0)
						})
						r2 = true
						t2:Play()
					end)
				end)

				task.spawn(function()
					TglBtn.Activated:Connect(function()
						busy = true
						if r1 then
							t1:Cancel()
							r1 = false
						end
						if r2 then
							t2:Cancel()
							r2 = false
						end
						toggled = not toggled
						if toggled then
							game:GetService("TweenService"):Create(TglBtn, TweenInfo.new(0.25), {
								Position = UDim2.new(0.748, 0, 0.5, 0),
								BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglBg.TglBtn.ON,
								Size = UDim2.new(0.5, 0, 1, 0)
							}):Play()
							game:GetService("TweenService"):Create(TglStatus, TweenInfo.new(0.25), {
								TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglStatus.ON
							}):Play()
							game:GetService("TweenService"):Create(DataTglLbl, TweenInfo.new(0.25), {
								TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglLbl.ON
							}):Play()
							status = "ON"
						elseif toggled ~= true then
							game:GetService("TweenService"):Create(TglBtn, TweenInfo.new(0.25), {
								Position = UDim2.new(0.236, 0, 0.5, 0),
								BackgroundColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglBg.TglBtn.OFF,
								Size = UDim2.new(0.5, 0, 1, 0)
							}):Play()
							game:GetService("TweenService"):Create(TglStatus, TweenInfo.new(0.25), {
								TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.TglStatus.OFF
							}):Play()
							game:GetService("TweenService"):Create(DataTglLbl, TweenInfo.new(0.25), {
								TextColor3 = _G.LightLib_Hub_THEME.Window.TabDataContainer.DataHolder.TabData.DataTgl.DataTglLbl.OFF
							}):Play()
							status = "OFF"
						end
						TglStatus.Text = status
						pcall(callback, toggled)
						busy = false
					end)
				end)
			end
		end

		return tabData
	end

	function tabs:ChangeKeybind(kb)
		if not kb then return end
		if typeof(kb) == "string" then
			if Enum.KeyCode[kb] then
				_G.LightLib_Hub_KEYBIND = Enum.KeyCode[kb]
			end
		elseif typeof(kb) == "EnumItem" then
			if not string.match(tostring(kb), "Enum.KeyCode") then return end
			_G.LightLib_Hub_KEYBIND = kb
		end
	end

	return tabs
end

return library