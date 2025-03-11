local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("KRIDHUB", "Default")
local Players, RunService, UserInputService = game:GetService("Players"), game:GetService("RunService"), game:GetService("UserInputService")
local LocalPlayer, Camera = Players.LocalPlayer, workspace.CurrentCamera

-- Variables
local AimbotEnabled, TargetPart, ShowFov, FovSize, TeamCheckEnabled, WallCheckEnabled, AimbotMode, SmoothSpeed = false, "Head", false, 60, true, true, "Smooth", 0.2
local FovCircle = Drawing.new("Circle") FovCircle.Thickness, FovCircle.Color, FovCircle.Position, FovCircle.Radius, FovCircle.Visible = 2, Color3.fromRGB(0, 255, 0), Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2), FovSize, false
local HitboxEnabled, HitboxSize, EspEnabled, EspObjects = false, 10, true, {}
local SpeedHackEnabled, SpeedValue, InfJumpEnabled, NoClipEnabled, AutoRespawnEnabled = false, 50, false, false, false
local AntiDetectEnabled, AutoFixEnabled, OptimizePerformanceEnabled, ShowFps, FpsLabel, FpsPosition = false, true, false, false, nil, "TopRight"

-- Team Check
local function CheckTeamMode()
    local teams = {} for _, p in pairs(Players:GetPlayers()) do if p.TeamColor then teams[p.TeamColor.Name] = true end end
    return next(teams, next(teams)) ~= nil
end local IsTeamGame = CheckTeamMode()

-- Aimbot Tab
local AimbotTab = DrRayLibrary.newTab("AIMBOT")
AimbotTab.newToggle("AIMBOT", "Turn Aimbot On/Off", false, function(v) AimbotEnabled = v end)
AimbotTab.newDropdown("Target", "Choose Head or Body", {"Head", "HumanoidRootPart"}, function(v) TargetPart = v end)
AimbotTab.newToggle("FOV", "Show FOV Circle", false, function(v) ShowFov = v FovCircle.Visible = v and AimbotEnabled end)
AimbotTab.newDropdown("FOV SIZE", "Set FOV Size", {"60", "120", "240"}, function(v) FovSize = tonumber(v) FovCircle.Radius = FovSize end)
AimbotTab.newDropdown("FOV COLOR", "Set FOV Color", {"Red", "Green", "Blue"}, function(v) FovCircle.Color = v == "Red" and Color3.fromRGB(255, 0, 0) or v == "Green" and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 0, 255) end)
AimbotTab.newDropdown("Aimbot Mode", "Smooth or Instant Aim", {"Smooth", "Instant"}, function(v) AimbotMode = v end)
AimbotTab.newDropdown("Smooth Speed", "Set Smooth Speed", {"0.1", "0.2", "0.5", "1"}, function(v) SmoothSpeed = tonumber(v) end)
AimbotTab.newToggle("Team Check", "Skip Teammates", true, function(v) TeamCheckEnabled = v end)
AimbotTab.newToggle("Wall Check", "Skip Behind Walls", false, function(v) WallCheckEnabled = v end)
AimbotTab.newToggle("Hitbox", "Expand enemy hitbox", false, function(v) HitboxEnabled = v end)
AimbotTab.newDropdown("Hitbox Size", "Set Hitbox Size", {"10", "20", "30"}, function(v) HitboxSize = tonumber(v) end)

-- ESP Tab
local EspTab = DrRayLibrary.newTab("ESP", "https://www.roblox.com/asset/?id=6031075931")
EspTab.newToggle("Enable ESP", "Turn ESP On/Off", false, function(v) EspEnabled = v end)
EspTab.newToggle("ESP Line", "Show Lines", false, function(v) EspLineEnabled = v end)
EspTab.newToggle("ESP Box", "Show Boxes", false, function(v) EspBoxEnabled = v end)
EspTab.newToggle("ESP Name", "Show Names", false, function(v) EspNameEnabled = v end)
EspTab.newToggle("ESP Distance", "Show Distance", false, function(v) EspDistanceEnabled = v end)
EspTab.newToggle("ESP HP", "Show Health", false, function(v) EspHPEnabled = v end)
EspTab.newToggle("Wallhack", "Highlight Through Walls", false, function(v) WallhackEnabled = v end)

