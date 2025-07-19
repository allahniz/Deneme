-- Karaeski Char Changer GUI | By Karaeski

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local plr = Players.LocalPlayer
local originalChar = plr.Character:Clone()

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Visible = false
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 1

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

-- Karaeski Marka
local marka = Instance.new("TextLabel", frame)
marka.Text = "KARΔΣSKI HUB"
marka.Font = Enum.Font.GothamBold
marka.TextSize = 14
marka.TextColor3 = Color3.fromRGB(150,150,150)
marka.BackgroundTransparency = 1
marka.Size = UDim2.new(1, -10, 0, 20)
marka.Position = UDim2.new(0, 5, 1, -25)
marka.TextXAlignment = Enum.TextXAlignment.Left

-- TextBox
local box = Instance.new("TextBox", frame)
box.PlaceholderText = "Oyuncu ismi gir..."
box.Text = ""
box.Font = Enum.Font.GothamSemibold
box.TextSize = 14
box.TextColor3 = Color3.fromRGB(255, 255, 255)
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.Size = UDim2.new(1, -20, 0, 30)
box.Position = UDim2.new(0, 10, 0, 20)

local boxCorner = Instance.new("UICorner", box)
boxCorner.CornerRadius = UDim.new(0, 6)

-- DONE Buton
local done = Instance.new("TextButton", frame)
done.Text = "Done"
done.Font = Enum.Font.GothamBold
done.TextSize = 14
done.TextColor3 = Color3.fromRGB(255,255,255)
done.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
done.Size = UDim2.new(1, -20, 0, 30)
done.Position = UDim2.new(0, 10, 0, 60)

local doneCorner = Instance.new("UICorner", done)
doneCorner.CornerRadius = UDim.new(0, 6)

-- RESET Buton
local reset = Instance.new("TextButton", frame)
reset.Text = "Reset"
reset.Font = Enum.Font.GothamSemibold
reset.TextSize = 13
reset.TextColor3 = Color3.fromRGB(255,255,255)
reset.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
reset.Size = UDim2.new(1, -20, 0, 28)
reset.Position = UDim2.new(0, 10, 0, 100)

local resetCorner = Instance.new("UICorner", reset)
resetCorner.CornerRadius = UDim.new(0, 6)

-- Tween Animasyon
local function openGUI()
	frame.Visible = true
	TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
end

local function closeGUI()
	TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
	task.wait(0.3)
	frame.Visible = false
end

-- GUI Toggle
UserInputService.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.RightShift then
		if not frame.Visible then
			openGUI()
		else
			closeGUI()
		end
	end
end)

-- DONE Basınca Karakter Kopyalama
local newChar = nil
done.MouseButton1Click:Connect(function()
	local targetName = box.Text
	local target = Players:FindFirstChild(targetName)
	if target and target.Character then
		if newChar then
			newChar:Destroy()
		end
		newChar = target.Character:Clone()
		plr.Character = newChar
		newChar.Parent = workspace
		workspace.CurrentCamera.CameraSubject = newChar:FindFirstChildWhichIsA("Humanoid")
	end
end)

-- RESET Buton
reset.MouseButton1Click:Connect(function()
	if newChar then
		newChar:Destroy()
		newChar = nil
	end
	plr.Character = originalChar
	originalChar.Parent = workspace
	workspace.CurrentCamera.CameraSubject = originalChar:FindFirstChildWhichIsA("Humanoid")
end)
