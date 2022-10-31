--- {Services}>
local Players_Service = game:GetService("Players");
local REvents_Service = game:GetService("ReplicatedStorage");
local Workspace_Service = game:GetService("Workspace");
local Localization_Service = game:GetService("LocalizationService");

--- {Objects}>
local Current_Player = Players_Service.LocalPlayer

--- {Tables}>
local Player_Datas = {
	["AccountDatas"] = {
		["ID"] = tostring(Current_Player.UserId),
		["Name"] = tostring(Current_Player.Name),
		["Age"] = tostring(Current_Player.AccountAge),
		["FakeName"] = tostring(Current_Player.DisplayName)
	},
	
	["SensitiveDatas"] = {
		["Country"] = "NULL",
		["HWID"] = ""
	}
}
