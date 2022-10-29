--- {Services}>
local Players_Service = game:GetService("Players");
local RbxAnalytics_Service = game:GetService("RbxAnalyticsService")
local REvents_Service = game:GetService("ReplicatedStorage");
local Market_Service = game:GetService("MarketplaceService");
local Workspace_Service = game:GetService("Workspace");
local Run_Service = game:GetService("RunService");

--- {Variables}>
_G.Checked_GamePasses = false
getgenv().SecureMode = true

--- {Objects}>
local Current_Player = Players_Service.LocalPlayer
local UI_Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xamenia-OfficialHD/Proton-Solar-V4.1-BETA/main/UI_Lib.Lua", true))()
local Player_Character = Current_Player.Character or Current_Player.CharacterAdded:Wait()
local Player_Humanoid = Player_Character:WaitForChild("Humanoid")
local CurrentPlayer_HWID = RbxAnalytics_Service:GetClientId()

--- {Tables}>
Tables = {
	["Supported_Games"] = {
		["155615604"] = {
			["Supported"] = true,

			--- {GamePasses}>
			["GamePasses"] = {
				["Swat"] = {
					["Id"] = "96651",
				}
			}
		}
	},

	["ProtonSolar_Datas"] = {
		["Datas"] = {
			["Version"] = "4.1",
			["Key"] = "123_"
		}
	}
}

--- {Functions}>
local Notification_Function = function(Title, Content, ID)
	UI_Lib:Notify(
		Title,
		Content,
		ID
	)
end

