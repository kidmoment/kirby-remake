local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
 local Window = OrionLib:MakeWindow({Name = "dahood and other script", HidePremium = false, SaveConfig = true, ConfigFolder = "zxc folder"})
 local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local Section = Tab:AddSection({
    Name = "dahood Main"
})
Tab:AddButton({
    Name = "ChatSpy",
    Callback = function()
              -- This is not mine, unsure who made it but i didn't create this

-- // Initialise
--if (getgenv().ChatSpy) then return getgenv().ChatSpy; end;
repeat wait() until game:GetService("ContentProvider").RequestQueueSize == 0;
repeat wait() until game:IsLoaded();

-- // Vars
local Players = game:GetService("Players");
local StarterGui = game:GetService("StarterGui");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local LocalPlayer = Players.LocalPlayer;
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui");
local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents");
local SayMessageRequest = DefaultChatSystemChatEvents:WaitForChild("SayMessageRequest");
local OnMessageDoneFiltering = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering");
getgenv().ChatSpy = {
    Enabled = true,
    SpyOnSelf = false,
    Public = false,
    Chat = {
        Colour  = Color3.fromRGB(255, 0, 0),
        Font = Enum.Font.SourceSans,
        TextSize = 18,
        Text = "",
    },
    IgnoreList = {
        {Message = ":part/1/1/1", ExactMatch = true},
        {Message = ":part/10/10/10", ExactMatch = true},
        {Message = "A?????????", ExactMatch = false},
        {Message = ":colorshifttop 10000 0 0", ExactMatch = true},
        {Message = ":colorshiftbottom 10000 0 0", ExactMatch = true},
        {Message = ":colorshifttop 0 10000 0", ExactMatch = true},
        {Message = ":colorshiftbottom 0 10000 0", ExactMatch = true},
        {Message = ":colorshifttop 0 0 10000", ExactMatch = true},
        {Message = ":colorshiftbottom 0 0 10000", ExactMatch = true},
    },
};

-- // Function
function ChatSpy.checkIgnored(message)
    for i = 1, #ChatSpy.IgnoreList do
        local v = ChatSpy.IgnoreList[i];
        if (v.ExactMatch and message == v.Message) or (not v.ExactMatch and string.match(v.Message, message)) then 
            return true;
        end;
    end;
    return false;
end;

function ChatSpy.onChatted(targetPlayer, message)
    if (targetPlayer == LocalPlayer and string.lower(message):sub(1, 4) == "/spy") then
        ChatSpy.Enabled = not ChatSpy.Enabled; wait(0.3);
        ChatSpy.Chat.Text = "[SPY] - "..(ChatSpy.Enabled and "Enabled." or "Disabled.");

        StarterGui:SetCore("ChatMakeSystemMessage", ChatSpy.Chat);
    elseif (ChatSpy.Enabled and (ChatSpy.SpyOnSelf or targetPlayer ~= LocalPlayer)) then
        local message = message:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ');

        local Hidden = true;
        local Connection = OnMessageDoneFiltering.OnClientEvent:Connect(function(packet, channel)
            if (packet.SpeakerUserId == targetPlayer.UserId and packet.Message == message:sub(#message - #packet.Message + 1) and (channel == "All" or (channel == "Team" and not ChatSpy.Public and Players[packet.FromSpeaker].Team == LocalPlayer.Team))) then
                Hidden = false;
            end;
        end);

        wait(1);
        Connection:Disconnect();

        if (Hidden and ChatSpy.Enabled and not ChatSpy.checkIgnored(message)) then
            if (#message > 1200) then
                message = message:sub(1200) .. "...";
            end;
            ChatSpy.Chat.Text = "[SPY] - ["..targetPlayer.Name.."]: " .. message;
            if (ChatSpy.Public) then SayMessageRequest:FireServer(ChatSpy.Chat.Text, "All"); else StarterGui:SetCore("ChatMakeSystemMessage", ChatSpy.Chat); end;
        end;
    end;
end;

-- // Handling Chats
local AllPlayers = Players:GetPlayers();
for i = 1, #AllPlayers do
    local player = AllPlayers[i];
    player.Chatted:Connect(function(message)
        ChatSpy.onChatted(player, message);
    end);
end;

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        ChatSpy.onChatted(player, message);
    end);
end);

-- // Initialise Text
ChatSpy.Chat.Text = "[SPY] - "..(ChatSpy.Enabled and "Enabled." or "Disabled.");
StarterGui:SetCore("ChatMakeSystemMessage", ChatSpy.Chat);

-- // Update Chat Frame
local chatFrame = LocalPlayer.PlayerGui.Chat.Frame;
chatFrame.ChatChannelParentFrame.Visible = true;
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y);
      end    
})
Tab:AddButton({
    Name = "btools idk",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
      end    
})
Tab:AddButton({
    Name = "no recoil",
    Callback = function()
        local CurrentFocus = game:GetService("Workspace").CurrentCamera.CFrame
        game:GetService("Workspace").CurrentCamera:Destroy()
        local Instance = Instance.new("Camera", game:GetService("Workspace"))
        Instance.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
        Instance.CameraType = Enum.CameraType.Custom
        Instance.CFrame = CurrentFocus
      end    
})
Tab:AddButton({
    Name = "auto eat",
    Callback = function()
        Game.StarterGui:SetCore("SendNotification", {Title = "HSBC", Text = "Autoeat Activado [50 Health]", Duration = 60

    })
    
    while wait() do
            pcall(function()
                if game.Players.LocalPlayer.Character.Humanoid.Health > 50 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 999, 0)
                    if game.Players.LocalPlayer.Character:FindFirstChild("[Chicken]") == nil or game.Players.LocalPlayer.Backpack:FindFirstChild("[Chicken]") == nil then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Chicken] - $7"].Head.CFrame
                        wait(0.5)
                        fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
                    end
                    pcall(function()game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["[Chicken]"])end)
                    pcall(function()
                        game.Players.LocalPlayer.Character["[Chicken]"]:Activate()
                        wait(0.1)
                        game.Players.LocalPlayer.Character["[Chicken]"]:Deactivate()
                    end)
                end
            end)
        end
      end    
})
Tab:AddButton({
    Name = "anti stomp",
    Callback = function()
        game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
            if KeyPressed == "k" then
               for L_170_forvar0, L_171_forvar1 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                   if L_171_forvar1:IsA("BasePart") then
                       L_171_forvar1:Destroy()
                   end
               end
               end
           end)
      end    
})
local Tab = Window:MakeTab({
    Name = "prisonlife",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local Section = Tab:AddSection({
    Name = "main"
})
Tab:AddButton({
    Name = "admin!",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife'),true))()
      end    
})
dahood:AddButton({
    Name = "rainbow",
    Callback = function()
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("MeshPart") then
                v.Material = "ForceField"
                spawn(function()
                    while wait() do
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v:IsA("MeshPart") then
                                v.Color = Color3.fromHSV(tick()%5/5,1,1)
                                wait()
                            end
                        end 
                    end
                end)
            end
        end
      end    
})
local Tab = Window:MakeTab({
    Name = "other",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local Section = Tab:AddSection({
    Name = "visuals"
})
Tab:AddButton({
    Name = "low gfx for table",
    Callback = function()
        for _,v in pairs(workspace:GetDescendants()) do
            if v.ClassName == "Part"
            or v.ClassName == "SpawnLocation"
            or v.ClassName == "WedgePart"
            or v.ClassName == "Terrain"
            or v.ClassName == "MeshPart" then
            v.Material = "Plastic"
            end
            end  
      end    
})
other:AddButton({
    Name = "bypass anti cheat ( try for you not SCARY )",
    Callback = function()
        if game.PlaceId == 2788229376 then
            wait(10)
            assert(getrawmetatable)
            gmt = getrawmetatable(game)
            setreadonly(gmt, false)
            old = gmt.__namecall
            gmt.__namecall =
                newcclosure(
                    function(self, ...)
                    local args = {...}
                    if tostring(args[1]) == "BreathingHAMON" then
                        return
                    elseif tostring(args[1]) == "TeleportDetect" then
                        return
                    elseif tostring(args[1]) == "CHECKER_1" then
                        return
                    elseif tostring(args[1]) == "CHECKER" then
                        return
                    elseif tostring(args[1]) == "GUI_CHECK" then
                        return
                    elseif tostring(args[1]) == "OneMoreTime" then
                        return
                    elseif tostring(args[1]) == "checkingSPEED" then
                        return
                    elseif tostring(args[1]) == "BANREMOTE" then
                        return
                    elseif tostring(args[1]) == "PERMAIDBAN" then
                        return
                    elseif tostring(args[1]) == "KICKREMOTE" then
                        return
                    elseif tostring(args[1]) == "BR_KICKPC" then
                        return end
            
                    return old(self, ...)
                end)
                end
      end    
})
other:AddButton({
    Name = "visual skin",
    Callback = function()
        local L_393_ = game.Players.LocalPlayer.Character
        local L_394_ = L_393_:WaitForChild("Head")
        local L_395_ = L_394_:WaitForChild("face")
        L_395_.Transparency = 1 --Texture = "rbxassetid://209712379"
        L_394_.Transparency = 1
        local L_396_ = game.Players.LocalPlayer.Character
        local L_397_ = game.Players.LocalPlayer.Character
        local L_398_ = L_396_.Head
        local L_399_ = L_398_.face
        local L_400_ = L_397_.RightFoot
        local L_401_ = L_397_.RightLowerLeg
        local L_402_ = L_397_.RightUpperLeg
        local L_403_ = L_397_.LeftFoot
        local L_404_ = L_397_.LeftLowerLeg
        local L_405_ = L_397_.LeftUpperLeg
        L_400_.MeshId = "http://www.roblox.com/asset/?id=902942093"
        L_401_.MeshId = "http://www.roblox.com/asset/?id=902942093"
        L_402_.MeshId = "http://www.roblox.com/asset/?id=902942096"
        L_402_.TextureID = "http://roblox.com/asset/?id=902843398"
        L_400_.Transparency = 1
        L_401_.Transparency = 1
        
      end    
})