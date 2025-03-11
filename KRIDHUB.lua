local DrRayLibrary=loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window=DrRayLibrary:Load("KRIDHUB","Default")
local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UserInputService=game:GetService("UserInputService")
local LocalPlayer=Players.LocalPlayer
local Camera=workspace.CurrentCamera
local AimbotEnabled=false
local TargetPart="Head"
local ShowFov=false
local FovSize=60
local TeamCheckEnabled=true
local WallCheckEnabled=false
local AimbotMode="Smooth"
local SmoothSpeed=0.2
local FovCircle=Drawing.new("Circle")
local FovColor=Color3.fromRGB(0,255,0)
local IsTeamGame=false
local HitboxEnabled=false
local HitboxSize=10
local FovRainbow=false
local EspEnabled=true
local EspLineEnabled=false
local EspBoxEnabled=false
local EspNameEnabled=false
local EspDistanceEnabled=false
local EspHPEnabled=false
local WallhackEnabled=false
local EspLineColor=Color3.fromRGB(255,0,0)
local EspBoxColor=Color3.fromRGB(0,255,0)
local EspNameColor=Color3.fromRGB(255,255,255)
local EspDistanceColor=Color3.fromRGB(255,255,255)
local EspHPColor=Color3.fromRGB(0,255,0)
local WallhackColor=Color3.fromRGB(255,0,0)
local EspLineRainbow=false
local EspBoxRainbow=false
local EspNameRainbow=false
local EspDistanceRainbow=false
local EspHPRainbow=false
local WallhackRainbow=false
local EspObjects={}
local AutoFixEnabled=true
local OptimizePerformanceEnabled=false
local AutoRespawnEnabled=false
local ShowFps=false
local FpsLabel=nil
local FpsPosition="TopRight"
local RainbowHue=0
local function CheckTeamMode()local teamColors={}for _,player in pairs(Players:GetPlayers())do if player.TeamColor then teamColors[player.TeamColor.Name]=true end end local uniqueTeams=0 for _ in pairs(teamColors)do uniqueTeams=uniqueTeams+1 end IsTeamGame=uniqueTeams>1 return IsTeamGame end
local AimbotTab=DrRayLibrary.newTab("AIMBOT")
AimbotTab.newToggle("AIMBOT","Turn Aimbot On/Off",false,function(Aimbot)AimbotEnabled=Aimbot end)
AimbotTab.newDropdown("Target","Choose Head or Body",{"Head","HumanoidRootPart"},function(selectedTarget)TargetPart=selectedTarget end)
AimbotTab.newToggle("FOV","Show FOV Circle",false,function(ShowFovToggle)ShowFov=ShowFovToggle FovCircle.Visible=ShowFov and AimbotEnabled end)
AimbotTab.newDropdown("FOV SIZE","Set FOV Size",{"60","120","240"},function(selectedSize)FovSize=tonumber(selectedSize)FovCircle.Radius=FovSize end)
AimbotTab.newDropdown("FOV COLOR","Set FOV Color",{"Red","Green","Blue","Rainbow"},function(selectedColor)if selectedColor=="Red"then FovColor=Color3.fromRGB(255,0,0)FovRainbow=false elseif selectedColor=="Green"then FovColor=Color3.fromRGB(0,255,0)FovRainbow=false elseif selectedColor=="Blue"then FovColor=Color3.fromRGB(0,0,255)FovRainbow=false elseif selectedColor=="Rainbow"then FovRainbow=true end if not FovRainbow then FovCircle.Color=FovColor end end)
AimbotTab.newDropdown("Aimbot Mode","Smooth or Instant Aim",{"Smooth","Instant"},function(selectedMode)AimbotMode=selectedMode end)
AimbotTab.newDropdown("Smooth Speed","Set Smooth Speed",{"0.1","0.2","0.5","1"},function(value)SmoothSpeed=tonumber(value)end)
AimbotTab.newToggle("Team Check","Skip Teammates (Team Mode Only)",true,function(Teamcheck)TeamCheckEnabled=Teamcheck if not IsTeamGame and TeamCheckEnabled then warn("Team Check is enabled but this is not a team game. It will be ignored.")end end)
AimbotTab.newToggle("Wall Check","Skip Behind Walls",false,function(Wallcheck)WallCheckEnabled=Wallcheck end)
AimbotTab.newToggle("Hitbox","Expand enemy hitbox",false,function(Hitbox)HitboxEnabled=Hitbox end)
AimbotTab.newDropdown("Hitbox Size","Set Hitbox Size",{"10","20","30"},function(value)HitboxSize=tonumber(value)end)
local EspTab=DrRayLibrary.newTab("ESP","https://www.roblox.com/asset/?id=6031075931")
EspTab.newToggle("Enable ESP","Turn ESP On/Off",false,function(EnableEsp)EspEnabled=EnableEsp end)
EspTab.newToggle("ESP Line","Show Lines to Players",false,function(Espline)EspLineEnabled=Espline end)
EspTab.newDropdown("Line Color","Set Line Color",{"Red","Green","Blue","Rainbow"},function(selectedColor)if selectedColor=="Red"then EspLineColor=Color3.fromRGB(255,0,0)EspLineRainbow=false elseif selectedColor=="Green"then EspLineColor=Color3.fromRGB(0,255,0)EspLineRainbow=false elseif selectedColor=="Blue"then EspLineColor=Color3.fromRGB(0,0,255)EspLineRainbow=false elseif selectedColor=="Rainbow"then EspLineRainbow=true end end)
EspTab.newToggle("ESP Box","Show Boxes Around Players",false,function(Espbox)EspBoxEnabled=Espbox end)
EspTab.newDropdown("Box Color","Set Box Color",{"Red","Green","Blue","Rainbow"},function(selectedColor)if selectedColor=="Red"then EspBoxColor=Color3.fromRGB(255,0,0)EspBoxRainbow=false elseif selectedColor=="Green"then EspBoxColor=Color3.fromRGB(0,255,0)EspBoxRainbow=false elseif selectedColor=="Blue"then EspBoxColor=Color3.fromRGB(0,0,255)EspBoxRainbow=false elseif selectedColor=="Rainbow"then EspBoxRainbow=true end end)
EspTab.newToggle("ESP Name","Show Player Names",false,function(Espname)EspNameEnabled=Espname end)
EspTab.newDropdown("Name Color","Set Name Color",{"Red","Green","Blue","Rainbow"},function(selectedColor)if selectedColor=="Red"then EspNameColor=Color3.fromRGB(255,0,0)EspNameRainbow=false elseif selectedColor=="Green"then EspNameColor=Color3.fromRGB(0,255,0)EspNameRainbow=false elseif selectedColor=="Blue"then EspNameColor=Color3.fromRGB(0,0,255)EspNameRainbow=false elseif selectedColor=="Rainbow"then EspNameRainbow=true end end)
EspTab.newToggle("ESP Distance","Show Distance",false,function(Espdistance)EspDistanceEnabled=Espdistance end)
EspTab.newDropdown("Distance Color","Set Distance Color",{"Red","Green","Blue","Rainbow"},function(selectedColor)if selectedColor=="Red"then EspDistanceColor=Color3.fromRGB(255,0,0)EspDistanceRainbow=false elseif selectedColor=="Green"then EspDistanceColor=Color3.fromRGB(0,255,0)EspDistanceRainbow=false elseif selectedColor=="Blue"then EspDistanceColor=Color3.fromRGB(0,0,255)EspDistanceRainbow=false elseif selectedColor=="Rainbow"then EspDistanceRainbow=true end end)
EspTab.newToggle("ESP HP","Show Health Bars",false,function(EspHP)EspHPEnabled=EspHP end)
EspTab.newDropdown("HP Color","Set HP Color",{"Red","Green","Blue","Rainbow"},function(selectedColor)if selectedColor=="Red"then EspHPColor=Color3.fromRGB(255,0,0)EspHPRainbow=false elseif selectedColor=="Green"then EspHPColor=Color3.fromRGB(0,255,0)EspHPRainbow=false elseif selectedColor=="Blue"then EspHPColor=Color3.fromRGB(0,0,255)EspHPRainbow=false elseif selectedColor=="Rainbow"then EspHPRainbow=true end end)
EspTab.newToggle("Wallhack","Highlight Through Walls",false,function(Wallhack)WallhackEnabled=Wallhack end)
EspTab.newDropdown("Wallhack Color","Set Wallhack Color",{"Yellow","Red","Green","Rainbow"},function(selectedColor)if selectedColor=="Yellow"then WallhackColor=Color3.fromRGB(255,255,0)WallhackRainbow=false elseif selectedColor=="Red"then WallhackColor=Color3.fromRGB(255,0,0)WallhackRainbow=false elseif selectedColor=="Green"then WallhackColor=Color3.fromRGB(0,255,0)WallhackRainbow=false elseif selectedColor=="Rainbow"then WallhackRainbow=true end end)
local SettingTab=DrRayLibrary.newTab("SETTING","https://www.roblox.com/asset/?id=6031280882")
SettingTab.newToggle("FPS","Show FPS",false,function(FpsToggle)ShowFps=FpsToggle if ShowFps then if not FpsLabel then FpsLabel=Drawing.new("Text")FpsLabel.Text="FPS: 0"FpsLabel.Size=20 FpsLabel.Color=Color3.fromRGB(255,255,255)FpsLabel.Visible=true end if FpsPosition=="TopLeft"then FpsLabel.Position=Vector2.new(10,10)elseif FpsPosition=="TopRight"then FpsLabel.Position=Vector2.new(Camera.ViewportSize.X-100,10)elseif FpsPosition=="BottomLeft"then FpsLabel.Position=Vector2.new(10,Camera.ViewportSize.Y-30)elseif FpsPosition=="BottomRight"then FpsLabel.Position=Vector2.new(Camera.ViewportSize.X-100,Camera.ViewportSize.Y-30)end else if FpsLabel then FpsLabel.Visible=false end end end)
SettingTab.newDropdown("FPS Position","Set FPS Position",{"TopLeft","TopRight","BottomLeft","BottomRight"},function(selectedPosition)FpsPosition=selectedPosition if FpsLabel and ShowFps then if FpsPosition=="TopLeft"then FpsLabel.Position=Vector2.new(10,10)elseif FpsPosition=="TopRight"then FpsLabel.Position=Vector2.new(Camera.ViewportSize.X-100,10)elseif FpsPosition=="BottomLeft"then FpsLabel.Position=Vector2.new(10,Camera.ViewportSize.Y-30)elseif FpsPosition=="BottomRight"then FpsLabel.Position=Vector2.new(Camera.ViewportSize.X-100,Camera.ViewportSize.Y-30)end end end)
SettingTab.newToggle("Auto Fix","Auto recover if functions fail",true,function(AutoFix)AutoFixEnabled=AutoFix end)
SettingTab.newToggle("Optimize Performance","Reduce lag and boost FPS",false,function(Optimize)OptimizePerformanceEnabled=Optimize if OptimizePerformanceEnabled then for _,obj in pairs(workspace:GetDescendants())do if obj:IsA("BasePart")and not obj.Parent:FindFirstChild("Humanoid")then obj.Material=Enum.Material.SmoothPlastic obj.Reflectance=0 obj.CastShadow=false end end game.Lighting.GlobalShadows=false game.Lighting.FogEnd=100000 settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 else for _,obj in pairs(workspace:GetDescendants())do if obj:IsA("BasePart")then obj.CastShadow=true end end game.Lighting.GlobalShadows=true game.Lighting.FogEnd=10000 settings().Rendering.QualityLevel=Enum.QualityLevel.Automatic end end)
SettingTab.newToggle("Auto Respawn","Respawn instantly on death",false,function(AutoRespawn)AutoRespawnEnabled=AutoRespawn end)
FovCircle.Thickness=2 FovCircle.Color=FovColor FovCircle.Position=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)FovCircle.Radius=FovSize FovCircle.Visible=false FovCircle.Filled=false
local function GetClosestPlayer()local ClosestPlayer=nil local ShortestDistance=math.huge for _,player in pairs(Players:GetPlayers())do if player~=LocalPlayer and player.Character then local humanoid=player.Character:FindFirstChild("Humanoid")local part=player.Character:FindFirstChild(TargetPart)or player.Character:FindFirstChild("HumanoidRootPart")if humanoid and part and humanoid.Health>0 then if TeamCheckEnabled and IsTeamGame then if player.TeamColor and LocalPlayer.TeamColor and player.TeamColor==LocalPlayer.TeamColor then continue end end local ScreenPos,OnScreen=Camera:WorldToViewportPoint(part.Position)local CenterScreen=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)local Distance=(Vector2.new(ScreenPos.X,ScreenPos.Y)-CenterScreen).Magnitude if OnScreen and Distance<=FovSize then if WallCheckEnabled then local ray=Ray.new(Camera.CFrame.Position,(part.Position-Camera.CFrame.Position).Unit*500)local hit=workspace:FindPartOnRayWithIgnoreList(ray,{LocalPlayer.Character})if hit and hit:IsDescendantOf(player.Character)then if Distance<ShortestDistance then ClosestPlayer=player ShortestDistance=Distance end end else if Distance<ShortestDistance then ClosestPlayer=player ShortestDistance=Distance end end end end end end return ClosestPlayer end
local function CreateESP(player)if player==LocalPlayer then return end local Esp={Line=Drawing.new("Line"),Box=Drawing.new("Square"),Name=Drawing.new("Text"),Distance=Drawing.new("Text"),HPBar=Drawing.new("Square"),HPFill=Drawing.new("Square"),Highlight=Instance.new("Highlight")}Esp.Highlight.Adornee=player.Character Esp.Highlight.FillTransparency=0.5 Esp.Highlight.OutlineTransparency=0 Esp.Highlight.FillColor=WallhackColor Esp.Highlight.OutlineColor=WallhackColor Esp.Highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop Esp.Highlight.Parent=game.CoreGui EspObjects[player]=Esp local function UpdateESP()if not EspEnabled or not player.Character then for _,obj in pairs(Esp)do if obj~=Esp.Highlight then obj.Visible=false end end Esp.Highlight.Enabled=false return end local HRP=player.Character:FindFirstChild("HumanoidRootPart")local Humanoid=player.Character:FindFirstChild("Humanoid")if not HRP or not Humanoid then for _,obj in pairs(Esp)do if obj~=Esp.Highlight then obj.Visible=false end end Esp.Highlight.Enabled=false return end local isTeammate=false if TeamCheckEnabled and IsTeamGame then if player.TeamColor and LocalPlayer.TeamColor and player.TeamColor==LocalPlayer.TeamColor then isTeammate=true end end if isTeammate then for _,obj in pairs(Esp)do if obj~=Esp.Highlight then obj.Visible=false end end Esp.Highlight.Enabled=false return end local ScreenPos,OnScreen=Camera:WorldToViewportPoint(HRP.Position)local Distance=(LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")and(LocalPlayer.Character.HumanoidRootPart.Position-HRP.Position).Magnitude)or 0 if OnScreen and Humanoid.Health>0 then Esp.Line.Visible=EspLineEnabled Esp.Line.From=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y)Esp.Line.To=Vector2.new(ScreenPos.X,ScreenPos.Y)Esp.Line.Color=EspLineRainbow and Color3.fromHSV(RainbowHue,1,1)or EspLineColor Esp.Line.Thickness=1 local BoxSize=Vector2.new(30,40)Esp.Box.Visible=EspBoxEnabled Esp.Box.Size=BoxSize Esp.Box.Position=Vector2.new(ScreenPos.X-BoxSize.X/2,ScreenPos.Y-BoxSize.Y/2)Esp.Box.Color=EspBoxRainbow and Color3.fromHSV(RainbowHue,1,1)or EspBoxColor Esp.Box.Thickness=1 Esp.Box.Filled=false Esp.Name.Visible=EspNameEnabled Esp.Name.Text=player.Name Esp.Name.Position=Vector2.new(ScreenPos.X,ScreenPos.Y-BoxSize.Y/2-15)Esp.Name.Color=EspNameRainbow and Color3.fromHSV(RainbowHue,1,1)or EspNameColor Esp.Name.Size=12 Esp.Name.Center=true Esp.Distance.Visible=EspDistanceEnabled Esp.Distance.Text=tostring(math.floor(Distance)).." studs"Esp.Distance.Position=Vector2.new(ScreenPos.X,ScreenPos.Y+BoxSize.Y/2+5)Esp.Distance.Color=EspDistanceRainbow and Color3.fromHSV(RainbowHue,1,1)or EspDistanceColor Esp.Distance.Size=12 Esp.Distance.Center=true local HPPercent=Humanoid.Health/Humanoid.MaxHealth Esp.HPBar.Visible=EspHPEnabled Esp.HPBar.Size=Vector2.new(30,3)Esp.HPBar.Position=Vector2.new(ScreenPos.X-15,ScreenPos.Y+BoxSize.Y/2+15)Esp.HPBar.Color=Color3.fromRGB(50,50,50)Esp.HPBar.Filled=true Esp.HPFill.Visible=EspHPEnabled Esp.HPFill.Size=Vector2.new(30*HPPercent,3)Esp.HPFill.Position=Vector2.new(ScreenPos.X-15,ScreenPos.Y+BoxSize.Y/2+15)Esp.HPFill.Color=EspHPRainbow and Color3.fromHSV(RainbowHue,1,1)or EspHPColor Esp.HPFill.Filled=true Esp.Highlight.Enabled=WallhackEnabled Esp.Highlight.Adornee=player.Character Esp.Highlight.FillColor=WallhackRainbow and Color3.fromHSV(RainbowHue,1,1)or WallhackColor Esp.Highlight.OutlineColor=WallhackRainbow and Color3.fromHSV(RainbowHue,1,1)or WallhackColor else for _,obj in pairs(Esp)do if obj~=Esp.Highlight then obj.Visible=false end end Esp.Highlight.Enabled=false end end RunService.RenderStepped:Connect(UpdateESP)end
RunService.RenderStepped:Connect(function(deltaTime)RainbowHue=(RainbowHue+deltaTime*0.5)%1 if AimbotEnabled then local Target=GetClosestPlayer()if Target and Target.Character and Target.Character:FindFirstChild(TargetPart)then local TargetPos=Target.Character[TargetPart].Position local CurrentCFrame=Camera.CFrame local TargetCFrame=CFrame.new(CurrentCFrame.Position,TargetPos)if AimbotMode=="Smooth"then Camera.CFrame=CurrentCFrame:Lerp(TargetCFrame,SmoothSpeed)elseif AimbotMode=="Instant"then Camera.CFrame=TargetCFrame end end FovCircle.Visible=ShowFov if FovRainbow then FovCircle.Color=Color3.fromHSV(RainbowHue,1,1)end else FovCircle.Visible=false end if EspEnabled then for _,player in pairs(Players:GetPlayers())do if not EspObjects[player]and player~=LocalPlayer and player.Character then CreateESP(player)end end end if AutoFixEnabled and LocalPlayer.Character then local humanoid=LocalPlayer.Character:FindFirstChild("Humanoid")local root=LocalPlayer.Character:FindFirstChild("HumanoidRootPart")if humanoid and root then if AutoRespawnEnabled and humanoid.Health<=0 then LocalPlayer:LoadCharacter()wait(0.05)end end end for _,player in pairs(Players:GetPlayers())do if player~=LocalPlayer and player.Character then local humanoid=player.Character:FindFirstChild("Humanoid")local rootPart=player.Character:FindFirstChild("HumanoidRootPart")if humanoid and rootPart and humanoid.Health>0 then if HitboxEnabled then if not(TeamCheckEnabled and IsTeamGame and player.TeamColor and LocalPlayer.TeamColor and player.TeamColor==LocalPlayer.TeamColor)then rootPart.Size=Vector3.new(HitboxSize,HitboxSize,HitboxSize)rootPart.Transparency=0.7 rootPart.CanCollide=false end else rootPart.Size=Vector3.new(2,2,1)rootPart.Transparency=0 rootPart.CanCollide=true end end end end end)
for _,player in pairs(Players:GetPlayers())do CreateESP(player)end
Players.PlayerAdded:Connect(function(player)if EspEnabled then CreateESP(player)end CheckTeamMode()end)
Players.PlayerRemoving:Connect(function(player)if EspObjects[player]then for _,obj in pairs(EspObjects[player])do obj:Remove()end EspObjects[player]=nil end CheckTeamMode()end)
local LastTime=tick()local FrameCount=0 RunService.RenderStepped:Connect(function()if ShowFps and FpsLabel then FrameCount=FrameCount+1 local CurrentTime=tick()if CurrentTime-LastTime>=1 then FpsLabel.Text="FPS: "..math.floor(FrameCount/(CurrentTime-LastTime))FrameCount=0 LastTime=CurrentTime end end end)
CheckTeamMode()
