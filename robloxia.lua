local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()
library.rank = "developer"
--local Wm = library:Watermark("Forsaken Tower Defense | UPD" .. gameVersion ..  " | " .. library:GetUsername())
local Wm = library:Watermark("Robloxia:Corruption")
local FpsWm = Wm:AddWatermark("FPS: "..library.fps)
local TimeWm = Wm:AddWatermark("Time: "..game:GetService("ReplicatedStorage").Game.Time.Value)
local PowerWm = Wm:AddWatermark("Power: "..game:GetService("ReplicatedStorage").Game.PowerTime.Value)
coroutine.wrap(function()
    while wait(.75) do
        FpsWm:Text("FPS: "..library.fps)
    end
end)()

--- EVENTS ---
game:GetService("ReplicatedStorage").Game.Time.Changed:Connect(function()
	TimeWm:Text("Time: "..game:GetService("ReplicatedStorage").Game.Time.Value)
end)
game:GetService("ReplicatedStorage").Game.PowerTime.Changed:Connect(function()
	PowerWm:Text("Power: "..game:GetService("ReplicatedStorage").Game.PowerTime.Value)
end)
--- EVENTS ---

local Notif = library:InitNotifications()

local LoadingXSX = Notif:Notify("Loading hub, please be patient.", 3, "information") -- notification, alert, error, success, information

library.title = "Pencilll Hub | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

library:Introduction()
local Init = library:Init()

local Tab0 = Init:NewTab("Main")
local Tab1 = Init:NewTab("Player")
local Tab2 = Init:NewTab("Misc")

--- MAIN TAB ---
local Textbox1 = Tab0:NewTextbox("Fake Name", "", "Name", "all", "medium", true, false, function(val)
	if val ~= "" then
		game:GetService("Players").LocalPlayer.PlayerGui.StaminaUI.MainFrame.Username.Text = val
	else
		game:GetService("Players").LocalPlayer.PlayerGui.StaminaUI.MainFrame.Username.Text = game:GetService("Players").LocalPlayer.Name
	end
end)
local Toggle1 = Tab0:NewToggle("Fullbright", false, function(value)
    if value == true then
		game:GetService("Lighting").Brightness = 3
		game:GetService("Lighting").ClockTime = 14
		game:GetService("Lighting").FogEnd = 100000
		game:GetService("Lighting").GlobalShadows = false
		game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		for i,v in pairs(game:GetService("Lighting"):GetDescendants()) do
			if v:IsA("Atmosphere") then
				v.Parent = game:GetService("ReplicatedFirst")
			end
		end
	elseif value == false and game:GetService("ReplicatedStorage").Game.Night.Value == true then
		game:GetService("Lighting").Brightness = 0
		game:GetService("Lighting").ClockTime = 1
		game:GetService("Lighting").FogEnd = 100000
		game:GetService("Lighting").GlobalShadows = true
		game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(11, 11, 11)
		for i,v in pairs(game:GetService("ReplicatedFirst"):GetDescendants()) do
			if v:IsA("Atmosphere") then
				v.Parent = game:GetService("Lighting")
			end
		end
	elseif value == false and game:GetService("ReplicatedStorage").Game.Night.Value == false then
		game:GetService("Lighting").Brightness = 1.1
		game:GetService("Lighting").ClockTime = 13
		game:GetService("Lighting").FogEnd = 100000
		game:GetService("Lighting").GlobalShadows = false
		game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(64, 84, 91)
		for i,v in pairs(game:GetService("ReplicatedFirst"):GetDescendants()) do
			if v:IsA("Atmosphere") then
				v.Parent = game:GetService("Lighting")
			end
		end
	end
end)
local Toggle2 = Tab0:NewToggle("Monster ESP", false, function(value)
	local monster = game:GetService("ReplicatedStorage").Game.CurrentEntity.Value
    if value == true then
		local hl1 = Instance.new("Highlight", workspace.Zombie)
		local hl2 = Instance.new("Highlight", workspace.Noob)
		hl1.FillColor = Color3.new(255, 255, 255)
		hl1.OutlineColor = Color3.new(255, 0, 0)
		hl2.FillColor = Color3.new(255, 255, 255)
		hl2.OutlineColor = Color3.new(255, 0, 0)
	elseif value == false then
		workspace.Zombie:FindFirstChildWhichIsA("Highlight"):Destroy()
		workspace.Noob:FindFirstChildWhichIsA("Highlight"):Destroy()
	end
end)
--- MAIN TAB ---

--- PLAYER TAB ---
local musicId = 0
local animId = 0

local Slider1 = Tab1:NewSlider("Run Speed", "", true, "/", {min = 1, max = 200, default = 30.5}, function(value)
    game:GetService("Players").LocalPlayer.Character.Local.RunningSystem.RunSpeed.Value = value
end)
local Slider2 = Tab1:NewSlider("Walk Speed", "", true, "/", {min = 1, max = 200, default = 14.5}, function(value)
    game:GetService("Players").LocalPlayer.Character.Local.RunningSystem.WalkSpeed.Value = value
end)
local Textbox1 = Tab1:NewTextbox("Type ID", "", "Music ID", "all", "medium", true, false, function(val)
    musicId = val
end)
Textbox1:Hide()
local Selector1 = Tab1:NewSelector("Choose ID", "Music List", {"93045675505687","117562011395992","110976323938779","93218265275853","137737879705465","83405484820883","124394293950763","92270747179845","134148896256888","99959126422360","142376088"}, function(val)
    musicId = val
end)
local Toggle1 = Tab1:NewToggle("Manual type", false, function(value)
    if value == true then
		Selector1:Hide()
		Textbox1:Show()
	elseif value == false then
		Selector1:Show()
		Textbox1:Hide()
	end
end)
local Button2 = Tab1:NewButton("Play Music", function()
    game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Local.Animation:FireServer(true, "rbxassetid://"..musicId, "rbxassetid://"..animId)
end)
local Button3 = Tab1:NewButton("Stop Music", function()
    game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Local.Animation:FireServer(false, "rbxassetid://"..musicId, "rbxassetid://"..animId)
end)
--- PLAYER TAB ---

--- MISC TAB ---
local Button1 = Tab2:NewButton("Rejoin", function()
   	local Players = game:GetService("Players")
	local TeleportService = game:GetService("TeleportService")
	local PlaceId = game.PlaceId
	local JobId = game.JobId
	if #Players:GetPlayers() <= 1 then
		Players.LocalPlayer:Kick("Rejoining...")
		wait()
		TeleportService:Teleport(PlaceId, Players.LocalPlayer)
	else
		TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
	end
end)
--- MISC TAB ---

local FinishedLoading = Notif:Notify("Finished loading Robloxia:Corruption !", 4, "success")
