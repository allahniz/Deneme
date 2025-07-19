-- Karaeski Uçuş & Noclip Sistemi 🚀 -- Full özellikli GUI: Fly, Noclip, Hız Ayarı, Aç/Kapa, Animasyon, Karaeski Teması

local Players = game:GetService("Players") local UIS = game:GetService("UserInputService") local RS = game:GetService("RunService") local player = Players.LocalPlayer local character = player.Character or player.CharacterAdded:Wait() local hrp = character:WaitForChild("HumanoidRootPart")

GUI Başlat local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui")) local main = Instance.new("Frame", gui) main.Size = UDim2.new(0, 300, 0, 260) main.Position = UDim2.new(0.5, -150, 0.5, -130) main.BackgroundColor3 = Color3.fromRGB(20, 20, 20) main.BorderSizePixel = 0 main.Visible = false main.AnchorPoint = Vector2.new(0.5, 0.5) main.Name = "KaraeskiFlyMenu" main.BackgroundTransparency = 1 main:TweenSize(UDim2.new(0, 300, 0, 260), "Out", "Back", 0.5, true) main:TweenPosition(UDim2.new(0.5, -150, 0.5, -130), "Out", "Back", 0.5, true) main.BackgroundTransparency = 0

Logo local logo = Instance.new("TextLabel", main) logo.Text = "KΔRΔΣSKI HUB ✈️" logo.Size = UDim2.new(1, 0, 0, 30) logo.BackgroundTransparency = 1 logo.TextColor3 = Color3.fromRGB(0, 170, 255) logo.Font = Enum.Font.GothamBlack logo.TextSize = 18

Fly Butonu local toggleFly = Instance.new("TextButton", main) toggleFly.Size = UDim2.new(1, -20, 0, 40) toggleFly.Position = UDim2.new(0, 10, 0, 40) toggleFly.Text = "[ FLY ] Kapalı" toggleFly.Font = Enum.Font.GothamBold toggleFly.TextSize = 16 toggleFly.TextColor3 = Color3.new(1,1,1) toggleFly.BackgroundColor3 = Color3.fromRGB(35, 35, 35) toggleFly.BorderSizePixel = 0

Noclip Butonu local toggleNoclip = Instance.new("TextButton", main) toggleNoclip.Size = UDim2.new(1, -20, 0, 40) toggleNoclip.Position = UDim2.new(0, 10, 0, 90) toggleNoclip.Text = "[ NOCLIP ] Kapalı" toggleNoclip.Font = Enum.Font.GothamBold toggleNoclip.TextSize = 16 toggleNoclip.TextColor3 = Color3.new(1,1,1) toggleNoclip.BackgroundColor3 = Color3.fromRGB(35, 35, 35) toggleNoclip.BorderSizePixel = 0

Hız Ayarı local speedLabel = Instance.new("TextLabel", main) speedLabel.Position = UDim2.new(0, 10, 0, 140) speedLabel.Size = UDim2.new(1, -20, 0, 20) speedLabel.Text = "Hız: 60" speedLabel.BackgroundTransparency = 1 speedLabel.TextColor3 = Color3.new(1,1,1) speedLabel.Font = Enum.Font.GothamSemibold speedLabel.TextSize = 14

local speed = 60

local plusBtn = Instance.new("TextButton", main) plusBtn.Size = UDim2.new(0.5, -15, 0, 30) plusBtn.Position = UDim2.new(0, 10, 0, 170) plusBtn.Text = "+" plusBtn.Font = Enum.Font.GothamBold plusBtn.TextSize = 18 plusBtn.TextColor3 = Color3.new(1,1,1) plusBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)

local minusBtn = Instance.new("TextButton", main) minusBtn.Size = UDim2.new(0.5, -15, 0, 30) minusBtn.Position = UDim2.new(0.5, 5, 0, 170) minusBtn.Text = "-" minusBtn.Font = Enum.Font.GothamBold minusBtn.TextSize = 18 minusBtn.TextColor3 = Color3.new(1,1,1) minusBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)

Aç/Kapa Tuşu UIS.InputBegan:Connect(function(input, gpe) if input.KeyCode == Enum.KeyCode.RightShift and not gpe then main.Visible = not main.Visible end end)

Fly Kodları local flying = false local bv = Instance.new("BodyVelocity") bv.MaxForce = Vector3.new(9e9, 9e9, 9e9) bv.Velocity = Vector3.new()

local function getDir() local cam = workspace.CurrentCamera local dir = Vector3.new() if UIS:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end if UIS:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end return dir.Unit end

toggleFly.MouseButton1Click:Connect(function() flying = not flying toggleFly.Text = flying and "[ FLY ] Açık" or "[ FLY ] Kapalı" bv.Parent = flying and hrp or nil end)

RS.Heartbeat:Connect(function() if flying then local dir = getDir() bv.Velocity = dir.Magnitude > 0 and dir * speed or Vector3.zero end end)

Noclip Kodları local noclip = false

local function toggleCollisions(state) for _, v in ipairs(character:GetDescendants()) do if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then v.CanCollide = not state end end end

toggleNoclip.MouseButton1Click:Connect(function() noclip = not noclip toggleNoclip.Text = noclip and "[ NOCLIP ] Açık" or "[ NOCLIP ] Kapalı" toggleCollisions(noclip) end)

 Hız Butonları plusBtn.MouseButton1Click:Connect(function() speed += 10 speedLabel.Text = "Hız: " .. speed end)

minusBtn.MouseButton1Click:Connect(function() speed = math.max(10, speed - 10) speedLabel.Text = "Hız: " .. speed end)

print("✅ Karaeski Fly & Noclip GUI Yüklendi!")

