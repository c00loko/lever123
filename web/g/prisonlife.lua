-------------lever script
----------game prison life
--------website: c00loko.github.io/lever123/web/


if game.PlaceId == 155615604 then
    local function GetPos()
        return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end

    local function GetCamPos()
        return workspace.CurrentCamera.CFrame
    end

    local function GetTeam()
        return game.Players.LocalPlayer.TeamColor.Name
    end

    local function Kill(Player)
        pcall(function()
            if Player.Character:FindFirstChild("ForceField") or not workspace:FindFirstChild(Player.Name) or not workspace:FindFirstChild(Player.Name):FindFirstChild("Head") or Player == nil or Player.Character.Parent ~= workspace then return end
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)

            local MyTeam = GetTeam()
            if Player.TeamColor.Name == game.Players.LocalPlayer.TeamColor.Name then
                local savedcf = GetPos()
                local savedcamcf = GetCamPos()
                workspace.Remote.loadchar:InvokeServer(nil, BrickColor.random().Name)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
                workspace.CurrentCamera.CFrame = savedcamcf
                workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
            end

            local Gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")

            local FireEvent = {
                [1] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [2] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [3] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [4] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [5] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [6] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [7] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [8] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }
            }

            game:GetService("ReplicatedStorage").ShootEvent:FireServer(FireEvent, Gun)
            Gun.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character["Remington 870"]:Destroy()
        end)
    end


    local function givebtools(bt,plr)
        H = Instance.new("HopperBin", plr.Backpack)
        H.BinType = bt
    end

    local BuyGamepass = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(tonumber((
        game:GetService("Players").LocalPlayer.CharacterAppearance):split('=')
        [#((game:GetService("Players").LocalPlayer.CharacterAppearance):split('=')
    )]), 96651)

    local Material = loadstring(game:HttpGet("https://c00loko.github.io/lever123/web/ui.lua"))()

    local UI = Material.Load({
        Title = "Lever123 | Prison Life",
        Style = 1,
        SizeX = 500,
        SizeY = 400,
        Theme = "Dark",
        ColorOverrides = {
            MainFrame = Color3.fromRGB(60,60,60)
        }
    })

    local Page = UI.New({
        Title = "Kill"
    })

    local Page1 = UI.New({
        Title = "Loop Kill"
    })

    local Page2 = UI.New({
        Title = "LocalPlayer"
    })

    local Page3 = UI.New({
        Title = "Workspace"
    })

    local Page4 = UI.New({
        Title = "Credits"
    })

    Page.Button({
        Text = "Kill All",
        Callback = function()
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    Kill(v)
                end
            end  
        end
    })

    Page.Button({
        Text = "Kill Inmates",
        Callback = function()
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Bright orange" then
                        Kill(v)
                    end
                end
            end 
        end
    })

    Page.Button({
        Text = "Kill Guards",
        Callback = function()
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Bright blue" then
                        Kill(v)
                    end
                end
            end
        end
    })

    Page.Button({
        Text = "Kill Criminals",
        Callback = function()
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Really red" then
                        Kill(v)
                    end
                end
            end
        end
    })

    _G.loopkillall = false;
    Page1.Toggle({
        Text = "Loop Kill All",
        Callback = function(value)
            _G.loopkillall = value
        end,
        Enabled = false
    })

    _G.loopkillinmates = false;
    Page1.Toggle({
        Text = "Loop Kill Inmates",
        Callback = function(value)
            _G.loopkillinmates = value
        end,
        Enabled = false
    })

    _G.loopkillguards = false;
    Page1.Toggle({
        Text = "Loop Kill Guards",
        Callback = function(value)
            _G.loopkillguards = value
        end,
        Enabled = false
    })

    _G.loopkillcriminals = false;
    Page1.Toggle({
        Text = "Loop Kill Criminals",
        Callback = function(value)
            _G.loopkillcriminals = value
        end,
        Enabled = false
    })

    Page2.Slider({
        Text = "Walkspeed",
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end,
        Min = 16,
        Max = 200,
        Def = 16
    })

    Page2.Slider({
        Text = "Jumppower",
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        end,
        Min = 50,
        Max = 500,
        Def = 50
    })

    Page2.Button({
        Text = "BTools",
        Callback = function()
            for i=2,4 do
                givebtools(i,game.Players.LocalPlayer)
            end
        end
    })

    Page2.Button({
        Text = "Give All Guns",
        Callback = function()
            if BuyGamepass then
                game.Workspace.Remote.ItemHandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
                game.Workspace.Remote.ItemHandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP)
                game.Workspace.Remote.ItemHandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
                game.Workspace.Remote.ItemHandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
            else
                game.Workspace.Remote.ItemHandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
                game.Workspace.Remote.ItemHandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
                game.Workspace.Remote.ItemHandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
            end
        end
    })


    Page2.Button({
        Text = "Invisible",
        Callback = function()
            local player = game.Players.LocalPlayer
            position     = player.Character.HumanoidRootPart.Position
            wait(0.1)
            player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
            wait(0.1)
            humanoidrootpart = player.Character.HumanoidRootPart:clone()
            wait(0.1)
            player.Character.HumanoidRootPart:Destroy()
            humanoidrootpart.Parent = player.Character
            player.Character:MoveTo(position)
            wait()
            game.Players.LocalPlayer.Character.Torso.Transparency = 1
            game.Players.LocalPlayer.Character.Head.Transparency  = 1
            game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
            game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1
            game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
            game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
            game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
            game.Players.LocalPlayer.Character.Head.face:Remove()
        end
    })

    Page2.Button({
        Text = "SuperPunch",
        Callback = function()
            mainRemotes = game.ReplicatedStorage meleeRemote = mainRemotes['meleeEvent'] mouse = game.Players.LocalPlayer:GetMouse() punching = false cooldown = false function punch() cooldown = true local part = Instance.new("Part", game.Players.LocalPlayer.Character) part.Transparency = 1 part.Size = Vector3.new(5, 2, 3) part.CanCollide = false local w1 = Instance.new("Weld", part) w1.Part0 = game.Players.LocalPlayer.Character.Torso w1.Part1 = part w1.C1 = CFrame.new(0,0,2) part.Touched:connect(function(hit) if game.Players:FindFirstChild(hit.Parent.Name) then local plr = game.Players:FindFirstChild(hit.Parent.Name) if plr.Name ~= game.Players.LocalPlayer.Name then part:Destroy() for i = 1,100 do meleeRemote:FireServer(plr) end end end end) wait(1) cooldown = false part:Destroy() end mouse.KeyDown:connect(function(key) if cooldown == false then if key:lower() == "f" then punch() end end end)
        end
    })

    Page3.Button({
        Text = "Destroy Doors",
        Callback = function() 
            game.Workspace.Doors:Destroy();
        end
    })


    Page4.Button({
        Text = "Scripter: c00loko#1628",
        Callback = function() print("c00loko#1628") end
    })

    Page4.Button({
        Text = "Website: c00loko.github.io/lever123/web",
        Callback = function() print("c00loko.github.io/lever123/web") end
    })

    while true do
        wait(0.1)
        if _G.loopkillall == true then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    Kill(v)
                end
            end  
        end
        if _G.loopkillinmates == true then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Bright orange" then
                        Kill(v)
                    end
                end
            end 
        end
        if _G.loopkillguards == true then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Bright blue" then
                        Kill(v)
                    end
                end
            end
        end
        if _G.loopkillcriminals == true then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Really red" then
                        Kill(v)
                    end
                end
            end
        end
    end
end
