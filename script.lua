local a=loadstring(game:HttpGet('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3'))():CreateWindow("Forgotten Memories");
local b=a:CreateFolder("Main");
local c=a:CreateFolder("Misc");
getgenv().AutoFixGenerators=false;
getgenv().AutoFixVentilation=false;
getgenv().AutoCloseCurtain=false;
getgenv().AutoCloseDoor=false;
getgenv().AutoPickupPhone=false;
getgenv().InfiniteSprint=false;
getgenv().InfiniteSprintSpeed=16;
getgenv().KillPower=false;
 
if(getgenv().Inst==nil)then getgenv().Inst=0;end;
getgenv().Inst+=1;
 
local cinst=getgenv().Inst;
 
--Anti AFK
if(getgenv().kuefg834rjiy983450==nil)then game:GetService("Players").LocalPlayer.Idled:connect(function()game:service("VirtualUser"):CaptureController();game:service("VirtualUser"):ClickButton2(Vector2.new());end);getgenv().kuefg834rjiy983450="nope not cracking this bitch today";end;
 
-- Infinite Yield Loader
spawn(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))();end);
 
-- Main Script
b:Toggle("Auto Fix Generators",function(a)
    getgenv().AutoFixGenerators=a;
end);
b:Toggle("Auto Fix Ventilation",function(a)
    getgenv().AutoFixVentilation=a;
end);
b:Toggle("Auto Close Curtain",function(a)
    getgenv().AutoCloseCurtain=a;
end);
b:Toggle("Auto Close Door",function(a)
    getgenv().AutoCloseDoor=a;
end);
 
