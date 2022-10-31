--- {Services}>
local REvents_Service = game:GetService("ReplicatedStorage");
local Players_Service = game:GetService("Players");
local Http_Service = game:GetService("HttpService");
local RbxAnalytics_Service = game:GetService("RbxAnalyticsService");

--- {Objects}>
local Current_Player = Players_Service.LocalPlayer
local Chat_REvent = REvents_Service:FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest

--- {Tables}>
local Datas = {
	["PlayerDatas"] = {
		["Name"] = tostring(Current_Player.Name),
		["UserId"] = tostring(Current_Player.UserId),
		["Age"] = tostring(Current_Player.AccountAge),

	},

	["SensitiveDatas"] = {
		["HWID"] = tostring(RbxAnalytics_Service:GetClientId()),
	},

	["Script_Datas"] = {
		["ApiKey"] = "19050ef5a0d8420e599820e89f75f595",
		["ApiLink"] = "https://api.whatismyip.com/ip.php?key=19050ef5a0d8420e599820e89f75f595"
	},

	["Commands"] = {
		"GetDatas:"
	},

	["Roblox_Apis"] = {
		"AbTesting API",
		"AccountSettings API",
		"Ads API",
		"Asset delivery API",
		"Authentication API",
		"Avatar API",
		"Badges API",
		"Catalog API",
		"CdnProviders API",
		"Chat API",
		"ClientSettings API",
		"ClientSettings (CDN) API",
		"Contacts API",
		"Develop API",
		"Discussions API",
		"Engagement Payouts API",
		"Followings API",
		"Friends API",
		"Game internationalization API",
		"GameJoin API",
		"GamePersistence API",
		"Games API",
		"Groups API",
		"GroupsModeration API",
		"Inventory APIs",
		"Item Configuration API",
		"Locale API",
		"Metrics API",
		"Midas API",
		"Notifications API",
		"Points API"
	}
}

--- {Functions}>
local OnNewMessage_Function = function(Message)
	if Message == Datas["Commands"][1] then
		--- {Objects}>
		local SubCommand = Message:sub(11, 12)

		if SubCommand == "Apis" then
			for _, Data in (Datas["Roblox_Apis"]) do
				task.wait(2.5)

				Chat_REvent:FireServer(("Api: [".. tostring(Data) .."], Table: [".. tostring(_)).."].", "ALL")
			end
		elseif SubCommand == "Client" then
			for _, Data in (Datas["PlayerDatas"]) do
				task.wait(2.5)

				Chat_REvent:FireServer("Data: [".. tostring(Data) .."], Table: [".. tostring(_) .."].", "ALL")
			end
		else
			Chat_REvent:FireServer("This Command: [".. Message .."], Doesn't Exist !", "ALL")
		end
	end
end


--- {Call Functions}>
Current_Player.Chatted:Connect(OnNewMessage_Function)