-- Features Tab
local FeaturesTab = DrRayLibrary.newTab("FEATURES", "https://www.roblox.com/asset/?id=6035042564")
FeaturesTab.newToggle("Speed Hack", "Increase speed", false, function(v) SpeedHackEnabled = v local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") if h then h.WalkSpeed = v and SpeedValue or 16 end end)
FeaturesTab.newDropdown("Speed Value", "Set Speed", {"50", "100", "150"}, function(v) SpeedValue = tonumber(v) if SpeedHackEnabled then local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") if h then h.WalkSpeed = SpeedValue end end end)
FeaturesTab.newToggle("Infinite Jump", "Jump without limit", false, function(v) InfJumpEnabled = v end)
FeaturesTab.newToggle("NoClip", "Walk through walls", false, function(v) NoClipEnabled = v if not v then local c = LocalPlayer.Character if c then for _, p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = true end end end end end)
FeaturesTab.newToggle("Auto Respawn", "Respawn instantly", false, function(v) AutoRespawnEnabled = v end)

-- Setting Tab
local SettingTab = DrRayLibrary.newTab("SETTING", "https://www.roblox.com/asset/?id=6031280882")
SettingTab.newToggle("FPS", "Show FPS", false, function(v) ShowFps = v if v and not FpsLabel then FpsLabel = Drawing.new("Text") FpsLabel.Text, FpsLabel.Size, FpsLabel.Color, FpsLabel.Visible = "FPS: 0", 20, Color3.fromRGB(255, 255, 255), true end if FpsLabel then FpsLabel.Visible = v FpsLabel.Position = FpsPosition == "TopLeft" and Vector2.new(10, 10) or FpsPosition == "TopRight" and Vector2.new(Camera.ViewportSize.X - 100, 10) or FpsPosition == "BottomLeft" and Vector2.new(10, Camera.ViewportSize.Y - 30) or Vector2.new(Camera.ViewportSize.X - 100, Camera.ViewportSize.Y - 30) end end)
SettingTab.newDropdown("FPS Position", "Set FPS Position", {"TopLeft", "TopRight", "BottomLeft", "BottomRight"}, function(v) FpsPosition = v if FpsLabel and ShowFps then FpsLabel.Position = v == "TopLeft" and Vector2.new(10, 10) or v == "TopRight" and Vector2.new(Camera.ViewportSize.X - 100, 10) or v == "BottomLeft" and Vector2.new(Vector2.new(10, Camera.ViewportSize.Y - 30) or Vector2.new(Camera.ViewportSize.X - 100, Camera.ViewportSize.Y - 30) end end)
SettingTab.newToggle("Anti-Detect", "Hide script", false, function(v) AntiDetectEnabled = v if v then RunService:BindToRenderStep("AntiDetect", Enum.RenderPriority.Camera.Value, function() local r = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") if r then r.Velocity = Vector3.new(math.random(-1, 1) * 0.1, r.Velocity.Y, math.random(-1, 1) * 0.1) end wait(math.random(0.02, 0.07)) end) else RunService:UnbindFromRenderStep("AntiDetect") end end)
SettingTab.newToggle("Auto Fix", "Auto recover", true, function(v) AutoFixEnabled = v end)
SettingTab.newToggle("Optimize Performance", "Boost FPS", false, function(v) OptimizePerformanceEnabled = v if v then for _, o in pairs(workspace:GetDescendants()) do if o:IsA("BasePart") and not o.Parent:FindFirstChild("Humanoid") then o.Material, o.Reflectance, o.CastShadow = Enum.Material.SmoothPlastic, 0, false end end game.Lighting.GlobalShadows, game.Lighting.FogEnd, settings().Rendering.QualityLevel = false, 100000, Enum.QualityLevel.Level01 else for _, o in pairs(workspace:GetDescendants()) do if o:IsA("BasePart") then o.CastShadow = true end end game.Lighting.GlobalShadows, game.Lighting.FogEnd, settings().Rendering.QualityLevel = true, 10000, Enum.QualityLevel.Automatic end end)

-- Aimbot Logic
local function GetClosestPlayer()
    local closest, dist = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local h, part = p.Character:FindFirstChild("Humanoid"), p.Character:FindFirstChild(TargetPart) or p.Character:FindFirstChild("HumanoidRootPart")
            if h and part and h.Health > 0 and (not TeamCheckEnabled or not IsTeamGame or p.TeamColor ~= LocalPlayer.TeamColor) then
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                local d = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                if onScreen and d <= FovSize then
                    if WallCheckEnabled then local hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * 500), {LocalPlayer.Character}) if hit and hit:IsDescendantOf(p.Character) and d < dist then closest, dist = p, d end else if d < dist then closest, dist = p, d end end
                end
            end
        end
    end
    return closest
end

-- ESP Logic
local function CreateESP(p)
    if p == LocalPlayer then return end
    local esp = {Line = Drawing.new("Line"), Box = Drawing.new("Square"), Name = Drawing.new("Text"), Distance = Drawing.new("Text"), HPBar = Drawing.new("Square"), HPFill = Drawing.new("Square"), Highlight = Instance.new("Highlight")}
    esp.Highlight.Adornee, esp.Highlight.FillTransparency, esp.Highlight.OutlineTransparency, esp.Highlight.FillColor, esp.Highlight.OutlineColor, esp.Highlight.DepthMode, esp.Highlight.Parent = p.Character, 0.5, 0, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 0, 0), Enum.HighlightDepthMode.AlwaysOnTop, game.CoreGui
    EspObjects[p] = esp
    RunService.RenderStepped:Connect(function()
        if not EspEnabled or not p.Character or not p.Character:FindFirstChild("HumanoidRootPart") or not p.Character:FindFirstChild("Humanoid") or (TeamCheckEnabled and IsTeamGame and p.TeamColor == LocalPlayer.TeamColor) then for _, o in pairs(esp) do if o ~= esp.Highlight then o.Visible = false end end esp.Highlight.Enabled = false return end
        local pos, onScreen = Camera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
        local dist = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude or 0
        if onScreen and p.Character.Humanoid.Health > 0 then
            if EspLineEnabled then esp.Line.Visible, esp.Line.From, esp.Line.To, esp.Line.Color, esp.Line.Thickness = true, Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y), Vector2.new(pos.X, pos.Y), Color3.fromRGB(255, 0, 0), 1 end
            if EspBoxEnabled then esp.Box.Visible, esp.Box.Size, esp.Box.Position, esp.Box.Color, esp.Box.Thickness = true, Vector2.new(30, 40), Vector2.new(pos.X - 15, pos.Y - 20), Color3.fromRGB(0, 255, 0), 1 end
            if EspNameEnabled then esp.Name.Visible, esp.Name.Text, esp.Name.Position, esp.Name.Color, esp.Name.Size, esp.Name.Center = true, p.Name, Vector2.new(pos.X, pos.Y - 35), Color3.fromRGB(255, 255, 255), 12, true end
            if EspDistanceEnabled then esp.Distance.Visible, esp.Distance.Text, esp.Distance.Position, esp.Distance.Color, esp.Distance.Size, esp.Distance.Center = true, math.floor(dist) .. " studs", Vector2.new(pos.X, pos.Y + 25), Color3.fromRGB(255, 255, 255), 12, true end
            if EspHPEnabled then local hp = p.Character.Humanoid.Health / p.Character.Humanoid.MaxHealth esp.HPBar.Visible, esp.HPBar.Size, esp.HPBar.Position, esp.HPBar.Color, esp.HPBar.Filled = true, Vector2.new(30, 3), Vector2.new(pos.X - 15, pos.Y + 35), Color3.fromRGB(50, 50, 50), true esp.HPFill.Visible, esp.HPFill.Size, esp.HPFill.Position, esp.HPFill.Color, esp.HPFill.Filled = true, Vector2.new(30 * hp, 3), Vector2.new(pos.X - 15, pos.Y + 35), Color3.fromRGB(0, 255, 0), true end
            esp.Highlight.Enabled = WallhackEnabled
        else for _, o in pairs(esp) do if o ~= esp.Highlight then o.Visible = false end end esp.Highlight.Enabled = false end
    end)
end

-- Main Loop
RunService.RenderStepped:Connect(function()
    if AimbotEnabled then
        local t = GetClosestPlayer()
        if t and t.Character and t.Character:FindFirstChild(TargetPart) then
            local pos, c = t.Character[TargetPart].Position, Camera.CFrame
            Camera.CFrame = AimbotMode == "Smooth" and c:Lerp(CFrame.new(c.Position, pos), SmoothSpeed) or CFrame.new(c.Position, pos)
        end
        FovCircle.Visible = ShowFov
    else FovCircle.Visible = false end

    if EspEnabled then for _, p in pairs(Players:GetPlayers()) do if not EspObjects[p] and p ~= LocalPlayer and p.Character then CreateESP(p) end end end

    if AutoFixEnabled and LocalPlayer.Character then
        local h, r = LocalPlayer.Character:FindFirstChild("Humanoid"), LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if h and r then
            if SpeedHackEnabled then h.WalkSpeed, r.Velocity = SpeedValue, Vector3.new(r.Velocity.X * 0.95, r.Velocity.Y, r.Velocity.Z * 0.95) elseif h.WalkSpeed ~= 16 then h.WalkSpeed = 16 end
            if NoClipEnabled then for _, p in pairs(LocalPlayer.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end
            if AutoRespawnEnabled and h.Health <= 0 then LocalPlayer:LoadCharacter() wait(0.05) end
        end
    end

    if HitboxEnabled then for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 and (not TeamCheckEnabled or not IsTeamGame or p.TeamColor ~= LocalPlayer.TeamColor) then p.Character.HumanoidRootPart.Size, p.Character.HumanoidRootPart.Transparency, p.Character.HumanoidRootPart.CanCollide = Vector3.new(HitboxSize, HitboxSize, HitboxSize), 0.7, false end end end
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled and LocalPlayer.Character then
        local h, r = LocalPlayer.Character:FindFirstChild("Humanoid"), LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if h and r then h:ChangeState(Enum.HumanoidStateType.Jumping) r.Velocity = Vector3.new(r.Velocity.X, 50, r.Velocity.Z) wait(0.08) end
    end
end)

-- Player Management
for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
Players.PlayerAdded:Connect(function(p) if EspEnabled then CreateESP(p) end CheckTeamMode() end)
Players.PlayerRemoving:Connect(function(p) if EspObjects[p] then for _, o in pairs(EspObjects[p]) do o:Remove() end EspObjects[p] = nil end CheckTeamMode() end)

-- FPS Logic
local last, frames = tick(), 0
RunService.RenderStepped:Connect(function()
    if ShowFps and FpsLabel then
        frames = frames + 1
        local now = tick()
        if now - last >= 1 then FpsLabel.Text = "FPS: " .. math.floor(frames / (now - last)) frames, last = 0, now end
    end
end)