c:Toggle("Auto End Phone",function(a)
    getgenv().AutoPickupPhone=a;
end);
c:Toggle("Infinite Sprint",function(a)
    getgenv().InfiniteSprint=a;
    print(a);
    if(getgenv().InfiniteSprintSpeed==nil)then 
        getgenv().InfiniteSprintSpeed=16;
    end;
    local data=(getgenv().infsprintdata)or({});
    getgenv().infsprintdata=data;
    if(getgenv().InfiniteSprintStepped~=nil)then getgenv().InfiniteSprintStepped:Disconnect();end;
    if(getgenv().InfiniteSprintUISBegan~=nil)then getgenv().InfiniteSprintUISBegan:Disconnect();end;
    if(getgenv().InfiniteSprintUISEnded~=nil)then getgenv().InfiniteSprintUISEnded:Disconnect();end;
    if(data.wsCA~=nil)then data.wsCA:Disconnect();end;
    if(data.wsLoop~=nil)then data.wsLoop:Disconnect();end;
    if(a==true)and(data~=nil)then 
        local sprinting=false;
        local char=game:GetService("Players").LocalPlayer.Character;
        local hum=(game:GetService("Players").LocalPlayer.Character)and(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"));
        local function wsChange()
            if(sprinting==true)then 
                hum.WalkSpeed=getgenv().InfiniteSprintSpeed;
            elseif(sprinting==false)then 
                hum.WalkSpeed=8;
            end;
        end;
        data.wsCA=game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(nchar)
            char,hum=nchar,nchar:WaitForChild("Humanoid");
            if(data.wsCA~=nil)then data.wsCA:Disconnect();end;
            wsChange();
            data.wsLoop=hum:GetPropertyChangedSignal("WalkSpeed"):Connect(wsChange);
        end);
        getgenv().InfiniteSprintUISBegan=game:GetService("UserInputService").InputBegan:Connect(function(input)
            if(game:GetService("UserInputService"):GetFocusedTextBox())then return;end;
            if(input.KeyCode==Enum.KeyCode.LeftShift)or(input.KeyCode==Enum.KeyCode.RightShift)then 
                sprinting=true;
            end;
        end);
        getgenv().InfiniteSprintUISEnded=game:GetService("UserInputService").InputEnded:Connect(function(input)
            if(game:GetService("UserInputService"):GetFocusedTextBox())then return;end;
            if(input.KeyCode==Enum.KeyCode.LeftShift)or(input.KeyCode==Enum.KeyCode.RightShift)then 
                sprinting=false;
            end;
        end);
        wsChange();
        data.wsLoop=hum:GetPropertyChangedSignal("WalkSpeed"):Connect(wsChange);
    end;
end);
c:Box("Infinite Sprint Speed","number",function(a)
    if(tonumber(a)~=nil)then 
        getgenv().InfiniteSprintSpeed=tonumber(a);
    end;
    print(a);
end);
c:Toggle("Kill Power",function(a)
    getgenv().KillPower=a;
end);
c:Button("Animatronic ESP",function()
    -- Settings --
    local settings={
        fillcolor=Color3.fromRGB(0, 255, 255);
        filltransparency=0.75;
        outlinecolor=Color3.fromRGB(0, 255, 255);
        outlinetransparency=0;
    };
 
    -- Script --
    if(game:service("CoreGui"):FindFirstChild("Highlights"))then game:service("CoreGui"):FindFirstChild("Highlights"):Destroy();end;
    local highlights=Instance.new("Folder",game:service("CoreGui"));highlights.Name="Highlights"
    function addto(a)
        if((a.Name=="Freddy")or(a.Name=="Bonnie")or(a.Name=="Chica")or(a.Name=="Foxy")or(a.Name=="GoldenFreddy")or(a.Name=="Marionette"))and(a:IsA("Model"))then 
            local highlight=Instance.new("Highlight",highlights);
            highlight.Adornee=a;
            highlight.FillColor=settings.fillcolor;
            highlight.FillTransparency=settings.filltransparency;
            highlight.OutlineColor=settings.outlinecolor;
            highlight.OutlineTransparency=settings.outlinetransparency;
            highlight.Adornee.Changed:Connect(function()
                if(not(highlight.Adornee))or(not(highlight.Adornee.Parent))then 
                    highlight:Destroy();
                end;
            end);
            return(highlight);
        end;
    end;
 
    for _,a in pairs(game:GetService("Workspace"):GetDescendants())do 
        addto(a);
    end;
 
    if(getgenv().AnimatronicESP~=nil)then getgenv().AnimatronicESP:Destroy();end;
    getgenv().AnimatronicESP=game:GetService("Workspace").DescendantAdded:Connect(addto);
end);
c:Button("Player ESP",function()
    _G.FriendColor=Color3.fromRGB(0,0,255)
    _G.EnemyColor=Color3.fromRGB(255,0,0)
    _G.UseTeamColor=true
 
    --------------------------------------------------------------------
    local Holder=Instance.new("Folder",game.CoreGui)
    Holder.Name="ESP"
 
    local Box=Instance.new("BoxHandleAdornment")
    Box.Name="nilBox"
    Box.Size=Vector3.new(1, 2, 1)
    Box.Color3=Color3.new(100 / 255, 100 / 255, 100 / 255)
    Box.Transparency=0.7
    Box.ZIndex=0
    Box.AlwaysOnTop=false
    Box.Visible=false
 
    local NameTag=Instance.new("BillboardGui")
    NameTag.Name="nilNameTag"
    NameTag.Enabled=false
    NameTag.Size=UDim2.new(0, 200, 0, 50)
    NameTag.AlwaysOnTop=true
    NameTag.StudsOffset=Vector3.new(0, 1.8, 0)
    local Tag=Instance.new("TextLabel", NameTag)
    Tag.Name="Tag"
    Tag.BackgroundTransparency=1
    Tag.Position=UDim2.new(0, -50, 0, 0)
    Tag.Size=UDim2.new(0, 300, 0, 20)
    Tag.TextSize=15
    Tag.TextColor3=Color3.new(100 / 255, 100 / 255, 100 / 255)
    Tag.TextStrokeColor3=Color3.new(0 / 255, 0 / 255, 0 / 255)
    Tag.TextStrokeTransparency=0.4
    Tag.Text="nil"
    Tag.Font=Enum.Font.SourceSansBold
    Tag.TextScaled=false
 
    local LoadCharacter=function(v)
        repeat wait()until v.Character~=nil
 
        v.Character:WaitForChild("Humanoid")
        local vHolder=Holder:FindFirstChild(v.Name)
        vHolder:ClearAllChildren()
        local b=Box:Clone()
        b.Name=v.Name .. "Box"
        b.Adornee=v.Character
        b.Parent=vHolder
        local t=NameTag:Clone()
        t.Name=v.Name .. "NameTag"
        t.Enabled=true
        t.Parent=vHolder
        t.Adornee=v.Character:WaitForChild("Head",5)
        if not t.Adornee then
            return UnloadCharacter(v)
        end
        t.Tag.Text=v.Name
        b.Color3=Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
        t.Tag.TextColor3=Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
        local Update
        local UpdateNameTag=function()
            if not pcall(function()
                v.Character.Humanoid.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None
                local maxh=math.floor(v.Character.Humanoid.MaxHealth)
                local h=math.floor(v.Character.Humanoid.Health)
            end) then
                Update:Disconnect()
            end
        end
        UpdateNameTag()
        Update=v.Character.Humanoid.Changed:Connect(UpdateNameTag)
    end
 
    local UnloadCharacter=function(v)
        local vHolder=Holder:FindFirstChild(v.Name)
        if vHolder and (vHolder:FindFirstChild(v.Name.."Box")~=nil or vHolder:FindFirstChild(v.Name.."NameTag")~=nil) then
            vHolder:ClearAllChildren()
        end
    end
 
    local LoadPlayer=function(v)
        local vHolder=Instance.new("Folder",Holder)
        vHolder.Name=v.Name
        v.CharacterAdded:Connect(function()
            pcall(LoadCharacter,v)
        end)
        v.CharacterRemoving:Connect(function()
            pcall(UnloadCharacter,v)
        end)
        v.Changed:Connect(function(prop)
            if prop=="TeamColor" then
                UnloadCharacter(v)
                wait()
                LoadCharacter(v)
            end
        end)
        LoadCharacter(v)
    end
 
    local UnloadPlayer=function(v)
        UnloadCharacter(v)
        local vHolder=Holder:FindFirstChild(v.Name)
        if vHolder then
            vHolder:Destroy()
        end
    end
 
    for i,v in pairs(game:GetService("Players"):GetPlayers())do
        spawn(function()pcall(LoadPlayer,v);end)
    end
 
    game:GetService("Players").PlayerAdded:Connect(function(v)
        pcall(LoadPlayer,v)
    end)
 
    game:GetService("Players").PlayerRemoving:Connect(function(v)
        pcall(UnloadPlayer,v)
    end)
 
    game:GetService("Players").LocalPlayer.NameDisplayDistance=0
 
    if _G.Reantheajfdfjdgs then
        return
    end
 
    _G.Reantheajfdfjdgs=":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"
 
    function esp(target,color)
        if(target.Character)then
            if(target.Character:FindFirstChild("GetReal")==nil)then
                local highlight=Instance.new("Highlight")
                highlight.RobloxLocked=true
                highlight.Name="GetReal"
                highlight.Adornee=target.Character
                highlight.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor=color
                highlight.Parent=target.Character
            else
                target.Character.GetReal.FillColor=color
            end
        end
    end
 
    spawn(function()
        while(wait())do
            for _,k in pairs(game.Players:GetPlayers())do
                if(k~=game:GetService("Players").LocalPlayer)then
                    esp(k,(_G.UseTeamColor)and(k.TeamColor.Color)or((game:GetService("Players").LocalPlayer.TeamColor==k.TeamColor)and(_G.FriendColor)or(_G.EnemyColor)))
                end
            end
        end
    end)
end);
c:Button("Fullbright",function()
    if not _G.FullBrightExecuted then
        _G.FullBrightEnabled=false
        _G.NormalLightingSettings={
            Brightness=game:GetService("Lighting").Brightness,
            ClockTime=game:GetService("Lighting").ClockTime,
            FogEnd=game:GetService("Lighting").FogEnd,
            GlobalShadows=game:GetService("Lighting").GlobalShadows,
            Ambient=game:GetService("Lighting").Ambient
        }
 
        game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
            if game:GetService("Lighting").Brightness~=1 and game:GetService("Lighting").Brightness~=_G.NormalLightingSettings.Brightness then
                _G.NormalLightingSettings.Brightness=game:GetService("Lighting").Brightness
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").Brightness=1
            end
        end)
 
        game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
            if game:GetService("Lighting").ClockTime~=12 and game:GetService("Lighting").ClockTime~=_G.NormalLightingSettings.ClockTime then
                _G.NormalLightingSettings.ClockTime=game:GetService("Lighting").ClockTime
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").ClockTime=12
            end
        end)
 
        game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
            if game:GetService("Lighting").FogEnd~=786543 and game:GetService("Lighting").FogEnd~=_G.NormalLightingSettings.FogEnd then
                _G.NormalLightingSettings.FogEnd=game:GetService("Lighting").FogEnd
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").FogEnd=786543
            end
        end)
 
        game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
            if game:GetService("Lighting").GlobalShadows~=false and game:GetService("Lighting").GlobalShadows~=_G.NormalLightingSettings.GlobalShadows then
                _G.NormalLightingSettings.GlobalShadows=game:GetService("Lighting").GlobalShadows
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").GlobalShadows=false
            end
        end)
 
        game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
            if game:GetService("Lighting").Ambient~=Color3.fromRGB(178,178,178) and game:GetService("Lighting").Ambient~=_G.NormalLightingSettings.Ambient then
                _G.NormalLightingSettings.Ambient=game:GetService("Lighting").Ambient
                if not _G.FullBrightEnabled then
                    repeat
                        wait()
                    until _G.FullBrightEnabled
                end
                game:GetService("Lighting").Ambient=Color3.fromRGB(178,178,178)
            end
        end)
 
        game:GetService("Lighting").Brightness=1
        game:GetService("Lighting").ClockTime=12
        game:GetService("Lighting").FogEnd=786543
        game:GetService("Lighting").GlobalShadows=false
        game:GetService("Lighting").Ambient=Color3.fromRGB(178,178,178)
 
        local LatestValue=true
        spawn(function()
            repeat
                wait()
            until _G.FullBrightEnabled
            while wait() do
                if _G.FullBrightEnabled~=LatestValue then
                    if not _G.FullBrightEnabled then
                        game:GetService("Lighting").Brightness=_G.NormalLightingSettings.Brightness
                        game:GetService("Lighting").ClockTime=_G.NormalLightingSettings.ClockTime
                        game:GetService("Lighting").FogEnd=_G.NormalLightingSettings.FogEnd
                        game:GetService("Lighting").GlobalShadows=_G.NormalLightingSettings.GlobalShadows
                        game:GetService("Lighting").Ambient=_G.NormalLightingSettings.Ambient
                    else
                        game:GetService("Lighting").Brightness=1
                        game:GetService("Lighting").ClockTime=12
                        game:GetService("Lighting").FogEnd=786543
                        game:GetService("Lighting").GlobalShadows=false
                        game:GetService("Lighting").Ambient=Color3.fromRGB(178, 178, 178)
                    end
                    LatestValue=not LatestValue
                end
            end
        end)
    end
 
    _G.FullBrightExecuted=true
    _G.FullBrightEnabled=not _G.FullBrightEnabled
