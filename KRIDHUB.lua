local _0x1=loadstring(game:HttpGet("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x72\x61\x77\x2e\x67\x69\x74\x68\x75\x62\x75\x73\x65\x72\x63\x6f\x6e\x74\x65\x6e\x74\x2e\x63\x6f\x6d\x2f\x41\x5a\x59\x73\x47\x69\x74\x68\x75\x62\x2f\x44\x72\x52\x61\x79\x2d\x55\x49\x2d\x4c\x69\x62\x72\x61\x72\x79\x2f\x6d\x61\x69\x6e\x2f\x44\x72\x52\x61\x79\x2e\x6c\x75\x61"))()local _0x2=_0x1:Load("\x4b\x52\x49\x44\x48\x55\x42","\x44\x65\x66\x61\x75\x6c\x74")local _0x3=game:GetService("\x50\x6c\x61\x79\x65\x72\x73")local _0x4=game:GetService("\x52\x75\x6e\x53\x65\x72\x76\x69\x63\x65")local _0x5=game:GetService("\x55\x73\x65\x72\x49\x6e\x70\x75\x74\x53\x65\x72\x76\x69\x63\x65")local _0x6=_0x3.LocalPlayer local _0x7=workspace.CurrentCamera local _0x8=false local _0x9="\x48\x65\x61\x64"local _0xa=false local _0xb=60 local _0xc=true local _0xd=false local _0xe="\x53\x6d\x6f\x6f\x74\x68"local _0xf=0.2 local _0x10=Drawing.new("\x43\x69\x72\x63\x6c\x65")local _0x11=Color3.fromRGB(0,255,0)local _0x12=false local _0x13=false local _0x14=10 local _0x15=false local _0x16=true local _0x17=false local _0x18=false local _0x19=false local _0x1a=false local _0x1b=false local _0x1c=Color3.fromRGB(255,0,0)local _0x1d=Color3.fromRGB(0,255,0)local _0x1e=Color3.fromRGB(255,255,255)local _0x1f=Color3.fromRGB(255,255,255)local _0x20=Color3.fromRGB(0,255,0)local _0x21=Color3.fromRGB(255,0,0)local _0x22=false local _0x23=false local _0x24=false local _0x25=false local _0x26=false local _0x27=false local _0x28={}local _0x29=true local _0x2a=false local _0x2b=false local _0x2c=false local _0x2d=nil local _0x2e="\x54\x6f\x70\x52\x69\x67\x68\x74"local _0x2f=0 local function _0x30()local _0x31={}for _,_0x32 in pairs(_0x3:GetPlayers())do if _0x32.TeamColor then _0x31[_0x32.TeamColor.Name]=true end end local _0x33=0 for _ in pairs(_0x31)do _0x33=_0x33+1 end _0x12=_0x33>1 return _0x12 end local _0x34=_0x1.newTab("\x41\x49\x4d\x42\x4f\x54")_0x34.newToggle("\x41\x49\x4d\x42\x4f\x54","\x54\x75\x72\x6e\x20\x41\x69\x6d\x62\x6f\x74\x20\x4f\x6e\x2f\x4f\x66\x66",false,function(_0x35)_0x8=_0x35 end)_0x34.newDropdown("\x54\x61\x72\x67\x65\x74","\x43\x68\x6f\x6f\x73\x65\x20\x48\x65\x61\x64\x20\x6f\x72\x20\x42\x6f\x64\x79",{"\x48\x65\x61\x64","\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74"},function(_0x36)_0x9=_0x36 end)_0x34.newToggle("\x46\x4f\x56","\x53\x68\x6f\x77\x20\x46\x4f\x56\x20\x43\x69\x72\x63\x6c\x65",false,function(_0x37)_0xa=_0x37 _0x10.Visible=_0xa and _0x8 end)_0x34.newDropdown("\x46\x4f\x56\x20\x53\x49\x5a\x45","\x53\x65\x74\x20\x46\x4f\x56\x20\x53\x69\x7a\x65",{"\x36\x30","\x31\x32\x30","\x32\x34\x30"},function(_0x38)_0xb=tonumber(_0x38)_0x10.Radius=_0xb end)_0x34.newDropdown("\x46\x4f\x56\x20\x43\x4f\x4c\x4f\x52","\x53\x65\x74\x20\x46\x4f\x56\x20\x43\x6f\x6c\x6f\x72",{"\x52\x65\x64","\x47\x72\x65\x65\x6e","\x42\x6c\x75\x65","\x52\x61\x69\x6e\x62\x6f\x77"},function(_0x39)if _0x39=="\x52\x65\x64"then _0x11=Color3.fromRGB(255,0,0)_0x15=false elseif _0x39=="\x47\x72\x65\x65\x6e"then _0x11=Color3.fromRGB(0,255,0)_0x15=false elseif _0x39=="\x42\x6c\x75\x65"then _0x11=Color3.fromRGB(0,0,255)_0x15=false elseif _0x39=="\x52\x61\x69\x6e\x62\x6f\x77"then _0x15=true end if not _0x15 then _0x10.Color=_0x11 end end)_0x34.newDropdown("\x41\x69\x6d\x62\x6f\x74\x20\x4d\x6f\x64\x65","\x53\x6d\x6f\x6f\x74\x68\x20\x6f\x72\x20\x49\x6e\x73\x74\x61\x6e\x74\x20\x41\x69\x6d",{"\x53\x6d\x6f\x6f\x74\x68","\x49\x6e\x73\x74\x61\x6e\x74"},function(_0x3a)_0xe=_0x3a end)_0x34.newDropdown("\x53\x6d\x6f\x6f\x74\x68\x20\x53\x70\x65\x65\x64","\x53\x65\x74\x20\x53\x6d\x6f\x6f\x74\x68\x20\x53\x70\x65\x65\x64",{"\x30\x2e\x31","\x30\x2e\x32","\x30\x2e\x35","\x31"},function(_0x3b)_0xf=tonumber(_0x3b)end)_0x34.newToggle("\x54\x65\x61\x6d\x20\x43\x68\x65\x63\x6b","\x53\x6b\x69\x70\x20\x54\x65\x61\x6d\x6d\x61\x74\x65\x73\x20\x28\x54\x65\x61\x6d\x20\x4d\x6f\x64\x65\x20\x4f\x6e\x6c\x79\x29",true,function(_0x3c)_0xc=_0x3c if not _0x12 and _0x3c then warn("\x54\x65\x61\x6d\x20\x43\x68\x65\x63\x6b\x20\x69\x73\x20\x65\x6e\x61\x62\x6c\x65\x64\x20\x62\x75\x74\x20\x74\x68\x69\x73\x20\x69\x73\x20\x6e\x6f\x74\x20\x61\x20\x74\x65\x61\x6d\x20\x67\x61\x6d\x65\x2e\x20\x49\x74\x20\x77\x69\x6c\x6c\x20\x62\x65\x20\x69\x67\x6e\x6f\x72\x65\x64\x2e")end end)_0x34.newToggle("\x57\x61\x6c\x6c\x20\x43\x68\x65\x63\x6b","\x53\x6b\x69\x70\x20\x42\x65\x68\x69\x6e\x64\x20\x57\x61\x6c\x6c\x73",false,function(_0x3d)_0xd=_0x3d end)_0x34.newToggle("\x48\x69\x74\x62\x6f\x78","\x45\x78\x70\x61\x6e\x64\x20\x65\x6e\x65\x6d\x79\x20\x68\x69\x74\x62\x6f\x78",false,function(_0x3e)_0x13=_0x3e end)_0x34.newDropdown("\x48\x69\x74\x62\x6f\x78\x20\x53\x69\x7a\x65","\x53\x65\x74\x20\x48\x69\x74\x62\x6f\x78\x20\x53\x69\x7a\x65",{"\x31\x30","\x32\x30","\x33\x30"},function(_0x3f)_0x14=tonumber(_0x3f)end)local _0x40=_0x1.newTab("\x45\x53\x50","\x68\x74\x74\x70\x73\x3a\x2f\x2f\x77\x77\x77\x2e\x72\x6f\x62\x6c\x6f\x78\x2e\x63\x6f\x6d\x2f\x61\x73\x73\x65\x74\x2f\x3f\x69\x64\x3d\x36\x30\x33\x31\x30\x37\x35\x39\x33\x31")_0x40.newToggle("\x45\x6e\x61\x62\x6c\x65\x20\x45\x53\x50","\x54\x75\x72\x6e\x20\x45\x53\x50\x20\x4f\x6e\x2f\x4f\x66\x66",false,function(_0x41)_0x16=_0x41 end)_0x40.newToggle("\x45\x53\x50\x20\x4c\x69\x6e\x65","\x53\x68\x6f\x77\x20\x4c\x69\x6e\x65\x73\x20\x74\x6f\x20\x50\x6c\x61\x79\x65\x72\x73",false,function(_0x42)_0x17=_0x42 end)_0x40.newDropdown("\x4c\x69\x6e\x65\x20\x43\x6f\x6c\x6f\x72","\x53\x65\x74\x20\x4c\x69\x6e\x65\x20\x43\x6f\x6c\x6f\x72",{"\x52\x65\x64","\x47\x72\x65\x65\x6e","\x42\x6c\x75\x65","\x52\x61\x69\x6e\x62\x6f\x77"},function(_0x43)if _0x43=="\x52\x65\x64"then _0x1c=Color3.fromRGB(255,0,0)_0x22=false elseif _0x43=="\x47\x72\x65\x65\x6e"then _0x1c=Color3.fromRGB(0,255,0)_0x22=false elseif _0x43=="\x42\x6c\x75\x65"then _0x1c=Color3.fromRGB(0,0,255)_0x22=false elseif _0x43=="\x52\x61\x69\x6e\x62\x6f\x77"then _0x22=true end end)_0x40.newToggle("\x45\x53\x50\x20\x42\x6f\x78","\x53\x68\x6f\x77\x20\x42\x6f\x78\x65\x73\x20\x41\x72\x6f\x75\x6e\x64\x20\x50\x6c\x61\x79\x65\x72\x73",false,function(_0x44)_0x18=_0x44 end)_0x40.newDropdown("\x42\x6f\x78\x20\x43\x6f\x6c\x6f\x72","\x53\x65\x74\x20\x42\x6f\x78\x20\x43\x6f\x6c\x6f\x72",{"\x52\x65\x64","\x47\x72\x65\x65\x6e","\x42\x6c\x75\x65","\x52\x61\x69\x6e\x62\x6f\x77"},function(_0x45)if _0x45=="\x52\x65\x64"then _0x1d=Color3.fromRGB(255,0,0)_0x23=false elseif _0x45=="\x47\x72\x65\x65\x6e"then _0x1d=Color3.fromRGB(0,255,0)_0x23=false elseif _0x45=="\x42\x6c\x75\x65"then _0x1d=Color3.fromRGB(0,0,255)_0x23=false elseif _0x45=="\x52\x61\x69\x6e\x62\x6f\x77"then _0x23=true end end)_0x40.newToggle("\x45\x53\x50\x20\x4e\x61\x6d\x65","\x53\x68\x6f\x77\x20\x50\x6c\x61\x79\x65\x72\x20\x4e\x61\x6d\x65\x73",false,function(_0x46)_0x19=_0x46 end)_0x40.newDropdown("\x4e\x61\x6d\x65\x20\x43\x6f\x6c\x6f\x72","\x53\x65\x74\x20\x4e\x61\x6d\x65\x20\x43\x6f\x6c\x6f\x72",{"\x52\x65\x64","\x47\x72\x65\x65\x6e","\x42\x6c\x75\x65","\x52\x61\x69\x6e\x62\x6f\x77"},function(_0x47)if _0x47=="\x52\x65\x64"then _0x1e=Color3.fromRGB(255,0,0)_0x24=false elseif _0x47=="\x47\x72\x65\x65\x6e"then _0x1e=Color3.fromRGB(0,255,0)_0x24=false elseif _0x47=="\x42\x6c\x75\x65"then _0x1e=Color3.fromRGB(0,0,255)_0x24=false elseif _0x47=="\x52\x61\x69\x6e\x62\x6f\x77"then _0x24=true end end)_0x40.newToggle("\x45\x53\x50\x20\x44\x69\x73\x74\x61\x6e\x63\x65","\x53\x68\x6f\x77\x20\x44\x69\x73\x74\x61\x6e\x63\x65",false,function(_0x48)_0x1a=_0x48 end)_0x40.newDropdown("\x44\x69\x73\x74\x61\x6e\x63\x65\x20\x43\x6f\x6c\x6f\x72","\x53\x65\x74\x20\x44\x69\x73\x74\x61\x6e\x63\x65\x20\x43\x6f\x6c\x6f\x72",{"\x52\x65\x64","\x47\x72\x65\x65\x6e","\x42\x6c\x75\x65","\x52\x61\x69\x6e\x62\x6f\x77"},function(_0x49)if _0x49=="\x52\x65\x64"then _0x1f=Color3.fromRGB(255,0,0)_0x25=false elseif _0x49=="\x47\x72\x65\x65\x6e"then _0x1f=Color3.fromRGB(0,255,0)_0x25=false elseif _0x49=="\x42\x6c\x75\x65"then _0x1f=Color3.fromRGB(0,0,255)_0x25=false elseif _0x49=="\x52\x61\x69\x6e\x62\x6f\x77"then _0x25=true end end)_0x40.newToggle("\x45\x53\x50\x20\x48\x50","\x53\x68\x6f\x77\x20\x48\x65\x61\x6c\x74\x68\x20\x42\x61\x72\x73",false,function(_0x4a)_0x1b=_0x4a end)_0x40.newDropdown("\x48\x50\x20\x43\x6f\x6c\x6f\x72","\x53\x65\x74\x20\x48\x50\x20\x43\x6f\x6c\x6f\x72",{"\x52\x65\x64","\x47\x72\x65\x65\x6e","\x42\x6c\x75\x65","\x52\x61\x69\x6e\x62\x6f\x77"},function(_0x4b)if _0x4b=="\x52\x65\x64"then _0x20=Color3.fromRGB(255,0,0)_0x26=false elseif _0x4b=="\x47\x72\x65\x65\x6e"then _0x20=Color3.fromRGB(0,255,0)_0x26=false elseif _0x4b=="\x42\x6c\x75\x65"then _0x20=Color3.fromRGB(0,0,255)_0x26=false elseif _0x4b=="\x52\x61\x69\x6e\x62\x6f\x77"then _0x26=true end end)_0x40.newToggle("\x57\x61\x6c\x6c\x68\x61\x63\x6b","\x48\x69\x67\x68\x6c\x69\x67\x68\x74\x20\x54\x68\x72\x6f\x75\x67\x68\x20\x57\x61\x6c\x6c\x73",false,function(_0x4c)_0x27=_0x4c end)_0x40.newDropdown("\x57\x61\x6c\x6c\x68\x61\x63\x6b\x20\x43\x6f\x6c\x6f\x72","\x53\x65\x74\x20\x57\x61\x6c\x6c\x68\x61\x63\x6b\x20\x43\x6f\x6c\x6f\x72",{"\x59\x65\x6c\x6c\x6f\x77","\x52\x65\x64","\x47\x72\x65\x65\x6e","\x52\x61\x69\x6e\x62\x6f\x77"},function(_0x4d)if _0x4d=="\x59\x65\x6c\x6c\x6f\x77"then _0x21=Color3.fromRGB(255,255,0)_0x27=false elseif _0x4d=="\x52\x65\x64"then _0x21=Color3.fromRGB(255,0,0)_0x27=false elseif _0x4d=="\x47\x72\x65\x65\x6e"then _0x21=Color3.fromRGB(0,255,0)_0x27=false elseif _0x4d=="\x52\x61\x69\x6e\x62\x6f\x77"then _0x27=true end end)local _0x4e=_0x1.newTab("\x53\x45\x54\x54\x49\x4e\x47","\x68\x74\x74\x70\x73\x3a\x2f\x2f\x77\x77\x77\x2e\x72\x6f\x62\x6c\x6f\x78\x2e\x63\x6f\x6d\x2f\x61\x73\x73\x65\x74\x2f\x3f\x69\x64\x3d\x36\x30\x33\x31\x32\x38\x30\x38\x38\x32")_0x4e.newToggle("\x46\x50\x53","\x53\x68\x6f\x77\x20\x46\x50\x53",false,function(_0x4f)_0x2c=_0x4f if _0x2c then if not _0x2d then _0x2d=Drawing.new("\x54\x65\x78\x74")_0x2d.Text="\x46\x50\x53\x3a\x20\x30"_0x2d.Size=20 _0x2d.Color=Color3.fromRGB(255,255,255)_0x2d.Visible=true end if _0x2e=="\x54\x6f\x70\x4c\x65\x66\x74"then _0x2d.Position=Vector2.new(10,10)elseif _0x2e=="\x54\x6f\x70\x52\x69\x67\x68\x74"then _0x2d.Position=Vector2.new(_0x7.ViewportSize.X-100,10)elseif _0x2e=="\x42\x6f\x74\x74\x6f\x6d\x4c\x65\x66\x74"then _0x2d.Position=Vector2.new(10,_0x7.ViewportSize.Y-30)elseif _0x2e=="\x42\x6f\x74\x74\x6f\x6d\x52\x69\x67\x68\x74"then _0x2d.Position=Vector2.new(_0x7.ViewportSize.X-100,_0x7.ViewportSize.Y-30)end else if _0x2d then _0x2d.Visible=false end end end)_0x4e.newDropdown("\x46\x50\x53\x20\x50\x6f\x73\x69\x74\x69\x6f\x6e","\x53\x65\x74\x20\x46\x50\x53\x20\x50\x6f\x73\x69\x74\x69\x6f\x6e",{"\x54\x6f\x70\x4c\x65\x66\x74","\x54\x6f\x70\x52\x69\x67\x68\x74","\x42\x6f\x74\x74\x6f\x6d\x4c\x65\x66\x74","\x42\x6f\x74\x74\x6f\x6d\x52\x69\x67\x68\x74"},function(_0x50)_0x2e=_0x50 if _0x2d and _0x2c then if _0x2e=="\x54\x6f\x70\x4c\x65\x66\x74"then _0x2d.Position=Vector2.new(10,10)elseif _0x2e=="\x54\x6f\x70\x52\x69\x67\x68\x74"then _0x2d.Position=Vector2.new(_0x7.ViewportSize.X-100,10)elseif _0x2e=="\x42\x6f\x74\x74\x6f\x6d\x4c\x65\x66\x74"then _0x2d.Position=Vector2.new(10,_0x7.ViewportSize.Y-30)elseif _0x2e=="\x42\x6f\x74\x74\x6f\x6d\x52\x69\x67\x68\x74"then _0x2d.Position=Vector2.new(_0x7.ViewportSize.X-100,_0x7.ViewportSize.Y-30)end end end)_0x4e.newToggle("\x41\x75\x74\x6f\x20\x46\x69\x78","\x41\x75\x74\x6f\x20\x72\x65\x63\x6f\x76\x65\x72\x20\x69\x66\x20\x66\x75\x6e\x63\x74\x69\x6f\x6e\x73\x20\x66\x61\x69\x6c",true,function(_0x51)_0x29=_0x51 end)_0x4e.newToggle("\x4f\x70\x74\x69\x6d\x69\x7a\x65\x20\x50\x65\x72\x66\x6f\x72\x6d\x61\x6e\x63\x65","\x52\x65\x64\x75\x63\x65\x20\x6c\x61\x67\x20\x61\x6e\x64\x20\x62\x6f\x6f\x73\x74\x20\x46\x50\x53",false,function(_0x52)_0x2a=_0x52 if _0x2a then for _,_0x53 in pairs(workspace:GetDescendants())do if _0x53:IsA("\x42\x61\x73\x65\x50\x61\x72\x74")and not _0x53.Parent:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64")then _0x53.Material=Enum.Material.SmoothPlastic _0x53.Reflectance=0 _0x53.CastShadow=false end end game.Lighting.GlobalShadows=false game.Lighting.FogEnd=100000 settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 else for _,_0x54 in pairs(workspace:GetDescendants())do if _0x54:IsA("\x42\x61\x73\x65\x50\x61\x72\x74")then _0x54.CastShadow=true end end game.Lighting.GlobalShadows=true game.Lighting.FogEnd=10000 settings().Rendering.QualityLevel=Enum.QualityLevel.Automatic end end)_0x4e.newToggle("\x41\x75\x74\x6f\x20\x52\x65\x73\x70\x61\x77\x6e","\x52\x65\x73\x70\x61\x77\x6e\x20\x69\x6e\x73\x74\x61\x6e\x74\x6c\x79\x20\x6f\x6e\x20\x64\x65\x61\x74\x68",false,function(_0x55)_0x2b=_0x55 end)_0x10.Thickness=2 _0x10.Color=_0x11 _0x10.Position=Vector2.new(_0x7.ViewportSize.X/2,_0x7.ViewportSize.Y/2)_0x10.Radius=_0xb _0x10.Visible=false _0x10.Filled=false local function _0x56()local _0x57=nil local _0x58=math.huge for _,_0x59 in pairs(_0x3:GetPlayers())do if _0x59~=_0x6 and _0x59.Character then local _0x5a=_0x59.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64")local _0x5b=_0x59.Character:FindFirstChild(_0x9)or _0x59.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74")if _0x5a and _0x5b and _0x5a.Health>0 then if _0x12 and _0xc then if _0x59.TeamColor and _0x6.TeamColor and _0x59.TeamColor==_0x6.TeamColor then goto continue end end local _0x5c,_0x5d=_0x7:WorldToViewportPoint(_0x5b.Position)local _0x5e=Vector2.new(_0x7.ViewportSize.X/2,_0x7.ViewportSize.Y/2)local _0x5f=(Vector2.new(_0x5c.X,_0x5c.Y)-_0x5e).Magnitude if _0x5d and _0x5f<=_0xb then if _0xd then local _0x60=Ray.new(_0x7.CFrame.Position,(_0x5b.Position-_0x7.CFrame.Position).Unit*500)local _0x61=workspace:FindPartOnRayWithIgnoreList(_0x60,{_0x6.Character})if _0x61 and _0x61:IsDescendantOf(_0x59.Character)then if _0x5f<_0x58 then _0x57=_0x59 _0x58=_0x5f end end else if _0x5f<_0x58 then _0x57=_0x59 _0x58=_0x5f end end end end ::continue:: end end return _0x57 end local function _0x62(_0x63)if _0x63==_0x6 then return end local _0x64={_0x65=Drawing.new("\x4c\x69\x6e\x65"),_0x66=Drawing.new("\x53\x71\x75\x61\x72\x65"),_0x67=Drawing.new("\x54\x65\x78\x74"),_0x68=Drawing.new("\x54\x65\x78\x74"),_0x69=Drawing.new("\x53\x71\x75\x61\x72\x65"),_0x6a=Drawing.new("\x53\x71\x75\x61\x72\x65"),_0x6b=Instance.new("\x48\x69\x67\x68\x6c\x69\x67\x68\x74")}_0x64._0x6b.Adornee=_0x63.Character _0x64._0x6b.FillTransparency=0.5 _0x64._0x6b.OutlineTransparency=0 _0x64._0x6b.FillColor=_0x21 _0x64._0x6b.OutlineColor=_0x21 _0x64._0x6b.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop _0x64._0x6b.Parent=game.CoreGui _0x28[_0x63]=_0x64 local function _0x6c()if not _0x16 or not _0x63.Character then for _,_0x6d in pairs(_0x64)do if _0x6d~=_0x64._0x6b then _0x6d.Visible=false end end _0x64._0x6b.Enabled=false return end local _0x6e=_0x63.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74")local _0x6f=_0x63.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64")if not _0x6e or not _0x6f then for _,_0x70 in pairs(_0x64)do if _0x70~=_0x64._0x6b then _0x70.Visible=false end end _0x64._0x6b.Enabled=false return end local _0x71=false if _0x12 and _0xc then if _0x63.TeamColor and _0x6.TeamColor and _0x63.TeamColor==_0x6.TeamColor then _0x71=true end end if _0x71 then for _,_0x72 in pairs(_0x64)do if _0x72~=_0x64._0x6b then _0x72.Visible=false end end _0x64._0x6b.Enabled=false return end local _0x73,_0x74=_0x7:WorldToViewportPoint(_0x6e.Position)local _0x75=(_0x6.Character and _0x6.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74")and(_0x6.Character.HumanoidRootPart.Position-_0x6e.Position).Magnitude)or 0 if _0x74 and _0x6f.Health>0 then _0x64._0x65.Visible=_0x17 _0x64._0x65.From=Vector2.new(_0x7.ViewportSize.X/2,_0x7.ViewportSize.Y)_0x64._0x65.To=Vector2.new(_0x73.X,_0x73.Y)_0x64._0x65.Color=_0x22 and Color3.fromHSV(_0x2f,1,1)or _0x1c _0x64._0x65.Thickness=1 local _0x76=Vector2.new(30,40)_0x64._0x66.Visible=_0x18 _0x64._0x66.Size=_0x76 _0x64._0x66.Position=Vector2.new(_0x73.X-_0x76.X/2,_0x73.Y-_0x76.Y/2)_0x64._0x66.Color=_0x23 and Color3.fromHSV(_0x2f,1,1)or _0x1d _0x64._0x66.Thickness=1 _0x64._0x66.Filled=false _0x64._0x67.Visible=_0x19 _0x64._0x67.Text=_0x63.Name _0x64._0x67.Position=Vector2.new(_0x73.X,_0x73.Y-_0x76.Y/2-15)_0x64._0x67.Color=_0x24 and Color3.fromHSV(_0x2f,1,1)or _0x1e _0x64._0x67.Size=12 _0x64._0x67.Center=true _0x64._0x68.Visible=_0x1a _0x64._0x68.Text=tostring(math.floor(_0x75)).."\x20\x73\x74\x75\x64\x73"_0x64._0x68.Position=Vector2.new(_0x73.X,_0x73.Y+_0x76.Y/2+5)_0x64._0x68.Color=_0x25 and Color3.fromHSV(_0x2f,1,1)or _0x1f _0x64._0x68.Size=12 _0x64._0x68.Center=true local _0x77=_0x6f.Health/_0x6f.MaxHealth _0x64._0x69.Visible=_0x1b _0x64._0x69.Size=Vector2.new(30,3)_0x64._0x69.Position=Vector2.new(_0x73.X-15,_0x73.Y+_0x76.Y/2+15)_0x64._0x69.Color=Color3.fromRGB(50,50,50)_0x64._0x69.Filled=true _0x64._0x6a.Visible=_0x1b _0x64._0x6a.Size=Vector2.new(30*_0x77,3)_0x64._0x6a.Position=Vector2.new(_0x73.X-15,_0x73.Y+_0x76.Y/2+15)_0x64._0x6a.Color=_0x26 and Color3.fromHSV(_0x2f,1,1)or _0x20 _0x64._0x6a.Filled=true _0x64._0x6b.Enabled=_0x27 _0x64._0x6b.Adornee=_0x63.Character _0x64._0x6b.FillColor=_0x27 and Color3.fromHSV(_0x2f,1,1)or _0x21 _0x64._0x6b.OutlineColor=_0x27 and Color3.fromHSV(_0x2f,1,1)or _0x21 else for _,_0x78 in pairs(_0x64)do if _0x78~=_0x64._0x6b then _0x78.Visible=false end end _0x64._0x6b.Enabled=false end end _0x4.RenderStepped:Connect(_0x6c)end _0x4.RenderStepped:Connect(function(_0x79)_0x2f=(_0x2f+_0x79*0.5)%1 if _0x8 then local _0x7a=_0x56()if _0x7a and _0x7a.Character and _0x7a.Character:FindFirstChild(_0x9)then local _0x7b=_0x7a.Character[_0x9].Position local _0x7c=_0x7.CFrame local _0x7d=CFrame.new(_0x7c.Position,_0x7b)if _0x7e then _0x7f=math.random(1,1000)end if _0xe=="\x53\x6d\x6f\x6f\x74\x68"then _0x7.CFrame=_0x7c:Lerp(_0x7d,_0xf)elseif _0xe=="\x49\x6e\x73\x74\x61\x6e\x74"then _0x7.CFrame=_0x7d end end _0x10.Visible=_0xa if _0x15 then _0x10.Color=Color3.fromHSV(_0x2f,1,1)end else _0x10.Visible=false end if _0x16 then for _,_0x80 in pairs(_0x3:GetPlayers())do if not _0x28[_0x80]and _0x80~=_0x6 and _0x80.Character then _0x62(_0x80)end end end if _0x29 and _0x6.Character then local _0x81=_0x6.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64")local _0x82=_0x6.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74")if _0x81 and _0x82 then if _0x2b and _0x81.Health<=0 then _0x6:LoadCharacter()wait(0.05)end end end for _,_0x83 in pairs(_0x3:GetPlayers())do if _0x83~=_0x6 and _0x83.Character then local _0x84=_0x83.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64")local _0x85=_0x83.Character:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74")if _0x84 and _0x85 and _0x84.Health>0 then if _0x13 then if not(_0x12 and _0xc and _0x83.TeamColor and _0x6.TeamColor and _0x83.TeamColor==_0x6.TeamColor)then _0x85.Size=Vector3.new(_0x14,_0x14,_0x14)_0x85.Transparency=0.7 _0x85.CanCollide=false end else _0x85.Size=Vector3.new(2,2,1)_0x85.Transparency=0 _0x85.CanCollide=true end end end end end)for _,_0x86 in pairs(_0x3:GetPlayers())do _0x62(_0x86)end _0x3.PlayerAdded:Connect(function(_0x87)if _0x16 then _0x62(_0x87)end _0x30()end)_0x3.PlayerRemoving:Connect(function(_0x88)if _0x28[_0x88]then for _,_0x89 in pairs(_0x28[_0x88])do _0x89:Remove()end _0x28[_0x88]=nil end _0x30()end)local _0x8a=tick()local _0x8b=0 _0x4.RenderStepped:Connect(function()if _0x2c and _0x2d then _0x8b=_0x8b+1 local _0x8c=tick()if _0x8c-_0x8a>=1 then _0x2d.Text="\x46\x50\x53\x3a\x20"..math.floor(_0x8b/(_0x8c-_0x8a))_0x8b=0 _0x8a=_0x8c end end end)_0x30()
