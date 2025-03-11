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
local WallCheckEnabled=true
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
