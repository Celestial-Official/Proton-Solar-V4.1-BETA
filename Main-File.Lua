--- {Services}>
local REvents_Service = game:GetService("ReplicatedStorage");
local Market_Service = game:GetService("MarketplaceService");
local Workspace_Service = game:GetService("Workspace");
local Users_Service = game:GetService("Players");
local RbxAnalytics_Service = game:GetService("RbxAnalyticsService");

--- {Variables}>
getgenv().SecureMode = true
_G.Checked_GamePasses = false
local RobloxServersAPI = "https://www.roblox.com/v1/games/"

--- {Objects}>
local UserExecutor = identifyexecutor()
local Current_User = Users_Service.LocalPlayer
local UI_Link = "https://raw.githubusercontent.com/Xamenia-OfficialHD/Proton-Solar-V4.1-BETA/main/UI_Lib.Lua"
local UI_Lib = loadstring(game:HttpGet(UI_Link), true)()
local User_HWID = RbxAnalytics_Service:GetClientId()
local User_Character = Current_User.Character or Current_User.CharacterAdded:Wait()
local User_Humanoid = User_Character:WaitForChild("Humanoid")

--- {Tables}>
local Tables = {
    ["Datas"] = {
        ["RegisteredUsers"] = {
            ["46D9CAF3-6A19-4E6C-AE67-15D57127A0C6"] = {
                UserInfos = {UserName = "24kAstraz"},
                UserDatas = {LoginKey = "lollypop123", UserType = "Premium"},
                UserStatus = {BlackListed = false, BlackListReason = ""}
            },

            ["96734172-E4F7-4A22-B35E-1DAAA6658387"] = {
                UserInfos = {UserName = "Xamenia_Official"},
                UserDatas = {LoginKey = "Admin", UserType = "Administrator"},
                UserStatus = {BlackListed = false, BlackListReason = ""}
            }
        },

        ["ProtoSmasher_Datas"] = {
            Version = "7.0",
            Updated = true,
            Patched = false,
        }
    },

    ["Supported_GameIds"] = {
        155615604,
		369152986
    }
}