end);
 
local animatronicCloseDoor=(getgenv().AnimatronicCloseDoorDebs)or({});
getgenv().AnimatronicCloseDoorDebs=animatronicCloseDoor;
while(getgenv().Inst==cinst)and(game:GetService("RunService").Stepped:Wait())do 
    for _,a in pairs(game:GetService("Workspace").WorkspaceUtilities:GetChildren())do 
        if(getgenv().KillPower==true)and((a.Name=="FrontBlastDoor")or(a.Name=="RightBlastDoor"))then 
            game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Blast Door Interact",a);
        elseif(getgenv().AutoCloseCurtain==true)and(a.Name=="Curtains")and(a:FindFirstChild("Properties")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status").Value==false)then 
            game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Close Curtain",a);
        elseif(getgenv().AutoFixGenerators==true)and(a.Name=="Generator")and(a:FindFirstChild("Properties")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Shutdown")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Shutdown").Value==true)then 
            game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Restart Gen",a);
        elseif(getgenv().AutoPickupPhone==true)and(a.Name=="Telephone")and(a:FindFirstChild("Properties")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status").Value==true)then 
            game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Pickup Telephone",a);
            wait(0.8);
            game:GetService("ReplicatedStorage").Remotes.Client:FireServer("End Call",a);
        elseif(getgenv().AutoFixVentilation==true)and(a.Name=="VentsLever")and(a:FindFirstChild("Properties")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Shutdown")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Shutdown").Value==true)then 
            game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Restart Ventilation",a);
        end;
    end;
    if(getgenv().AutoCloseDoor==true)then 
        for _,animatronic in pairs(game:GetService("Workspace"):GetChildren())do 
            if((animatronic.Name=="Freddy")or(animatronic.Name=="Bonnie")or(animatronic.Name=="Chica")or(animatronic.Name=="Foxy"))and(animatronic:IsA("Model"))then 
                local root=(animatronic.PrimaryPart)or(animatronic:FindFirstChild("HumanoidRootPart"));
                if(root~=nil)then 
                    for _,a in pairs(game:GetService("Workspace").WorkspaceUtilities:GetChildren())do 
                        if(a:FindFirstChild("BlastDoor")~=nil)and(shared.DEBUGMODE==true)then 
                            print(animatronic,(root.Position-a:FindFirstChild("BlastDoor").Position).Magnitude);
                        end;
                        if((a.Name=="FrontBlastDoor")or(a.Name=="RightBlastDoor"))and(animatronicCloseDoor[a.Name]==animatronic)and(a:FindFirstChild("Properties")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status").Value==false)then 
                            animatronicCloseDoor[a.Name]=nil;
                        end;
                        if(getgenv().AutoCloseDoor==true)and((a.Name=="FrontBlastDoor")or(a.Name=="RightBlastDoor"))and(animatronicCloseDoor[a.Name]==nil)and(a:FindFirstChild("Properties")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status").Value==false)and(a:FindFirstChild("BlastDoor")~=nil)and(((root.Position+(root.Velocity/2))-a:FindFirstChild("BlastDoor").Position).Magnitude<=17)then 
                            game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Blast Door Interact",a);
                            animatronicCloseDoor[a.Name]=animatronic;
                            wait(0.5);
                        elseif(getgenv().AutoCloseDoor==true)and((a.Name=="FrontBlastDoor")or(a.Name=="RightBlastDoor"))and(animatronicCloseDoor[a.Name]==animatronic)and(a:FindFirstChild("Properties")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status")~=nil)and(a:FindFirstChild("Properties"):FindFirstChild("Status").Value==true)and(a:FindFirstChild("BlastDoor")~=nil)and(((root.Position+(root.Velocity/2))-a:FindFirstChild("BlastDoor").Position).Magnitude>17)then 
                            game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Blast Door Interact",a);
                            animatronicCloseDoor[a.Name]=nil;
                            wait(0.5);
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
