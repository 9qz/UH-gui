local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/notiflib/main/main"))()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Drags UH Gui", "Ocean")

local AllTab = Window:NewTab("All")

local AllSection = AllTab:NewSection("All")

local SelfTab = Window:NewTab("Self")

local SelfSection = SelfTab:NewSection("Self")

local TargetTab = Window:NewTab("Target")

local TargetSection = TargetTab:NewSection("Target")

local OtherTab = Window:NewTab("Other")

local OtherSection = OtherTab:NewSection("Other")

local SettingsTab = Window:NewTab("Settings")

local SettingsSection = SettingsTab:NewSection("Settings")



function findplr(plr)
	local checkyes = string.len(plr)
	for i,v in pairs(game.Players:GetPlayers()) do
		local flitering = string.sub(string.lower(v.Name), 1, checkyes)
		if v.ClassName == "Player" and flitering == string.lower(plr) then
			return v
		end
	end
end


SettingsSection:NewTextBox("Message", "the message you send when you tp", function(txt)
    getgenv().Message = txt
    print(getgenv().Message)
end)

TargetSection:NewTextBox("Target", "the person that gets ...", function(txt)
    v = findplr(txt).name
    getgenv().Target = v
    print(getgenv().Target)
end)

TargetSection:NewButton("Give Cash", "Gives the target cash.", function()
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
    "Reload",
    {
       Name = "[Revolver]",
       Ammo = {Value = math.huge*9e9},
       MaxAmmo = {Value = 0}
    }
    )
    task.wait(2)
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
        "Reload",
        {
            Name = "[Revolver]",
            Ammo = game:GetService("Players")[getgenv().Target].DataFolder.Currency,
            MaxAmmo = {Value = 9000000000000000000}
        }
    )
end)

TargetSection:NewButton("Give Headless", "Gives the target headless.", function()
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
    "Reload",
    {
       Name = "[Revolver]",
       Ammo = {Value = math.huge*9e9},
       MaxAmmo = {Value = 0}
    }
    )
    task.wait(2)
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
        "Reload",
        {
            Name = "[Revolver]",
            Ammo = workspace.Players[getgenv().Target].Humanoid["HeadScale"],
            MaxAmmo = {Value = -1}
        }
     )
end)

AllSection:NewButton("Cash All", "teleports to everyone and gives money", function()
    notif:Notification("Cash All","might not give everyone cash","GothamSemibold","Gotham", 5)
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
    "Reload",
    {
       Name = "[Revolver]",
       Ammo = {Value = math.huge*9e9},
       MaxAmmo = {Value = 0}
    }
    )
    task.wait(2)
    for i, v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer then
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().Message,"All")
                p1.CFrame = game.Players[v.name].Character.HumanoidRootPart.CFrame
                game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
                    "Reload",
                    {
                        Name = "[Revolver]",
                        Ammo = game:GetService("Players")[v.name].DataFolder.Currency,
                        MaxAmmo = {Value = 9000000000000000000}
                    }
                )
                task.wait(2.3)
        end
    end
end)

AllSection:NewButton("Headless All", "gives everyone headless", function()
    notif:Notification("Headless All","might not give everyone headless","GothamSemibold","Gotham", 5)
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
        "Reload",
        {
            Name = "[Revolver]",
            Ammo = {Value = math.huge*9e9},
            MaxAmmo = {Value = 0}
        }
        )
    task.wait(2)

    for i, v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer then
                 game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().Message,"All")
                 p1.CFrame = game.Players[v.name].Character.HumanoidRootPart.CFrame
                 game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
                    "Reload",
                    {
                        Name = "[Revolver]",
                        Ammo = workspace.Players[v.name].Humanoid["HeadScale"],
                        MaxAmmo = {Value = -1}
                    }
                 )
                 task.wait(2.3)
        end
     end
end)



SelfSection:NewButton("Get Cash", "gives you cash", function()
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
        "Reload",
        {
            Name = "[Revolver]",
            Ammo = {Value = math.huge*9e9},
            MaxAmmo = {Value = 0}
        }
        )
    task.wait(2)

    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
        "Reload",
        {
            Name = "[Revolver]",
            Ammo = game:GetService("Players")[game.Players.LocalPlayer.name].DataFolder.Currency,
            MaxAmmo = {Value = 9000000000000000000}
        }
    )
end)

SelfSection:NewButton("Headless", "gives you headless", function()
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
        "Reload",
        {
            Name = "[Revolver]",
            Ammo = {Value = math.huge*9e9},
            MaxAmmo = {Value = 0}
        }
        )
    task.wait(2)

    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
        "Reload",
        {
            Name = "[Revolver]",
            Ammo = workspace.Players[game.Players.LocalPlayer.name].Humanoid["HeadScale"],
            MaxAmmo = {Value = -1}
        }
    )
end)

SelfSection:NewButton("TP To Rev", "Teleports you to revolver", function()
    p1.CFrame = CFrame.new(-313, 22, -1177)
end)

SelfSection:NewSlider("Walkspeed", "Changes your walkspeed.", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

OtherSection:NewButton("Crash Server", "Crashes the server.", function()
    notif:Notification("Crash Server","NOTE: this doesn't always work","GothamSemibold","Gotham", 5)
    for i, v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer then
                p1.CFrame = game.Players[v.name].Character.HumanoidRootPart.CFrame
                game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
                    "Reload",
                    {
                        Name = "[Revolver]",
                        Ammo = workspace.Players[v.name].Humanoid["HeadScale"],
                        MaxAmmo = {Value = 99999}
                    }
                )
                task.wait(2.3)
        end
     end
end)

TargetSection:NewButton("TP To Target", "Teleports you to the target.", function()
    p1.CFrame = game.Players[getgenv().Target].Character.HumanoidRootPart.CFrame
end)

TargetSection:NewButton("Change Height", "Changes targets height.", function()
    game.ReplicatedStorage:FindFirstChild(".gg/untitledhood"):FireServer(
        "Reload",
        {
            Name = "[Revolver]",
            Ammo = workspace.Players[getgenv().Target].Humanoid["BodyHeightScale"],
            MaxAmmo = {Value = getgenv().Height}
        }
    )
end)

TargetSection:NewSlider("Height", "The targets height.", 99, 1, function(s)
    getgenv().Height = s
end)

notif:Notification("UH GUI made by drag","Discord: drag#6311","GothamSemibold","Gotham", 5)