--- {Functions}>
local LoadProtoSmasher_Function = function(Game_ID)
    for Table, Value in pairs(Tables["Supported_GameIds"]) do
        if Value == Game_ID then
            if Value and Game_ID == Tables["Supported_GameIds"][1] then
                --- {Objects}>
                local Main_Window = UI_Lib:CreateWindow({
                    Name = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"].Version .."] | Prison-Life",
                    LoadingTitle = "Loading Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"].Version .."], Please Wait...",
                    LoadingSubtitle = "By Xamenia#2020 | Xamenia_Official",

                    --- {Saving Settings}>
                    ConfigurationSaving = {
                        Enabled = true,
                        FolderName = "ProtoSmasher - Configs",
                        FileName = "SavedDatas"
                    },

                    Discord = {
                        Enabled = false,
                        Invite = "No Invite",
                        RememberJoins = true
                    },

                    ---> {Key System}>
                    KeySystem = true,

                    KeySettings = {
                        Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"].Version .."]",
                        Subtitle = "Key System",
                        Note = "Join Our Discord: https://discord.gg/bwweNSzkJe",
                        FileName = "AccessKey",
                        SaveKey = false,
                        GrabKeyFromSite = false,
                        Key = Tables["Datas"]["RegisteredUsers"][tostring(User_HWID)].UserDatas.LoginKey
                    }
                })

                --- {Debug}>
                UI_Lib:Notify({
                    Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | (Debug) Notification",
                    Content = "Please Ignore This, Current Executor: [".. tostring(UserExecutor) .."].",
                    Duration = 3.5,
                    Image = 4483362458,

                    Actions = {
                        Ignore = {
                            Name = "Ignore!",

                            Callback = function()

                            end
                        },
                    },
                })

                --- {Objects[2]}>
                local Workspace_Remotes = Workspace_Service.Remote

                --- {Tabs}>
                local Home_Tab = Main_Window:CreateTab("Home", 4034483344)
                local Client_Tab = Main_Window:CreateTab("Client", 470645116)
                local Server_Tab = Main_Window:CreateTab("Server", 9432858523)
                local Updates_Tab = Main_Window:CreateTab("Updates", 7546954294)
                local Settings_Tab = Main_Window:CreateTab("Settings", 7059346373)

                --- {Labels}>
                local Guns_Label = Server_Tab:CreateLabel("Guns | Giver")
                local TPLoc_Label = Client_Tab:CreateLabel("TP | Locations")

                --- {Paragraph}>
                local Update_2 = Updates_Tab:CreateParagraph({
                    Title = "Update 2",
                    Content = [[
                    * Fixed Tabs Overflow If There Was Too Many,
                    * Fixed The Notification Blur Problem,
                    * Several Bugs Fixes.
                ]]
                })

                local Update_3 = Updates_Tab:CreateParagraph({
                    Title = "Update 3",
                    Content = [[
                    * Key System Has Been Created,
                    * Intro / Loading Screen Are Now Fixed And Working,
                    * Several Bugs Fixes And Anhancements.
                ]]
                })

                local Update_4 = Updates_Tab:CreateParagraph({
                    Title = "Update 4",
                    Content = [[
                    * Configuration System Has Been Created,
                    * Bug Fixes And Enhancements.
                ]]
                })

                local Update_41 = Updates_Tab:CreateParagraph({
                    Title = "Update 4.1",
                    Content = [[
                    * Introducing Secure Mode,
                    * Secure Mode Is Now Fixed And Undetected.
                ]]
                })

                local Update_42 = Updates_Tab:CreateParagraph({
                    Title = "Update 4.2",
                    Content = [[
                    * Secure Mode Has Been Fixed,
                    * Toggles Are Now Instant.
                ]]
                })

                local Update_5 = Updates_Tab:CreateParagraph({
                    Title = "Update 5",
                    Content = [[
                    * Tabs Now Support Icons,
                    * Built-In Error Handler.
                    * Bug Fixes And Enhancements.
                ]]
                })

                local Update_51 = Updates_Tab:CreateParagraph({
                    Title = "Update 5.1",
                    Content = [[
                    * Toggles Now Support Loops,
                    * Sliders Has Been Fixed,
                    * Tabs Has Been Fixed
                    * Bug Fixes And Enhancements.
                ]]
                })

                local Update_6 = Updates_Tab:CreateParagraph({
                    Title = "Update 6",
                    Content = [[
                    * Improved Tabs UI,
                    * KeySystem Is Now More Secure,
                    * Tabs Has Been Fixed,
                    * Others Bug Fixes And Enhancements.
                ]]
                })

                local Update_7 = Updates_Tab:CreateParagraph({
                    Title = "Update 7",
                    Content = [[
                    * Themes Framework Is Being Worked On,
                    * Notifications Have Now An Button,
                    * Configuration System Has Been Fixed,
                    * Flags Has Been Fixed,
                    * Others Bug Fixes And More Enhancements.
                ]]
                })

                --- {DropDowns}>
                local Dropdown_1 = Server_Tab:CreateDropdown({
                    Name = "Guns",
                    Options = {"M9", "AK-47", "Remington 870", "M4A1"},
                    CurrentOption = "None",

                    Callback = function(Option)
                        --- {Objects}>
                        local Choosed_Gun = Workspace_Service["Prison_ITEMS"].giver[Option].ITEMPICKUP
                        local Gun_Event = Workspace_Remotes.ItemHandler
                        local User_Backpack = Current_User.Backpack	

                        --- {Check}>
                        if User_Backpack:FindFirstChild(Option) then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "Oops! The Gun: [".. Option .."], Is Already In Your Inventory.",
                                Duration = 3.5,
                                Image = 8990250029,
            
                                Actions = {
                                    Ignore = {
                                        Name = "Alright!",
            
                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                        else
                            if Option == "M4A1" then
                                if _G.Checked_GamePasses then
                                    Gun_Event:InvokeServer(Choosed_Gun)
                                else
                                    UI_Lib:Notify({
                                        Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                        Content = "Checking GamePass For: [".. Option .."], Please Wait...",
                                        Duration = 3.5,
                                        Image = 6011908712,
                                    })
                                    task.wait(3.5)

                                    local Success, Result = pcall(function()
                                        return Market_Service:UserOwnsGamePassAsync(Current_User.UserId, 96651)
                                    end)

                                    if Success then
                                        _G.Checked_GamePasses = true
                                        Gun_Event:InvokeServer(Choosed_Gun)
                                    else
                                        UI_Lib:Notify({
                                            Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                            Content = "Oops! Look Like You Doesn't Own This GamePass: [Riot Police Access].",
                                            Duration = 3.5,
                                            Image = 8990250029,
                                            
                                            Options = {
                                                Ignore = {
                                                    Name = "Alright!",

                                                    Callback = function()
                                                        
                                                    end
                                                },
                                            },
                                        })
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
                        local User_Backpack = Current_User.Backpack

                        -- {Variables}>
                        local Gun_Module = nil
                        local IsModed = nil

                        --- {Check}>
                        if User_Backpack:FindFirstChild(Option) then
                            Gun_Module = require(User_Backpack[Option].GunStates)
                        elseif User_Character:FindFirstChild(Option) then
                            Gun_Module = require(User_Character[Option].GunStates)
                        else
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "Oops! Look Like You Doesn't Have This Gun: [".. Option .."].",
                                Duration = 3.5,
                                Image = 8990250029,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",

                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                        end

                        --- {Check Module}>
                        if Gun_Module ~= nil then
                            IsModed = true

                            if Option ~= "Remington 870" then
                                Gun_Module["MaxAmmo"] = math.huge
                                Gun_Module["CurrentAmmo"] = math.huge
                                Gun_Module["StoredAmmo"] = math.huge
                                Gun_Module["FireRate"] = 0.0000000000000000001
                                Gun_Module["Spread"] = 0
                                Gun_Module["Range"] = math.huge
                                Gun_Module["Bullets"] = 3
                                Gun_Module["ReloadTime"] = 0.0000000000000000001
                                Gun_Module["AutoFire"] = true
                            else
                                Gun_Module["MaxAmmo"] = math.huge
                                Gun_Module["CurrentAmmo"] = math.huge
                                Gun_Module["StoredAmmo"] = math.huge
                                Gun_Module["FireRate"] = 0.0000000000000000001
                                Gun_Module["Spread"] = 0
                                Gun_Module["Range"] = math.huge
                                Gun_Module["Bullets"] = 1
                                Gun_Module["ReloadTime"] = 0.0000000000000000001
                                Gun_Module["AutoFire"] = true
                            end
                        elseif Gun_Module ~= nil and IsModed then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "Oops! Look Like The Gun: [".. Option .."], Is Arleady Moded!",
                                Duration = 3.5,
                                Image = 8990250029,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",

                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                        end
                    end,
                })

                local Dropdown_3 = Client_Tab:CreateDropdown({
                    Name = "Locations",
                    Options = {"Criminal Base", "Prison"},
                    CurrentOption = "None",

                    Callback = function(Option)
                        if Option ~= "None" then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "Oops! This Feature Is Coming Soon!",
                                Duration = 3.5,
                                Image = 6594776234,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",

                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                        end
                    end,
                })

                local Dropdown_4 = Server_Tab:CreateDropdown({
                    Name = "Teams",
                    Options = {"Criminal", "Police", "Prisoner", "Neutral 1", "Neutral 2"},
                    CurrentOption = "None",

                    Callback = function(Option)
                        if Option == "Criminal" then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "Oops! This Team Is Being Worked On!",
                                Duration = 3.5,
                                Image = 6594776234,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",

                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
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
                    CurrentValue = User_Humanoid.WalkSpeed,

                    Callback = function(Value)
                        if User_Humanoid then
                            User_Humanoid.WalkSpeed = Value
                        end
                    end,
                })

                local JumpPower_Slider = Client_Tab:CreateSlider({
                    Name = "JumpPower",
                    Range = {0, 250},
                    Increment = 1,
                    Suffix = "JumpPower",
                    CurrentValue = User_Humanoid.JumpPower,

                    Callback = function(Value)
                        if User_Humanoid then
                            User_Humanoid.JumpPower = Value
                        end
                    end,
                })

                --- {TextBoxs}>
                local HipHeight = Client_Tab:CreateInput({
                    Name = "HipHeight",
                    PlaceholderText = "Enter The Hip-Height You Want.",
                    RemoveTextAfterFocusLost = true,

                    Callback = function(Text)
                        if User_Humanoid then
                            User_Humanoid.HipHeight = Text
                        end
                    end,
                })

                --- {Toggles}>
                local AntiTaze_Toggle = Server_Tab:CreateToggle({
                    Name = "Anti-Taze",
                    CurrentValue = false,
                    Flag = "AntiTaze_Toggle",
                    Save = true,

                    Callback = function(Value)
                        if Value then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification (Anti-Taze)",
                                Content = "This Feature Is In Experimental! Not Working? Contact Me With Discord!",
                                Duration = 3.5,
                                Image = 11353098069,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Copy Discord!",

                                        Callback = function()
                                            setclipboard("Lanna#1660")
                                        end
                                    },
                                },
                            })

                            while task.wait(0.05) do
                                if not Value then
                                    User_Character.ClientInputHandler.Disabled = false
                                else
                                    User_Character.ClientInputHandler.Disabled = true
                                end
                            end
                        else
                            User_Character.ClientInputHandler.Disabled = false

                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification (Anti-Taze)",
                                Content = "This Feature Has Successfully Been Disabled!",
                                Duration = 3.5,
                                Image = 9754130800,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",

                                        Callback = function()

                                        end
                                    },
                                },
                            })
                        end
                    end,
                })

                local AntiOwner_Toggle = Home_Tab:CreateToggle({
                    Name = "Anti-Owner",
                    CurrentValue = false,
                    Flag = "AntiOwner_Toggle",
                    Save = true,

                    Callback = function(Value)
                        if Value then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification (Anti-Owner)",
                                Content = "This Feature Has Successfully Been Enabled!",
                                Duration = 3.5,
                                Image = 9754130800,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",

                                        Callback = function()

                                        end
                                    },
                                },
                            })

                            while task.wait(0.5) do
                                --- {Functions}>
                                local OnPlayerJoined_Function = function(Player)
                                    if Player.UserId == game.CreatorId then
                                        UI_Lib:Notify({
                                            Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification (Anti-Owner)",
                                            Content = "The Owner Has Been Detected, Please Wait...",
                                            Duration = 3.5,
                                            Image = 10885637368,
                                            
                                            Options = {
                                                Ignore = {
                                                    Name = "Alright!",
            
                                                    Callback = function()
            
                                                    end
                                                },
                                            },
                                        })
                                        task.wait(0.5)

                                        Current_Player:Kick("Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | (Anti-Owner)> The Owner Of The Game Has Been Detected, We Had To Kick You.")
                                    end
                                end

                                if Value then
                                    Players_Service.PlayerAdded:Connect(OnPlayerJoined_Function)
                                end
                            end
                        else
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification (Anti-Owner)",
                                Content = "This Feature Has Successfully Been Disabled!",
                                Duration = 3.5,
                                Image = 9754130800,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",

                                        Callback = function()

                                        end
                                    },
                                },
                            })
                        end
                    end,
                })

                local SecureMode_Toggle = Settings_Tab:CreateToggle({
                    Name = "Secure Mode",
                    CurrentValue = false,
                    Flag = "SecureMode_Toggle",
                    Save = true,

                    Callback = function(Value)
                        if Value then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification (Secure-Mode)",
                                Content = "Warning! This Feature Might Be Glitchy Are You Sure To Enable It?",
                                Duration = 3.5,
                                Image = 5866567127,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Enable It!",

                                        Callback = function()
                                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Xamenia-OfficialHD/Proton-Solar-V4.1-BETA/main/Main-File.Lua"), true)()
                                        end
                                    },
                                },
                            })
                        else
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification (Secure-Mode)",
                                Content = "This Feature Has Successfully Been Disabled!",
                                Duration = 3.5,
                                Image = 9754130800,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",

                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                        end
                    end,
                })

                --- {Buttons}>
                local FreeGamePasses_Button = Server_Tab:CreateButton({
                    Name = "Free GamePasses",

                    Callback = function()
                        UI_Lib:Notify({
                            Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                            Content = "This Feature Has Been Patched!",
                            Duration = 3.5,
                            Image = 5866567127,
                            
                            Options = {
                                Ignore = {
                                    Name = "Alright!",

                                    Callback = function()
                                        
                                    end
                                },
                            },
                        })
                    end,
                })

                local Crash_Button = Home_Tab:CreateButton({
                    Name = "Crash Server",

                    Callback = function()
                        --- {Objects}>
                        local Gun_Event = Workspace_Remotes.ItemHandler

                        UI_Lib:Notify({
                            Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                            Content = "This Feature Will Crash The Whole Server (You Too) Are You Sure To Enable It ?",
                            Duration = 3.5,
                            Image = 5866567127,
                            
                            Options = {
                                Ignore = {
                                    Name = "Crash The Server!",
    
                                    Callback = function()
                                        --- {Objects}>
                                        local Current_User = Current_User.Name
                                        local User_Backpack = Current_User.Backpack
                                        local Shoot_REvent = REvents_Service.ShootEvent
                
                                        --- {Variables}>
                                        local Required_Gun = "Remington 870"
                
                                        --- {Check}>
                                        if User_Backpack:FindFirstChild(Required_Gun) then
                                            for Index, Value in pairs(User_Backpack:GetChildren()) do
                                                if Value.Name == Required_Gun then
                                                    Value.Parent = User_Character
                                                end
                                            end
                
                                            --- {Finish}>
                                            Required_Gun = User_Character[Required_Gun]
                                            User_Humanoid:UnequipTools()
                
                                            --- {Functions}>
                                            local Crash_Function = function(Target)
                                                coroutine.resume(coroutine.create(function()
                                                    --- {Tables}>
                                                    local NewBullets_Table = {}
                
                                                    table.insert(NewBullets_Table, {
                                                        Hit = Target,
                                                        Distance = 100,
                                                        Cframe = CFrame.new(0, 1, 1),
                                                        RayObject = Ray.new(Vector3.new(0.1, 0.2), Vector3.new(0.3, 0.4))
                                                    })
                
                                                    Shoot_REvent:FireServer(NewBullets_Table, Required_Gun)
                                                    task.wait()
                                                end))
                                            end
                
                                            while Run_Service.Stepped:Wait() do
                                                for Number = 0, 10, 0 do
                                                    Crash_Function()
                                                end
                                            end
                                        else
                                            UI_Lib:Notify({
                                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                                Content = "The Required Gun: [".. Required_Gun .."] Isn't In Your Inventory!",
                                                Duration = 3.5,
                                                Image = 8990250029,
                                                
                                                Options = {
                                                    Ignore = {
                                                        Name = "Get It!",
                    
                                                        Callback = function()
                                                            Gun_Event:InvokeServer(Required_Gun)
                                                        end
                                                    },
                                                },
                                            })
                                        end
                                    end
                                },
                            },
                        })
                    end,
                })

                local JoinSmallest_Button = Home_Tab:CreateButton({
                    Name = "Join Smallest Server",

                    Callback = function()
                        UI_Lib:Notify({
                            Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                            Content = "Joining The Smallest Server, Please Wait...",
                            Duration = 3.5,
                            Image = 5614678317,
                            
                            Options = {
                                Ignore = {
                                    Name = "Alright!",

                                    Callback = function()
                                        
                                    end
                                },
                            },
                        })
                        task.wait(3.5)

                        --- {Functions}>
                        local ListServers_Function = function(Cursor)
                            --- {Variables}>
                            local Raw = game:HttpGet(Tables["Game_Infos"]["Server"].. ((Cursor and "&cursor=".. Cursor) or ""))

                            return Http_Service:JSONDecode(Raw)
                        end

                        local Server, Next; repeat
                            --- {Variables}>
                            local Servers = ListServers_Function(Next)
                            Server = Servers.data[1]
                            Next = Servers.nextPageCursor
                        until Server

                        if Server then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "You Are Successfully Being Teleported, Please Wait...",
                                Duration = 3.5,
                                Image = 9754130800,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",
    
                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                            task.wait(0.5)

                            TP_Service:TeleportToPlaceInstance(Tables["Game_Infos"]["Place_Id"], Server.id, Current_Player)
                        else
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "Oops! There Was An Error While Teleporting You!",
                                Duration = 3.5,
                                Image = 8990250029,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",
    
                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                        end
                    end,
                })

                local LoadAdmin_Button = Home_Tab:CreateButton({
                    Name = "Load ProtoSmasher Admin",

                    Callback = function()
                        local Success, Error = pcall(function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Xamenia-OfficialHD/Proton-Solar-V4.1-BETA/main/PrisonLife_Admin.Lua"), true)()
                            task.wait(3.5)
                        end)

                        if Success then
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "ProtoSmasher Admin Has Successfully Been Loaded!",
                                Duration = 3.5,
                                Image = 9754130800,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",
    
                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                        else
                            UI_Lib:Notify({
                                Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | Notification",
                                Content = "Oops! There Was An Error While Trying To Load ProtoSmasher Admin!",
                                Duration = 3.5,
                                Image = 8990250029,
                                
                                Options = {
                                    Ignore = {
                                        Name = "Alright!",
    
                                        Callback = function()
                                            
                                        end
                                    },
                                },
                            })
                        end
                    end,
                })

            elseif Value and Game_ID == Tables["Supported_GameIds"][2] then
                --- {Objects}>
                local Main_Window = UI_Lib:CreateWindow({
                    Name = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"].Version .."] | Bully-Roleplay",
                    LoadingTitle = "Loading Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"].Version .."], Please Wait...",
                    LoadingSubtitle = "By Xamenia#2020 | Xamenia_Official",

                    --- {Saving Settings}>
                    ConfigurationSaving = {
                        Enabled = true,
                        FolderName = nil,
                        FileName = "SavedDatas"
                    },

                    Discord = {
                        Enabled = false,
                        Invite = "No Invite",
                        RememberJoins = true
                    },

                    ---> {Key System}>
                    KeySystem = true,

                    KeySettings = {
                        Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"].Version .."]",
                        Subtitle = "Key System",
                        Note = "Join Our Discord: https://discord.gg/bwweNSzkJe",
                        FileName = "AccessKey",
                        SaveKey = false,
                        GrabKeyFromSite = false,
                        Key = Tables["Datas"]["RegisteredUsers"][tostring(User_HWID)].UserDatas.LoginKey
                    }
                })

                --- {Debug}>
                UI_Lib:Notify({
                    Title = "Proto-Smasher [V".. Tables["Datas"]["ProtoSmasher_Datas"]["Version"] .. "] | (Debug) Notification",
                    Content = "Please Ignore This, Current Executor: [".. tostring(UserExecutor) .."].",
                    Duration = 3.5,
                    Image = 4483362458,

                    Actions = {
                        Ignore = {
                            Name = "Alright!",
                            Callback = function() end
                        },
                    },
                })

                --- {Tabs}>
                local Home_Tab = Main_Window:CreateTab("Home", 4034483344)
                local Client_Tab = Main_Window:CreateTab("Client", 470645116)
                local Server_Tab = Main_Window:CreateTab("Server", 9432858523)
                local Updates_Tab = Main_Window:CreateTab("Updates", 7546954294)
                local Settings_Tab = Main_Window:CreateTab("Settings", 7059346373)
            end
        end
    end
