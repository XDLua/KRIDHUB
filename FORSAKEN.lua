local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()


local isHighlightActive = false

local toolhighlightactive = false

local hawktuahactive = false

local isCorruptNatureEspActive = false

local isSurvivorUtilEspActive = false

local run = false

local delay

local isSurvivorHighlightActive = false

local givepizza = false

local connections = {}

local isKillerHighlightActive = false

local hideplayerbar = false

local VirtualBallsManager = game:GetService('VirtualInputManager')

local jumppowerenabled = false

local survivorutil = {
    "007n7",
    "BuildermanSentry",
    "BuildermanDispenser",
    "Pizza",
    "BuildermanSentryEffectRange"
}





local aimbot1x1sounds = {
    "rbxassetid://79782181585087",
    "rbxassetid://128711903717226"
}

local chanceaimbotsounds = {
    "rbxassetid://201858045",
    "rbxassetid://139012439429121"
}

local johnaimbotsounds = {
    "rbxassetid://109525294317144"
}

local jasonaimbotsounds = {
    "rbxassetid://112809109188560",
    "rbxassetid://102228729296384"
}

local shedaimbotsounds = {
    "rbxassetid://12222225",
    "rbxassetid://83851356262523"
}

local guestsounds = {
    "rbxassetid://609342351"
}

local hawktuahactivatesound = {
    "rbxassetid://110759725172567"
}

local hakariactive = false

local quietactive = false

local stam = false

local connection

local chanceaim = false

local chanceaimbotLoop

local jasonaimbotloop

local genshouldloop = false

local genactive = false

local aimbot1x1loop

local johnloop

local guestloop

local shedloop

local player = game.Players.LocalPlayer

local aimbot1x1 = false

local johnaim = false

local connection

local jasonaim = false

local shedaim = false

local guestaim = false




