if game.CoreGui:FindFirstChild("XDLuaGUI") then game.CoreGui:FindFirstChild("XDLuaGUI"):Destroy()
end
local CoreGui = game:GetService("CoreGui")
local screenGui = Instance.new("ScreenGui", CoreGui)
screenGui.Name = "XDLuaGUI"
local logoButton = Instance.new("TextButton", screenGui)
logoButton.Size = UDim2.new(0, 50, 0, 50)
logoButton.Position = UDim2.new(0.02, 0, 0.5, -25)
logoButton.Text = "👾"
logoButton.TextColor3 = Color3.fromRGB(0, 255, 255)
logoButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
logoButton.BackgroundTransparency = 0.2
logoButton.BorderSizePixel = 0
logoButton.Font = Enum.Font.GothamBold
logoButton.TextSize = 24
logoButton.Draggable = true
logoButton.AutoButtonColor = false
local uiCorner = Instance.new("UICorner", logoButton)
uiCorner.CornerRadius = UDim.new(0, 10)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 420, 0, 280)
mainFrame.Position = UDim2.new(0.5, -210, 0.45, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true
local glowMain = Instance.new("UIStroke", mainFrame)
glowMain.Thickness = 4
glowMain.Color = Color3.fromRGB(255, 50, 255)
glowMain.Transparency = 0.1
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 10)
local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 35)
titleLabel.Text = "🔹 FORSAKEN 🔹"
titleLabel.TextColor3 = Color3.fromRGB(255, 50, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 18
titleLabel.TextStrokeTransparency = 0.2
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(0, 110, 1, -35)
tabFrame.Position = UDim2.new(0.01, 0, 0, 35)
tabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
local tabCorner = Instance.new("UICorner", tabFrame)
tabCorner.CornerRadius = UDim.new(0, 8)
local tabScrollingFrame = Instance.new("ScrollingFrame", tabFrame)
tabScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
tabScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
tabScrollingFrame.BackgroundTransparency = 1
tabScrollingFrame.ScrollBarThickness = 5
tabScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 255)
tabScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1, -120, 1, -37)
contentFrame.Position = UDim2.new(0, 117, 0, 35)
contentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
contentFrame.BackgroundTransparency = 0.5
contentFrame.BorderSizePixel = 0
local contentCorner = Instance.new("UICorner", contentFrame)
contentCorner.CornerRadius = UDim.new(0, 10)
local contentScrollingFrame = Instance.new("ScrollingFrame", contentFrame)
contentScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
contentScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
contentScrollingFrame.BackgroundTransparency = 1
contentScrollingFrame.ScrollBarThickness = 5
contentScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 255)
contentScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
local tabNames = {
{ "🏠 หน้าแรก" },
{ "👁️ ESP" },
{ "🔧 ซ่อม" }
}
local selectedTab = nil
local tabButtons = {}
local function switchTab(tabIndex)
if selectedTab then
selectedTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
if selectedTab:FindFirstChild("Stroke") then          selectedTab:FindFirstChild("Stroke").Transparency = 1
end
end
selectedTab = tabButtons[tabIndex]
selectedTab.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
if selectedTab:FindFirstChild("Stroke") then selectedTab:FindFirstChild("Stroke").Transparency = 0.2
end
for _, child in pairs(contentScrollingFrame:GetChildren()) do
if child:IsA("Frame") then
child.Visible = false
end
end
local tabContent = contentScrollingFrame:FindFirstChild("Tab" .. tabIndex)
if tabContent then
tabContent.Visible = true
end
end
for i, tab in ipairs(tabNames) do
local tabButton = Instance.new("TextButton", tabScrollingFrame)
tabButton.Size = UDim2.new(1, 0, 0, 40)
tabButton.Position = UDim2.new(0, 0, 0, (i - 1) * 45)
tabButton.Text = tab[1]
tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
tabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
tabButton.Font = Enum.Font.GothamBold
tabButton.TextSize = 14
tabButton.AutoButtonColor = false tabButton.MouseButton1Click:Connect(function()
switchTab(i)
end)
table.insert(tabButtons, tabButton)
local buttonGlow = Instance.new("UIStroke", tabButton)
buttonGlow.Name = "Stroke"
buttonGlow.Thickness = 2
buttonGlow.Color = Color3.fromRGB(255, 50, 255)
buttonGlow.Transparency = 1
local tabCorner = Instance.new("UICorner", tabButton)
tabCorner.CornerRadius = UDim.new(0, 5)
local tabContent = Instance.new("Frame", contentScrollingFrame)
tabContent.Size = UDim2.new(1, 0, 1, 0)
tabContent.Name = "Tab" .. i
tabContent.Visible = false
tabContent.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
-- เพิ่มข้อความหัวเรื่องแท็บ
local label = Instance.new("TextLabel", tabContent)
label.Size = UDim2.new(1, 0, 0, 30)
label.Text = tab[1]
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.GothamBold
label.TextSize = 16
-- ในส่วนของการสร้างแท็บหน้าแรก
if i == 1 then
local descriptionLabel = Instance.new("TextLabel", tabContent)
descriptionLabel.Size = UDim2.new(0.9, 0, 0, 60)
descriptionLabel.Position = UDim2.new(0.05, 0, 0, 50)
descriptionLabel.Text = "ยินดีต้อนรับสู่ สคริปต์ของผม\nสคริปต์นี้คือสคริปต์แมพ FORSEKEN"
descriptionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
descriptionLabel.BackgroundTransparency = 1
descriptionLabel.Font = Enum.Font.GothamBold
descriptionLabel.TextSize = 14
descriptionLabel.TextWrapped = true
local creditLabel = Instance.new("TextLabel", tabContent)
creditLabel.Size = UDim2.new(0.9, 0, 0, 30)
creditLabel.Position = UDim2.new(0.05, 0, 0, 230)
creditLabel.Text = "พัฒนาโดย: XDLua\nเวอร์ชัน: 1.0.0 เบต้าเทส"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.BackgroundTransparency = 1
creditLabel.Font = Enum.Font.GothamBold
creditLabel.TextSize = 12
creditLabel.TextWrapped = true
local copyYoutubeButton = Instance.new("TextButton", tabContent)
copyYoutubeButton.Size = UDim2.new(0.9, 0, 0, 30)
copyYoutubeButton.Position = UDim2.new(0.05, 0, 0, 270)
copyYoutubeButton.Text = "📋 คัดลอกลิงค์ YouTube"
copyYoutubeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
copyYoutubeButton.Font = Enum.Font.GothamBold
copyYoutubeButton.TextSize = 14
copyYoutubeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local youtubeCorner = Instance.new("UICorner", copyYoutubeButton)
youtubeCorner.CornerRadius = UDim.new(0, 8) copyYoutubeButton.MouseButton1Click:Connect(function()
local youtubeLink = "https://youtube.com/@kridsakronthitpiphit?si=kMr0cXfjZqNlvgaD"
setclipboard(youtubeLink) game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "คัดลอกลิงค์ YouTube",
Text = "คัดลอกลิงค์ YouTube เรียบร้อยแล้ว!",
Duration = 3
})
end)
local copyDiscordButton = Instance.new("TextButton", tabContent)
copyDiscordButton.Size = UDim2.new(0.9, 0, 0, 30)
copyDiscordButton.Position = UDim2.new(0.05, 0, 0, 310)
copyDiscordButton.Text = "📋 คัดลอกลิงค์ดิสคอร์ด"
copyDiscordButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
copyDiscordButton.Font = Enum.Font.GothamBold
copyDiscordButton.TextSize = 14
copyDiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local discordCorner = Instance.new("UICorner", copyDiscordButton)
discordCorner.CornerRadius = UDim.new(0, 8) copyDiscordButton.MouseButton1Click:Connect(function() game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "คัดลอกลิงค์ดิสคอร์ด",
Text = "ตอนนี้ยังไม่มีกลุ่มดิส ขออภัย",
Duration = 3
})
end)
end
-- ในส่วนของการสร้างปุ่ม ESP
if i == 2 then
local espButtons = {
{ "ESP ฆาตกร", false },
{ "ESP ผู้รอดชีวิต", false },
{ "ESP เครื่องปั่นไฟ", false }
}
for j, espButton in ipairs(espButtons) do
local button = Instance.new("TextButton", tabContent)
button.Size = UDim2.new(0.9, 0, 0, 30)
button.Position = UDim2.new(0.05, 0, 0, 50 + (j - 1) * 40)
button.Text = (espButton[2] and "เปิด " or "ปิด ") .. espButton[1]
button.BackgroundColor3 = Color3.fromRGB(100, 0, 100)
button.Font = Enum.Font.GothamBold
button.TextSize = 14
button.TextColor3 = Color3.fromRGB(255, 255, 255)
local buttonCorner = Instance.new("UICorner", button)
buttonCorner.CornerRadius = UDim.new(0, 8) button.MouseButton1Click:Connect(function()
espButton[2] = not espButton[2]
button.Text = (espButton[2] and "เปิด " or "ปิด ") .. espButton[1]
-- เพิ่มโค้ดเปิด/ปิด ESP ตาม espButton[1]
end)
end
end
-- ในส่วนของการสร้างปุ่มซ่อม
if i == 3 then
local repairButton = Instance.new("TextButton", tabContent)
repairButton.Size = UDim2.new(0.9, 0, 0, 30)
repairButton.Position = UDim2.new(0.05, 0, 0, 50)
repairButton.Text = (isRepairAutoEnabled and "เปิด " or "ปิด ") .. "ซ่อมเครื่องปั่นไฟออโต้"
repairButton.BackgroundColor3 = Color3.fromRGB(100, 0, 100)
repairButton.Font = Enum.Font.GothamBold
repairButton.TextSize = 14
repairButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local repairCorner = Instance.new("UICorner", repairButton)
repairCorner.CornerRadius = UDim.new(0, 8)
local isRepairAutoEnabled = false repairButton.MouseButton1Click:Connect(function()
isRepairAutoEnabled = not isRepairAutoEnabled
repairButton.Text = (isRepairAutoEnabled and "เปิด " or "ปิด ") .. "ซ่อมเครื่องปั่นไฟออโต้"
-- เพิ่มโค้ดเปิด/ปิดซ่อมออโต้
end)
end
tabScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #tabNames * 45)
contentScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
end
switchTab(1)
logoButton.MouseButton1Click:Connect(function()
mainFrame.Visible = not mainFrame.Visible
end)