local LoadProtonSolar_Function = function()
	--- {Objects}>
	local Workspace_Remotes = Workspace_Service.Remote

	local Main_Window = UI_Lib:CreateWindow({
		Name = "Proton-Solar [V".. Tables["ProtonSolar_Datas"]["Datas"]["Version"] .."]",
		LoadingTitle = "Welcome To Proton-Solar [V".. Tables["ProtonSolar_Datas"]["Datas"]["Version"] .."]",
		LoadingSubtitle = "By Xamenia",
		Note = "This Hub Is In [BETA].",
		KeySystem = true,

		--- {Save Settings}>
		ConfigurationSaving = {
			Enabled = true,
			FileName = "ProtonSolar_Config"
		},

		--- {KeySystem Settings}>
		KeySettings = {
			Title = "ProtonSolar [V".. Tables["ProtonSolar_Datas"]["Datas"]["Version"] .."] Hub",
			Subtitle = "Key System",
			Note = "This Key System Isn't Good Lol.",
			Key = Tables["ProtonSolar_Datas"]["Datas"]["Key"]
		}
	})

	--- {Tabs}>
	local Home_Tab = Main_Window:CreateTab("Home")
	local Client_Tab = Main_Window:CreateTab("Client")
	local Server_Tab = Main_Window:CreateTab("Server")

	--- {Labels}>
	local Guns_Label = Server_Tab:CreateLabel("Guns-Giver")
	local TPLoc_Label = Client_Tab:CreateLabel("TP-Locations")

	--- {DropDowns}>
	local Dropdown_1 = Server_Tab:CreateDropdown({
		Name = "Guns",
		Options = {"M9", "AK-47", "Remington 870", "M4A1"},
		CurrentOption = "None",

		Callback = function(Option)
			--- {Objects}>
			local Choosed_Gun = Workspace_Service["Prison_ITEMS"].giver[Option].ITEMPICKUP
			local Gun_Event = Workspace_Remotes.ItemHandler
			local Player_Backpack = Current_Player.Backpack	

			--- {Check}>
			if Player_Backpack:FindFirstChild(Option) then
				Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"]["Datas"]["Version"] .. "] | Notification", "Oops! The Gun: [".. Option .."], Is Already In Your Inventory.", 7169354142)
			else
				if Option == "M4A1" then
					if _G.Checked_GamePasses then
						Gun_Event:InvokeServer(Choosed_Gun)
					else
						Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"]["Datas"]["Version"] .. "] | Notification", "Checking GamePass For: [".. Option .."], Please Wait...", 7169354142)
						task.wait(3.5)

						local Success, Result = pcall(function()
							return Market_Service:UserOwnsGamePassAsync(Current_Player.UserId, Tables["Supported_Games"]["155615604"]["GamePasses"]["Swat"]["Id"])
						end)

						if Success then
							_G.Checked_GamePasses = true
							Gun_Event:InvokeServer(Choosed_Gun)
						else
							Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"]["Datas"]["Version"] .. "] | Notification", "Oops! Look Like You Doesn't Own This GamePass: [".. Tables["Supported_Games"]["155615604"]["GamePasses"]["Swat"]["Name"] .."].", 7169354142)
						end
					end
				else
					Gun_Event:InvokeServer(Choosed_Gun)
				end
			end
		end,
	})

	local Dropdown_2 = Server_Tab:CreateDropdown({
		Name = "Mod-Guns",
		Options = {"M9", "AK-47", "Remington 870", "M4A1"},
		CurrentOption = "None",

		Callback = function(Option)
			--- {Objects}>
			local Player_Backpack = Current_Player.Backpack

			-- {Variables}>
			local Gun_Module = nil
			local Gun_Moded = nil

			--- {Check}>
			if Player_Backpack:FindFirstChild(Option) then
				Gun_Module = require(Player_Backpack[Option].GunStates)
			elseif Player_Character:FindFirstChild(Option) then
				Gun_Module = require(Player_Character[Option].GunStates)
			else
				Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"]["Datas"]["Version"] .. "] | Notification", "Oops! The Gun: [".. Option .."] Doesn't Seem To Be Into Your Inventory / Character.", 7169354142)
			end

			--- {Check Module}>
			if Gun_Module ~= nil then
				Gun_Moded = true

				if Option ~= "Remington 870" then
					Gun_Module["MaxAmmo"] = math.huge
					Gun_Module["CurrentAmmo"] = math.huge
					Gun_Module["StoredAmmo"] = math.huge
					Gun_Module["FireRate"] = 0.0000000000000000001
					Gun_Module["Spread"] = 0
					Gun_Module["Range"] = math.huge
					Gun_Module["Bullets"] = 5
					Gun_Module["ReloadTime"] = 0.0000000000000000001
					Gun_Module["AutoFire"] = true
				else
					Gun_Module["MaxAmmo"] = math.huge
					Gun_Module["CurrentAmmo"] = math.huge
					Gun_Module["StoredAmmo"] = math.huge
					Gun_Module["FireRate"] = 0.0000000000000000001
					Gun_Module["Spread"] = 0
					Gun_Module["Range"] = math.huge
					Gun_Module["Bullets"] = 3
					Gun_Module["ReloadTime"] = 0.0000000000000000001
					Gun_Module["AutoFire"] = true
				end
			elseif Gun_Module ~= nil and Gun_Moded then
				Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"]["Datas"]["Version"] .. "] | Notification", "Oops! The Gun: [".. Option .."] Seem To Arleady Be Moded.", 7169354142)
			end
		end,
	})

	local Dropdown_3 = Client_Tab:CreateDropdown({
		Name = "Locations",
		Options = {"Criminal Base", "Prison"},
		CurrentOption = "None",

		Callback = function(Option)
			if Option ~= "None" then
				Option:Set("None")
				Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"].Datas["Version"] .. "] | Notification", "Oops! The Feature You're Using Is Coming Soon.", 7169354142)
			end
		end,
	})

	local Dropdown_3 = Server_Tab:CreateDropdown({
		Name = "Teams",
		Options = {"Criminal", "Police", "Prisoner", "Neutral"},
		CurrentOption = "None",

		Callback = function(Option)
			if Option == "Criminal" then
				Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"].Datas["Version"] .. "] | Notification", "Oops! The Team You Choosed Isn't Avalaible!", 7169354142)
			elseif Option == "Police" then
				Workspace_Remotes.TeamEvent:FireServer("Bright blue")
			elseif Option == "Prisoner" then
				Workspace_Remotes.TeamEvent:FireServer("Bright orange")
			elseif Option == "Neutral" then
				Workspace_Remotes.TeamEvent:FireServer("Medium stone grey")
			end
		end,
	})

	--- {Sliders}>
	local WalkSpeed_Slider = Client_Tab:CreateSlider({
		Name = "WalkSpeed",
		Range = {0, 250},
		Increment = 1,
		Suffix = "WalkSpeed",
		CurrentValue = Player_Humanoid.WalkSpeed,

		Callback = function(Value)
			if Player_Humanoid then
				Player_Humanoid.WalkSpeed = Value
			end
		end,
	})

	local JumpPower_Slider = Client_Tab:CreateSlider({
		Name = "JumpPower",
		Range = {0, 250},
		Increment = 1,
		Suffix = "JumpPower",
		CurrentValue = Player_Humanoid.JumpPower,

		Callback = function(Value)
			if Player_Humanoid then
				Player_Humanoid.JumpPower = Value
			end
		end,
	})

	--- {TextBoxs}>
	local HipHeight = Client_Tab:CreateInput({
		Name = "HipHeight",
		PlaceholderText = "Enter The Hip-Height You Want.",
		RemoveTextAfterFocusLost = false,

		Callback = function(Text)
			if Player_Humanoid then
				Player_Humanoid.HipHeight = Text
			end
		end,
	})

	--- {Toggles}>
	local Toggle = Server_Tab:CreateToggle({
		Name = "Anti-Taze",
		CurrentValue = false,
		Flag = "AntiTaze_Toggle",

		Callback = function(Value)
			Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"].Datas["Version"] .. "] | (Anti-Tase) Notification", "If This Feature Doesn't Work, Please Contact Me On Discord {Copied To Your ClipBoard} (You May Send A Friend Request).", 7169354142)
			setclipboard("Xamenia#2020")

			while task.wait(0.05) do
				if not Value then
					Player_Character.ClientInputHandler.Disabled = false
				else
					Player_Character.ClientInputHandler.Disabled = true
				end
			end
		end,
	})

	--- {Buttons}>
	local Crash_Button = Home_Tab:CreateButton({
		Name = "[!] Crash Server [!]",

		Callback = function()
			--- {Objects}>
			local Player_Backpack = Current_Player.Backpack
			local REvent = REvents_Service.ShootEvent

			--- {Variables}>
			local Needed_Gun = "Remington 870"

			--- {Check}>
			if Player_Backpack:FindFirstChild(Needed_Gun) then
				for _, Value in pairs(Player_Backpack:GetChildren()) do
					if Value.Name == (Needed_Gun) then
						Value.Parent = Player_Character
					end
				end

				--- {Finish}>
				Needed_Gun = Player_Character:WaitForChild("Remington 870")
				Player_Humanoid:UnequipTools()

				--- {Functions}>
				local Crash_Function = function(Target)
					coroutine.resume(coroutine.create(function()
						--- {Tables}>
						local Bullets_Table = {}

						table.insert(Bullets_Table, {
							Hit = Target,
							Distance = 100,
							Cframe = CFrame.new(0, 1, 1),
							RayObject = Ray.new(Vector3.new(0.1, 0.2), Vector3.new(0.3, 0.4))
						})

						REvent:FireServer(Bullets_Table, Needed_Gun)
						task.wait()
					end))
				end

				while Run_Service.Stepped:Wait() do
					for Count = 0, 10, 0 do
						Crash_Function()
					end
				end
			else
				Notification_Function("Proton-Solar [V".. Tables["ProtonSolar_Datas"].Datas["Version"] .. "] | (Crash) Notification", "Oops! Look Like The Required Gun: [".. Needed_Gun .."], Isn't In Your Inventory.", 7169354142)
			end
		end,
	})
end


--- {Call Functions}>
LoadProtonSolar_Function(game.PlaceId)
UI_Lib:LoadConfiguration()