local function initialize()
    local GUI = Mercury:Create{
        Name = "Appleware",
        Size = UDim2.fromOffset(600, 400),
        Theme = Mercury.Themes.Dark,
        Link = "https://GOAPPLENATION!/appleman"
    }

    local function button1() -- creds to ivan
		local visible = true
		local sausageHolder = game:GetService("CoreGui").TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
		local originalSize = sausageHolder.Size.X.Offset

		sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)

		local buttonFrame = Instance.new("Frame", sausageHolder)
		buttonFrame.Size = UDim2.new(0, 44, 0, 44)
		buttonFrame.BackgroundTransparency = 1
		buttonFrame.BorderSizePixel = 0
		buttonFrame.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)

		local imageButton = Instance.new("ImageButton", buttonFrame)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.Size = UDim2.new(0, 36, 0, 36)
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageButton.Image = "http://www.roblox.com/asset/?id=99937635381008"

		local function toggleGUI()
			visible = not visible
			GUI:show(visible)
			sausageHolder.Size = UDim2.new(0, originalSize + (visible and 48 or 0), 0, sausageHolder.Size.Y.Offset)
		end

		imageButton.Activated:Connect(toggleGUI)

		sausageHolder:GetPropertyChangedSignal("Size"):Connect(function()
			if sausageHolder.Size.X.Offset == originalSize then
				sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
			end
		end)
	end

	local function button2() -- creds to ivan
		local visible = true
		local topBarApp = game:GetService("CoreGui"):WaitForChild("TopBarApp")
		local leftFrame = topBarApp:WaitForChild("TopBarFrame"):WaitForChild("LeftFrame")

		local sigmaFrame = Instance.new("Frame", leftFrame)
		sigmaFrame.Name = "SigmaFrame"
		sigmaFrame.Size = UDim2.new(0, 32, 0, 32)
		sigmaFrame.Position = UDim2.new(0, 0, 1, 0)
		sigmaFrame.BackgroundTransparency = 1
		sigmaFrame.LayoutOrder = 5

		local background = Instance.new("ImageLabel", sigmaFrame)
		background.Name = "Background"
		background.Size = UDim2.new(0, 32, 0, 32)
		background.Position = UDim2.new(0, 0, 0, 0)
		background.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
		background.BackgroundTransparency = 1

		local icon = Instance.new("ImageButton", background)
		icon.Name = "Icon"
		icon.Size = UDim2.new(0, 36, 0, 36)
		icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		icon.AnchorPoint = Vector2.new(0.5, 0.5)
		icon.Image = "http://www.roblox.com/asset/?id=99937635381008"
		icon.BackgroundTransparency = 1

		local function toggleGUI()
			visible = not visible
			GUI:show(visible)
		end
		icon.Activated:Connect(toggleGUI)
	end

	local function init() -- creds to ivan
		if game:GetService("CoreGui"):FindFirstChild("TopBarApp"):FindFirstChild("UnibarLeftFrame") then
			button1()
		else
			button2()
		end
	end

    init()




    local function toggleHighlightGen(state)
        isHighlightActive = state 
    
        local function applyGeneratorHighlight(generator)
            if generator.Name == "Generator" then
                local existingHighlight = generator:FindFirstChild("GeneratorHighlight")
                local progress = generator:FindFirstChild("Progress")
                
                if isHighlightActive then
                    if not existingHighlight then
                        local genhighlight = Instance.new("Highlight")
                        genhighlight.Parent = generator
                        genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        genhighlight.Name = "GeneratorHighlight"
                    end
                else
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                    return
                end
    
                if progress then
                    if progress.Value == 100 then
                        local highlight = generator:FindFirstChild("GeneratorHighlight")
                        if highlight then
                            highlight:Destroy()
                        end
                        return
                    end
    
                    progress:GetPropertyChangedSignal("Value"):Connect(function()
                        if progress.Value == 100 then
                            local highlight = generator:FindFirstChild("GeneratorHighlight")
                            if highlight then
                                highlight:Destroy()
                            end
                        elseif isHighlightActive and not generator:FindFirstChild("GeneratorHighlight") then
                            local genhighlight = Instance.new("Highlight")
                            genhighlight.Parent = generator
                            genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            genhighlight.Name = "GeneratorHighlight"
                        end
                    end)
                end
            end
        end
    
        for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
            applyGeneratorHighlight(v)
        end
    
        game.Workspace.Map.Ingame.Map.ChildAdded:Connect(function(child)
            applyGeneratorHighlight(child)
        end)
    end
    
    
    
    local function togglehidebar(state)
        hideplayerbar = state 
        local playergui = player.PlayerGui
        local playerinfo = playergui.TemporaryUI.PlayerInfo
    
        if hideplayerbar then
            playerinfo.CurrentSurvivors.Visible = false
            playerinfo.PlayerIcon.Image = "rbxassetid://12549056837"
        else
            playerinfo.CurrentSurvivors.Visible = true
        end
    end
    
    
    local function hawktuahmode(state)
        if player.Character.Name ~= "c00lkidd" then
            GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't COolkid, this POSSIBLY can bug out, so untoggle unless you're on Coolkidd!", Duration = 5}
            return end
        local TS = game:GetService("TweenService")
        hawktuahactive = state
    if state then
        GUI:Notification{Title = "DM", Text = "hawk tuah mode", Duration = 10}
    end
        
        game.DescendantAdded:Connect(function(descendant)
            for _, v in pairs(hawktuahactivatesound) do
            if descendant.Name == v then
                if hawktuahactive then
                    local propout = {
                        ImageTransparency = 1
                    }
    
                    local propin = {
                        ImageTransparency = 0
                    }
    
                    local screengui = Instance.new("ScreenGui")
                    local frame = Instance.new("Frame")
                    local image = Instance.new("ImageLabel")
                    local sound = Instance.new("Sound")
                    sound.Parent = game.Workspace
                    sound.SoundId = "rbxassetid://17787027130"
                    sound:Play()
    
                    screengui.Parent = game.Players.LocalPlayer.PlayerGui
                    screengui.IgnoreGuiInset = true
                    frame.Parent = screengui
                    image.Parent = frame
    
                    frame.Size = UDim2.new(1,0,1,0)
                    frame.Position = UDim2.new(0, 0, 0, 0)
                    frame.BackgroundTransparency = 1
    
                    image.Size = UDim2.new(1,0,1,0)
                    image.Position = UDim2.new(0, 0, 0, 0)
                    image.BackgroundTransparency = 1
    
                    image.Image = "http://www.roblox.com/asset/?id=100505038126957"
    
                    local tweeninfoI = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
                    local tween = TS:Create(image,tweeninfoI, propout)
                    tween:play()
    
                   
                    wait(1)
    
                    local tweeninfoII = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                    local tweenI = TS:Create(image,tweeninfoII, propin)
                    tweenI:play()
                    screengui:Destroy()
                end
            end
        end
        end)
    end
    
    
    
    local function Do1x1x1x1Popups() -- creds to ivan
        while true do
            if Do1x1PopupsLoop then
                local player = game:GetService("Players").LocalPlayer
                local popups = player.PlayerGui.TemporaryUI:GetChildren()
    
                for _, i in ipairs(popups) do
                    if i.Name == "1x1x1x1Popup" then
                        local centerX = i.AbsolutePosition.X + (i.AbsoluteSize.X / 2)
                        local centerY = i.AbsolutePosition.Y + (i.AbsoluteSize.Y / 2)
                        if DebugNotifications then GUI:Notification{Title = "1x1x1x1 Popup Closed", Text = (pcall(function() return i:GetFullName() end) and i:GetFullName() or "Closed"), Duration = 3} else end
                        VirtualBallsManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, true, player.PlayerGui, 1)
                        VirtualBallsManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, false, player.PlayerGui, 1)
                    end
                end
            end
            task.wait(0.1)
        end
    end
    
    
    local function instantsolvegen()
        for i, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
            if v.name == "Generator" then
                local num = 0
                repeat
                num += 1
                v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                until num == 4
            end
        end
    end
    
    local function solvegen()
        for i, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
            if v.name == "Generator" then
                v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
            end
        end
    end
    
    
    local function instantsolvegenhell()
        for i, v in pairs(game.Workspace.Map.Ingame.Map.Generators:GetChildren()) do
            if v:IsA("Model") then
                local num = 0
                repeat
                num += 1
                v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                until num == 4
            end
        end
    end
    
    local function highlighttools(state)
        toolhighlightActive = state
        
        local function applyHighlight(tool)
            if toolhighlightActive then
                local existinghighlight = tool:FindFirstChild("ToolHighlight")
                if not existinghighlight then
                    local toolhighlight = Instance.new("Highlight")
                    toolhighlight.Name = "ToolHighlight"
                    toolhighlight.Parent = tool
                    toolhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
                    if tool.Name == "Medkit" then
                        toolhighlight.FillColor = Color3.fromRGB(0, 255, 0)
                    elseif tool.Name == "BloxyCola" then
                        toolhighlight.FillColor = Color3.fromRGB(88, 57, 39)
                    end
                end
            else
                local existinghighlight = tool:FindFirstChild("ToolHighlight")
                if existinghighlight then
                    existinghighlight:Destroy()
                end
            end
        end
        
        for _, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
            if v:IsA("Tool") then
                applyHighlight(v)
            end
        end
        
        game.Workspace.Map.Ingame.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then
                applyHighlight(child)
            end
        end)
    end
    



    local function givemesomepizza(state)
        if not state then
            
            for _, v in pairs(connections) do
                v:Disconnect()
            end
            table.clear(connections)
            return
        end
    
        
        local function tp(child)
            if child:IsA("BasePart") and child.Name == "Pizza" then
                local player = game.Players.LocalPlayer
                if player and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        child.CFrame = hrp.CFrame
                    end
                end
            end
        end
    
        
        local function watchtower()
            local map = workspace:FindFirstChild("Map")
            local insession = map and map:FindFirstChild("Ingame")
    
            if insession then
                
                for _, child in pairs(insession:GetChildren()) do
                    tp(child)
                end
                
                table.insert(connections, insession.ChildAdded:Connect(tp))
            end
        end
    
        
        watchtower()
    end

    local function setdelay(value)
        delay = value
        
    end

        
    
    local function autogen(state)
        run = state
        
        local debounce = {}
        


        while run do
            task.wait()
            for _, v in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" then
                    
                    if not debounce[v] then
                        debounce[v] = true
                        v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                        task.delay(delay, function() debounce[v] = nil end)
                    end
                end
            end
        end
    end
    





    
    local function corruptnatureesp(state)
        isCorruptNatureEspActive = state
        for i, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
            if v:IsA("Model") then
                local existingHighlight = v:FindFirstChild("CorruptNatureHighlight")
                if isCorruptNatureEspActive then
                    if not existingHighlight then
                        if v.Name == "HumanoidRootProjectile" or v.Name == "PizzaDeliveryRig" or v.Name == "Bunny" or v.Name == "Mafiaso1" or v.Name == "Mafiaso2" or v.Name == "Mafiaso3" then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "CorruptNatureHighlight"
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            highlight.Parent = v
                        end
                    end
                else
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                end
            end
        end
    end
    
    
    local function survivorutilesp(state)
        isSurvivorUtilEspActive = state
        
        local function applySurvivorUtilHighlight(model)
            local existingHighlight = model:FindFirstChild("SurvivorUtilHighlight")
            if isSurvivorUtilEspActive then
                if not existingHighlight then
                    for _, util in pairs(survivorutil) do
                        if model.Name == util then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "SurvivorUtilHighlight"
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            highlight.FillColor = Color3.fromRGB(255,255,255)
                            highlight.FillTransparency = 0.5
                            highlight.Parent = model
                        end
                    end
                end
            else
                if existingHighlight then
                    existingHighlight:Destroy()
                end
            end
        end
        
        for _, v in pairs(game.Workspace.Map.Ingame:GetChildren()) do
            if v:IsA("Model") or v:IsA("Part") then
                applySurvivorUtilHighlight(v)
            end
        end
        
        game.Workspace.Map.Ingame.ChildAdded:Connect(function(child)
            if child:IsA("Model") or child:IsA("Part") then
                applySurvivorUtilHighlight(child)
            end
        end)
    end
    
    
    local function activatethehakari(state)
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
    
        hakariactive = state
    
        if hakariactive then
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
    
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
    
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://138019937280193"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
    
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://87166578676888"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = true
            sound:Play()
    
            local effect = game.ReplicatedStorage.Assets.Emotes.HakariDance.HakariBeamEffect:Clone()
            effect.Name = "PlayerEmoteVFX"
            effect.CFrame = char.PrimaryPart.CFrame * CFrame.new(0, -1, -0.3)
            effect.WeldConstraint.Part0 = char.PrimaryPart
            effect.WeldConstraint.Part1 = effect
            effect.Parent = char
            effect.CanCollide = false
    
            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "HakariDance"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
            end)
        else
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0 
    
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
    
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
    
            local effect = char:FindFirstChild("PlayerEmoteVFX")
            if effect then
                effect:Destroy()
            end
    
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://138019937280193" then
                    track:Stop()
                end
            end
        end
    end
    
    
    local function activatethesilly(state)
    
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        sillyactive = state
    
        if sillyactive then
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
        
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
        
           
            local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes.Shucks)
            emoteScript.Created({Character = char})
        
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://74238051754912"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
        
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://123236721947419"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()
        
            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "Shucks"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
        
                
                local saw = char:FindFirstChild("Saw")
                if saw then saw:Destroy() end
        
                local playerHand = char:FindFirstChild("PlayerEmoteHand")
                if playerHand then playerHand:Destroy() end
            end)
        else
    
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
    
            local saw = char:FindFirstChild("Saw")
            if saw then saw:Destroy() end
    
            local playerHand = char:FindFirstChild("PlayerEmoteHand")
            if playerHand then playerHand:Destroy() end
    
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
    
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
    
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://74238051754912" then
                    track:Stop()
                end
            end
        end
    end
    
    
    local function activatethequiet(state)
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
        sillyactive = state
    
        if sillyactive then
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
        
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
        
            local emoteScript = require(game:GetService("ReplicatedStorage").Assets.Emotes.MissTheQuiet)
            emoteScript.Created({Character = char})
        
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://100986631322204"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
        
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://131936418953291"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()
        
            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "MissTheQuiet"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
        
                local assetsToDestroy = {"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}
                for _, assetName in ipairs(assetsToDestroy) do
                    local asset = char:FindFirstChild(assetName)
                    if asset then asset:Destroy() end
                end
            end)
        else
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
        
            local assetsToDestroy = {"EmoteHatAsset", "EmoteLighting", "PlayerEmoteHand"}
            for _, assetName in ipairs(assetsToDestroy) do
                local asset = char:FindFirstChild(assetName)
                if asset then asset:Destroy() end
            end
        
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
        
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
        
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://100986631322204" then
                    track:Stop()
                end
            end
        end
    end
    
    
    local function activatethesilly2(state)
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        local rootPart = char:WaitForChild("HumanoidRootPart")
    
        sillyactive = state
    
        if sillyactive then
            humanoid.PlatformStand = true
            humanoid.JumpPower = 0
    
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = rootPart
    
    
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://74238051754912"
            local animationTrack = humanoid:LoadAnimation(animation)
            animationTrack:Play()
    
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://123236721947419"
            sound.Parent = rootPart
            sound.Volume = 0.5
            sound.Looped = false
            sound:Play()
    
            local args = {
                [1] = "PlayEmote",
                [2] = "Animations",
                [3] = "Shucks"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    
            animationTrack.Stopped:Connect(function()
                humanoid.PlatformStand = false
                if bodyVelocity and bodyVelocity.Parent then
                    bodyVelocity:Destroy()
                end
            end)
        else
            humanoid.PlatformStand = false
            humanoid.JumpPower = 0
    
            local bodyVelocity = rootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
    
            local sound = rootPart:FindFirstChildOfClass("Sound")
            if sound then
                sound:Stop()
                sound:Destroy()
            end
    
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if track.Animation.AnimationId == "rbxassetid://74238051754912" then
                    track:Stop()
                end
            end
        end
    end
    
    
    
    
    local function survivorHighlighter(state)
        isSurvivorHighlightActive = state
    
        local function applySurvivorHighlight(model)
            if model:IsA("Model") and model:FindFirstChild("Head") then
                local existingBillboard = model.Head:FindFirstChild("billboard")
                local existingHighlight = model:FindFirstChild("HiThere")
                
                if isSurvivorHighlightActive then
                    if not existingBillboard then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "billboard"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = model.Head
                        
                        local textLabel = Instance.new("TextLabel", billboard)
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Text = model.Name
                        textLabel.TextColor3 = Color3.new(1, 1, 1)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                    end
    
                    if not existingHighlight then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "HiThere"
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = Color3.fromRGB(0, 255, 0)
                        highlight.Parent = model
                    end
                else
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                end
            end
        end
    
        for _, v in pairs(game.Workspace.Players.Survivors:GetChildren()) do
            applySurvivorHighlight(v)
        end
    
        game.Workspace.Players.Survivors.ChildAdded:Connect(function(child)
            applySurvivorHighlight(child)
        end)
    end
    
    
    
    local function killerHighlighter(state)
        isKillerHighlightActive = state
    
        local function applyKillerHighlight(model)
            if model:IsA("Model") and model:FindFirstChild("Head") then
                local existingBillboard = model.Head:FindFirstChild("billboard")
                local existingHighlight = model:FindFirstChild("HiThere")
                
                if isKillerHighlightActive then
                    if not existingBillboard then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "billboard"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 2, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = model.Head
                        
                        local textLabel = Instance.new("TextLabel", billboard)
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.Text = model.Name
                        textLabel.TextColor3 = Color3.new(1, 0, 0)
                        textLabel.TextStrokeTransparency = 0
                        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                        textLabel.BackgroundTransparency = 1
                    end
    
                    if not existingHighlight then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "HiThere"
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.Parent = model
                    end
                else
                    if existingBillboard then
                        existingBillboard:Destroy()
                    end
                    if existingHighlight then
                        existingHighlight:Destroy()
                    end
                end
            end
        end
    
        for _, v in pairs(game.Workspace.Players.Killers:GetChildren()) do
            applyKillerHighlight(v)
        end
    
        game.Workspace.Players.Killers.ChildAdded:Connect(function(child)
            applyKillerHighlight(child)
        end)
    end
    
    local function bringbackjumppower(state)
        jumppowerenabled = state
    
        if jumppowerenabled then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        else
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
        end
       
    end
    
    local function speedmulti(value)
        game.Players.LocalPlayer.Character.SpeedMultipliers.Sprinting.Value = value
    end

    local function bringbackjumppowerslider(value)
    
        if jumppowerenabled then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        else
           return
        end
       
    end
    
    local function FOVmulti(value)
        game.Players.LocalPlayer.Character.FOVMultipliers.FOVSetting.Value = value
    end
    
    local function kaiguyskin()      
        if player.Character.Name ~= "Guest1337" then
                    GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't Guest, this POSSIBLY can bug out, so untoggle unless you're on Guest!", Duration = 5}
                    return end
            for _, v in pairs(player.Character:GetChildren()) do
                if v:IsA("Shirt") then
                    v:Destroy()
                end
    
                if v:IsA("Pants") then
                    v:Destroy()
                end
    
                local headband = Instance.new("Accessory")
                local scarf = Instance.new("Accessory")
                local shirt = Instance.new("Shirt")
                local pants = Instance.new("Pants")
                --
                local headbandhandle = Instance.new("Part")
                local scarfhandle = Instance.new("Part")
                local headbandhandleattach = Instance.new("Attachment")
                local scarfhandleattach = Instance.new("Attachment")
                local headbandweld = Instance.new("Weld")
                local scarfweld = Instance.new("Weld")
                scarfhandle.Name = "Handle"
                headbandhandle.Name = "Handle"
                scarfhandle.CanCollide = false
                headbandhandle.CanCollide = false
                --
                local headbandmesh = Instance.new("SpecialMesh")
                local scarfmesh = Instance.new("SpecialMesh")
                --
                shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=836903658"
                pants.PantsTemplate = "http://www.roblox.com/asset/?id=731578592"
                shirt.Parent = player.Character
                pants.Parent = player.Character
                 --
                headband.Parent = player.Character
                scarf.Parent = player.Character
                scarfhandle.Parent = scarf
                headbandhandle.Parent = headband
                headbandhandleattach.Parent = headbandhandle
                scarfhandleattach.Parent = scarfhandle
                headbandmesh.Parent = headbandhandle
                scarfmesh.Parent = scarfhandle
                headbandhandle.Color = Color3.fromRGB(27, 42, 53)
                scarfhandle.Color = Color3.fromRGB(27, 42, 53)
                --
                headbandweld.Parent = headbandhandle
                headbandweld.Name = "AccessoryWeld"
                headbandweld.Part0 = headbandhandle
                headbandweld.Part1 = player.Character.Head
                headbandweld.C0 = CFrame.new(0, 0, 0)
                headbandweld.C1 = CFrame.new(0, 0, 0)
                --
                scarfweld.Parent = scarfhandle
                scarfweld.Name = "AccessoryWeld"
                scarfweld.Part0 = scarfhandle
                scarfweld.Part1 = player.Character.Torso
                scarfweld.C0 = CFrame.new(0, -0.4, 0)
                scarfweld.C1 = CFrame.new(0, 0, 0)
                --
                headbandmesh.MeshId = "http://www.roblox.com/asset/?id=20407184"
                headbandmesh.Scale = Vector3.new(1.103, 1.071, 1.103)
                scarfmesh.MeshId = "http://www.roblox.com/asset/?id=99856331"
                scarfmesh.Scale = Vector3.new(1.071, 1.071, 1.071)
                scarfmesh.VertexColor = Vector3.new(1, 2, 1)
                --
                headbandhandleattach.Name = "HatAttachment"
                headbandhandleattach.CFrame = CFrame.new(0, 0.557, 0)
                scarfhandleattach.Name = "NeckAttachment"
                scarfhandleattach.CFrame = CFrame.new(0, 0.519, 0)
    
                local playergui = player.PlayerGui
                local playerinfo = playergui.TemporaryUI.PlayerInfo
    
        
            playerinfo.PlayerIcon.Image = "http://www.roblox.com/asset/?id=97047410245118"
     
    
            end
    end
    
    local function doomskin()      
        if player.Character.Name ~= "Shedletsky" then
                    GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't Shedletsky, this POSSIBLY can bug out, so untoggle unless you're on Shedletsky!", Duration = 5}
                    return end
            for _, v in pairs(player.Character:GetChildren()) do
                if v:IsA("Shirt") then
                    v:Destroy()
                end
    
                if v:IsA("Pants") then
                    v:Destroy()
                end
    
                local headband = Instance.new("Accessory")
             
                local shirt = Instance.new("Shirt")
                local pants = Instance.new("Pants")
                local tshirt = Instance.new("ShirtGraphic")
                --
                local headbandhandle = Instance.new("Part")
             
                local headbandhandleattach = Instance.new("Attachment")
              
                local headbandweld = Instance.new("Weld")
               
               
                headbandhandle.Name = "Handle"
              
                headbandhandle.CanCollide = false
                --
                local headbandmesh = Instance.new("SpecialMesh")
              
                --
                shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=1808496"
                pants.PantsTemplate = "http://www.roblox.com/asset/?id=1809861"
                tshirt.Graphic = "http://www.roblox.com/asset/?id=2426992"
                shirt.Parent = player.Character
                pants.Parent = player.Character
                tshirt.Parent = player.Character
                 --
                headband.Parent = player.Character
        
                headbandhandle.Parent = headband
                headbandhandleattach.Parent = headbandhandle
                
                headbandmesh.Parent = headbandhandle
               
                headbandhandle.Color = Color3.fromRGB(27, 42, 53)
                
                --
                headbandweld.Parent = headbandhandle
                headbandweld.Name = "AccessoryWeld"
                headbandweld.Part0 = headbandhandle
                headbandweld.Part1 = player.Character.Head
                headbandweld.C0 = CFrame.new(0, -0.5, 0)
                headbandweld.C1 = CFrame.new(0, 0, 0)
                --
                --
                headbandmesh.MeshId = "http://www.roblox.com/asset/?id=1286103"
                headbandmesh.TextureId = "rbxassetid://6858319251"
                headbandmesh.Scale = Vector3.new(0.992, 0.994, 0.992)
               if player.Character:FindFirstChild("ShedHair") then
                player.Character:FindFirstChild("ShedHair"):Destroy()
               end
                --
                headbandhandleattach.Name = "HatAttachment"
                headbandhandleattach.CFrame = CFrame.new(0, 0.557, 0)
    
                local playergui = player.PlayerGui
                local playerinfo = playergui.TemporaryUI.PlayerInfo
    
        
            playerinfo.PlayerIcon.Image = "http://www.roblox.com/asset/?id=118308385507069"
     
    
            end
    end


    
    local function chanceaimbot(state)
        chanceaim = state
        if game.Players.LocalPlayer.Character.Name ~= "Chance" and state then
            GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't Chance, this POSSIBLY can bug out, so untoggle unless you're on Chance!", Duration = 5}
            return 
        end
        if state then
            chanceaimbotLoop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                if not chanceaim then return end
                for _, v in pairs(chanceaimbotsounds) do
                    if child.Name == v  then
                        local killer = game.Workspace.Players:FindFirstChild("Killers"):FindFirstChildOfClass("Model")
                        if killer and killer:FindFirstChild("HumanoidRootPart") then
                            local killerHRP = killer.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if playerHRP then
                                local direction = (killerHRP.Position - playerHRP.Position).Unit
                                local num = 1
                                local maxIterations = 100
                            
                                
                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(killerHRP.Position.X, killerHRP.Position.Y, killerHRP.Position.Z))
                                    end
                                
                            
                            end
                        end
                    end
                end
            end)
        else
            if chanceaimbotLoop then
                chanceaimbotLoop:Disconnect()
                chanceaimbotLoop = nil
            end
        end
    end
    
    local function shedaimbot(state)
        shedaim = state
        if game.Players.LocalPlayer.Character.Name ~= "Shedletsky" and state then
            GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't Shedletsky, this POSSIBLY can bug out, so untoggle unless you're on Shedletsky!", Duration = 5}
            return
        end
        if state then
            shedloop = game.Players.LocalPlayer.Character.Sword.ChildAdded:Connect(function(child)
                if not shedaim then return end
                for _, v in pairs(shedaimbotsounds) do
                    if child.Name == v then
                        local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                        if killersFolder then
                            local killer = killersFolder:FindFirstChildOfClass("Model")
                            if killer and killer:FindFirstChild("HumanoidRootPart") then
                                local killerHRP = killer.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if playerHRP then
                                    local num = 1
                                    local maxIterations = 100
    
                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            if shedloop then
                shedloop:Disconnect()
                shedloop = nil
            end
        end
    end
    
    local function guestaimbot(state)
        shedaim = state
        if game.Players.LocalPlayer.Character.Name ~= "Guest1337" and state then
            GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't Guest, this POSSIBLY can bug out, so untoggle unless you're on Guest!", Duration = 5}
            return
        end
        if state then
            shedloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                if not shedaim then return end
                for _, v in pairs(guestsounds) do
                    if child.Name == v then
                        local killersFolder = game.Workspace.Players:FindFirstChild("Killers")
                        if killersFolder then
                            local killer = killersFolder:FindFirstChildOfClass("Model")
                            if killer and killer:FindFirstChild("HumanoidRootPart") then
                                local killerHRP = killer.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if playerHRP then
                                    local num = 1
                                    local maxIterations = 100
    
                                    while num <= maxIterations do
                                        task.wait(0.01)
                                        num = num + 1
                                        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, killerHRP.Position)
                                        playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, killerHRP.Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            if guestloop then
                guestloop:Disconnect()
                guestloop = nil
            end
        end
    end
        
    local function aimbot1x1x1x1(state)
        aimbot1x1 = state
    
        if game.Players.LocalPlayer.Character.Name ~= "1x1x1x1" and state then
            GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't  1x, this POSSIBLY can bug out, so untoggle unless you're on 1x!", Duration = 5}
            return 
        end
    
        if state then
            aimbot1x1loop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                if not aimbot1x1 then return end
                for _, v in pairs(aimbot1x1sounds) do
                    if child.Name == v then
                        local survivors = {}
                        for _, player in pairs(game.Players:GetPlayers()) do
                            if player ~= game.Players.LocalPlayer then
                                local character = player.Character
                                if character and character:FindFirstChild("HumanoidRootPart") then
                                    table.insert(survivors, character)
                                end
                            end
                        end
    
                        local nearestSurvivor = nil
                        local shortestDistance = math.huge  
                        
                        for _, survivor in pairs(survivors) do
                            local survivorHRP = survivor.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            
                            if playerHRP then
                                local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    nearestSurvivor = survivor
                                end
                            end
                        end
                        
                        if nearestSurvivor then
                            local nearestHRP = nearestSurvivor.HumanoidRootPart
                            local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            
                            if playerHRP then
                                local direction = (nearestHRP.Position - playerHRP.Position).Unit
                                local num = 1
                                local maxIterations = 100 
    
                                
                                    if child.Name == "rbxassetid://79782181585087" then
                                        maxIterations = 220  
                                    end
    
                                while num <= maxIterations do
                                    task.wait(0.01)
                                    num = num + 1
                                    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                    playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                                end
                            
                            end
                        end
                    end
                end
            end)
        else
            if aimbot1x1loop then
                aimbot1x1loop:Disconnect()
                aimbot1x1loop = nil
            end
        end
    end
    
    local function johnaimbot(state)
        johnaim = state
        if game.Players.LocalPlayer.Character.Name ~= "JohnDoe" and state then
            GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't John Doe, this POSSIBLY can bug out, so untoggle unless you're on John!", Duration = 5}
            return 
        end
            if state then
                johnloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                    if not johnaim then return end
                    for _, v in pairs(johnaimbotsounds) do
                        if child.Name == v then
                           
                            local survivors = {}
                            for _, player in pairs(game.Players:GetPlayers()) do
                                if player ~= game.Players.LocalPlayer then
                                    local character = player.Character
                                    if character and character:FindFirstChild("HumanoidRootPart") then
                                        table.insert(survivors, character)
                                    end
                                end
                            end
        
                           
                            local nearestSurvivor = nil
                            local shortestDistance = math.huge  
                            
                            for _, survivor in pairs(survivors) do
                                local survivorHRP = survivor.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                
                                if playerHRP then
                                    local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                                    if distance < shortestDistance then
                                        shortestDistance = distance
                                        nearestSurvivor = survivor
                                    end
                                end
                            end
                            
                          
                            if nearestSurvivor then
                                local nearestHRP = nearestSurvivor.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                local maxIterations = 330
                                if playerHRP then
                                    local direction = (nearestHRP.Position - playerHRP.Position).Unit
                                    local num = 1
                                   
                                        
                                        while num <= maxIterations do
                                            task.wait(0.01)
                                            num = num + 1
                                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearestHRP.Position)
                                            playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                    
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if johnloop then
                    johnloop:Disconnect()
                    johnloop = nil
                end
            end
    end
    
    local function jasonaimbot(state)
        jasonaim = state
        if game.Players.LocalPlayer.Character.Name ~= "Jason" and state then
            GUI:Notification{Title = "Wrong Character", Text = "Oops, your current character isn't Jason, this POSSIBLY can bug out, so untoggle unless you're on Jason. Also this is buggy asf lmao", Duration = 5}
            return 
        end
            if state then
                jasonaimbotloop = game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(child)
                    if not jasonaim then return end
                    for _, v in pairs(jasonaimbotsounds) do
                        if child.Name == v then
                           
                            local survivors = {}
                            for _, player in pairs(game.Players:GetPlayers()) do
                                if player ~= game.Players.LocalPlayer then
                                    local character = player.Character
                                    if character and character:FindFirstChild("HumanoidRootPart") then
                                        table.insert(survivors, character)
                                    end
                                end
                            end
        
                           
                            local nearestSurvivor = nil
                            local shortestDistance = math.huge  
                            
                            for _, survivor in pairs(survivors) do
                                local survivorHRP = survivor.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                
                                if playerHRP then
                                    local distance = (survivorHRP.Position - playerHRP.Position).Magnitude
                                    if distance < shortestDistance then
                                        shortestDistance = distance
                                        nearestSurvivor = survivor
                                    end
                                end
                            end
                            
                          
                            if nearestSurvivor then
                                local nearestHRP = nearestSurvivor.HumanoidRootPart
                                local playerHRP = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                local maxIterations = 70
                                if playerHRP then
                                    local direction = (nearestHRP.Position - playerHRP.Position).Unit
                                    local num = 1
                                   
                                        
                                        while num <= maxIterations do
                                            task.wait(0.01)
                                            num = num + 1
                                            
                                            playerHRP.CFrame = CFrame.lookAt(playerHRP.Position, Vector3.new(nearestHRP.Position.X, nearestHRP.Position.Y, nearestHRP.Position.Z))
                    
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                if jasonaimbotloop then
                    jasonaimbotloop:Disconnect()
                    jasonaimbotloop = nil
                end
            end
    end
    
    
    local function staminadrainono(state)
        stam = state
        local stamscript = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
        
        while stam do
            stamscript.StaminaLossDisabled = true
            task.wait(1)
        end
        
        
            stamscript.StaminaLossDisabled = nil
    end
    
    
    
    local function unlockclientcharacters()
        local clone = game.Players.LocalPlayer.PlayerData.Equipped.Skins:Clone()
        clone.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Killers
        for i, v in pairs(clone:GetChildren()) do
            v.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Killers
            end
        local clone2 = game.Players.LocalPlayer.PlayerData.Equipped.Skins:Clone()
        clone2.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Survivors
        
            for i, v in pairs(clone2:GetChildren()) do
            v.Parent = game.Players.LocalPlayer.PlayerData.Purchased.Survivors
            end
    end
    
    
    
    
    
    GUI:Notification{Title = "Property of AppleWare", Text = "please vrooo pleaaaase, we liek made this for youu we apple nation yes", Duration = 60}
    GUI:Notification{Title = "ALL SCRIPTS ARE OURS!!!", Text = "All scripts are original.", Duration = 10}
    
    
    local VisualTab = GUI:Tab{
        Name = "Visuals",
        Icon = "http://www.roblox.com/asset/?id=13527523584"
    }
    
    local gentab = GUI:Tab{
        Name = "Generators",
        Icon = "http://www.roblox.com/asset/?id=9777958075"
    }
    
    local chartab = GUI:Tab{
        Name = "Killers",
        Icon = "http://www.roblox.com/asset/?id=17231565188"
    }
    
    local survivortab = GUI:Tab{
        Name = "Survivors",
        Icon = "http://www.roblox.com/asset/?id=17469537718"
    }
    
    local blatanttab = GUI:Tab{
        Name = "Blatant",
        Icon = "http://www.roblox.com/asset/?id=1553599662"
    }
    
    local misctab = GUI:Tab{
        Name = "Misc",
        Icon = "http://www.roblox.com/asset/?id=6391152597"
    }
    
    
    
    
    gentab:Button{
        Name = "Instant Solver",
        Description = "Instantly solve a FULL generator with the click of this button.",
        Callback = function() 
            instantsolvegen()
        end
    }
    
    gentab:Button{
        Name = "Gen Hell 2 Instant Solver",
        Description = "Instantly solve a FULL generator on gen hell 2 with the click of this button.",
        Callback = function() 
            instantsolvegenhell()
        end
    }
    
    
    gentab:Button{
        Name = "Solve 1 Puzzle",
        Description = "Instantly solve a quarter of the generator with the click of this button.",
        Callback = function() 
            solvegen()
        end
    }
    
    
    gentab:Toggle{
        Name = "Instant Solver",
        StartingState = false,
        Description = "Instantly solve generators when prompted.",
        Callback = function(state) 
            autogen(state) 
        end
    }


    gentab:Toggle{
        Name = "Generator Highlight",
        StartingState = false,
        Description = "Shows generators all around the map.",
        Callback = function(state) 
            toggleHighlightGen(state) 
        end
    }
    
    gentab:Slider{
        Name = "Auto Generator Delay",
        Default = 0.1,
        Min = 0.1,
        Max = 10,
        Callback = function(value) 
            setdelay(value)
        end
    }

    --
    VisualTab:Toggle{
        Name = "Tool Highlight",
        StartingState = false,
        Description = "Shows all items on the map.",
        Callback = function(state) 
            highlighttools(state) 
        end
    }
    
    VisualTab:Toggle{
        Name = "Survivor Highlight",
        StartingState = false,
        Description = "Shows all survivors on the map.",
        Callback = function(state) 
            survivorHighlighter(state) 
        end
    }
    
    VisualTab:Toggle{
        Name = "Killer Highlight",
        StartingState = false,
        Description = "Shows all killer(s) on the map.",
        Callback = function(state) 
            killerHighlighter(state) 
        end
    }
    
    VisualTab:Toggle{
        Name = "C00lKidd ESP",
        StartingState = false,
        Description = "Shows Corrupt Nature and Pizza Delivery.",
        Callback = function(state)
            corruptnatureesp(state)
        end
    }
    
    VisualTab:Toggle{
        Name = "Survivor Util ESP",
        StartingState = false,
        Description = "007n7 Clones, Builderman Sentry, Sentry Range, Dispenser, and Elliot Pizza.",
        Callback = function(state)
            survivorutilesp(state)
        end
    }
    --
    
    misctab:Button{
        Name = "unlock characters [CLIENT]",
        Description = "self explanatory.",
        Callback = function() 
            unlockclientcharacters()
        end
    }
    
    
    
    misctab:Toggle{
        Name = "Play Hakari Emote",
        StartingState = false,
        Description = "funny xd",
        Callback = function(state) 
            activatethehakari(state)
        end
    }
    
    misctab:Toggle{
        Name = "Play Shucks Emote [NON-AWP]",
        StartingState = false,
        Description = "gas",
        Callback = function(state) 
            activatethesilly2(state)
        end
    }
    
    misctab:Toggle{
        Name = "Play Shucks Emote [AWP/MACSPLOIT]",
        StartingState = false,
        Description = "gas",
        Callback = function(state) 
            activatethesilly(state)
        end
    }
    
    misctab:Toggle{
        Name = "Play Mr. Quiet [AWP/MACSPLOIT]",
        StartingState = false,
        Description = "gas",
        Callback = function(state) 
            activatethequiet(state)
        end
    }
    
    
    misctab:Toggle{
        Name = "Hide Player Bar",
        StartingState = false,
        Description = "dont get caught in clips!",
        Callback = function(state) 
            togglehidebar(state) 
        end
    }
    
    
    misctab:Slider{
        Name = "FOV",
        Default = 1,
        Min = 1,
        Max = 2,
        Callback = function(value) 
            FOVmulti(value)
        end
    }
    
    --
    
    -- 
    
    survivortab:Button{
        Name = "Kai 1337",
        Description = "The legionare. Use default Guest. [GUEST SKIN]",
        Callback = function() 
            kaiguyskin()
        end
    }

    survivortab:Button{
        Name = "Doom Shed",
        Description = "Banned. Use default Shed. [SHED SKIN]",
        Callback = function() 
           doomskin()
        end
    }
    
    survivortab:Toggle{
        Name = "Chance Aimbot",
        Description = "Flicks to the killer. will be blatant if you be absolutely stupid with it.",
        StartingState = false,
        Callback = function(state) 
            chanceaimbot(state)
        end
    }
    
    survivortab:Toggle{
        Name = "Shed Aimbot",
        Description = "Flicks to the killer. will be blatant if you be absolutely stupid with it.",
        StartingState = false,
        Callback = function(state) 
            shedaimbot(state)
        end
    }
    
    survivortab:Toggle{
        Name = "Guest Aimbot",
        Description = "Flicks to the killer when punch. blatant if you be absolutely stupid with it.",
        StartingState = false,
        Callback = function(state) 
            guestaimbot(state)
        end
    }

    survivortab:Toggle{
        Name = "Pizza TP",
        Description = "Instantly TP any pizzas spawned, and all current pizzas on the map.",
        StartingState = false,
        Callback = function(state) 
            givemesomepizza(state)
        end
    }
    --
    chartab:Toggle{
        Name = "C00lkid Aimbot",
        Description = "Tell the game that ur on mobile so u get aimbot for free ",
        StartingState = false,
        Callback = function(state) running = state game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer("SetDevice", state and "Mobile" or "PC") end
    }
    
    
    --
    chartab:Toggle{
        Name = "1X1X1 Aimbot",
        Description = "Flicks to the nearest survivor. Not very blatant, but it will be blatant if you be absolutely stupid with it.",
        StartingState = false,
        Callback = function(state) 
            aimbot1x1x1x1(state)
        end
    }
    
    
    
    
    chartab:Toggle{
        Name = "Do 1x1x1x1 Popups",
        Description = "Does popups on its own. [CREDS TO FARTHUB]",
        StartingState = false,
        Callback = function(state) Do1x1PopupsLoop = state if state then task.spawn(Do1x1x1x1Popups) end end
    }
    
    
    
    
    blatanttab:Toggle{
        Name = "John Aimbot",
        Description = "Tracks to the nearest survivor when using spikes",
        StartingState = false,
        Callback = function(state) 
            johnaimbot(state)
        end
    }
    
    blatanttab:Toggle{
        Name = "Jason Aimbot",
        Description = "Flicks to the nearest survivor when using Behead, M1s, and Gashing Wound",
        StartingState = false,
        Callback = function(state) 
            jasonaimbot(state)
        end
    }
    
    blatanttab:Toggle{
        Name = "No Stamina Loss",
        StartingState = false,
        Description = "pretty serious..",
        Callback = function(state) 
            staminadrainono(state) 
        end
    }
    
    
    blatanttab:Toggle{
        Name = "Bring Back Jump Power",
        StartingState = false,
        Description = "funny xd",
        Callback = function(state) 
            bringbackjumppower(state) 
        end
    }
    
    blatanttab:Toggle{
        Name = "Hawk Tuah Mode",
        StartingState = false,
        Description = "Coolkidd how could you do this",
        Callback = function(state) 
            hawktuahmode(state) 
        end
    }
    
    blatanttab:Slider{
        Name = "Walkspeed",
        Default = 1,
        Min = 1,
        Max = 100,
        Callback = function(value) 
            speedmulti(value)
        end
    }

    blatanttab:Slider{
        Name = "JumpPower",
        Default = 50,
        Min = 1,
        Max = 1000,
        Callback = function(value) 
            bringbackjumppowerslider(value)
        end
    }
end


initialize()