end

local CheckUserDatas_Function = function()
    --- {Check User Status}>
    if Tables["Datas"]["RegisteredUsers"][tostring(User_HWID)] then
        if Tables["Datas"]["RegisteredUsers"][tostring(User_HWID)].UserStatus.BlackListed == true then
            UI_Lib:Destroy()
            Current_User:Kick("[Whitelist - Error]> 0x02")
        else
            LoadProtoSmasher_Function(game.PlaceId)
        end
    else
        UI_Lib:Destroy()
        Current_User:Kick("[Whitelist - Error]> 0x01")
    end
end

local CheckProtoDatas_Function = function()
    --- {Check Version}>
    if Tables["Datas"]["ProtoSmasher_Datas"].Patched == true then
        UI_Lib:Destroy()
        Current_User:Kick("[Status - Error]> ProtoSmasher Is Currently Patched, Please Wait Until I UnPatch It.")
    else
        if Tables["Datas"]["ProtoSmasher_Datas"].Updated == true then
            return CheckUserDatas_Function()
        else
            UI_Lib:Destroy()
            Current_User:Kick("[Status - Error]> ProtoSmasher Is Currently OutDated, Please Wait Until I Update It.")
        end
    end
end

--- {Call Functions}>
UI_Lib:LoadConfiguration()
CheckProtoDatas_Function()
