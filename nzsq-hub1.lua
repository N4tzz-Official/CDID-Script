-- CDID Script Modified By N4tzzSquadCommunity
print("Script CDID Created By N4tzzSquadCommunity")
warn("Anti afk running")

-- Key System for Access Control
local key = "nzsqkey_72Hs92Ks92uJs82Sj2oS26N2L16aD82JaoD2"
local inputKey = game:GetService("Players").LocalPlayer:Prompt("Please enter the key to continue")
if inputKey ~= key then
    warn("Invalid key! Access denied.")
    game:Shutdown()
    return
end

-- GUI Setup (Improved Design)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/ui%20libs2"))()
local example = library:CreateWindow({ text = "CDID - Enhanced Version" })

-- Visual Improvement
example:SetTheme("Dark")
example:EnableToggleUI(true)  -- Buka/Tutup fitur ditambahkan

-- Auto Farm Barista
example:AddToggle("Auto Farm Barista", function(state)
    while state do
        wait(1)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local baristaJob = workspace.Etc.Job.Barista
            if baristaJob then
                fireproximityprompt(baristaJob.Prompt)
            end
        end
    end
end)

-- Auto Farm Trucker
example:AddToggle("Auto Farm [Trucker]", function(state)
    getfenv().drive = state
    workspace.Gravity = 196
    if workspace.Map:FindFirstChild("Prop") then
        workspace.Map.Prop:Destroy()
    end
    while getfenv().drive do
        wait()
        pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil then
                game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Job:FireServer("Truck")
                wait(0.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Etc.Job.Truck.Starter.WorldPivot
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                wait(5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                repeat wait()
                    fireproximityprompt(workspace.Etc.Job.Truck.Starter.Prompt)
                until workspace.Etc.Waypoint.Waypoint.Position ~= workspace.Etc.Waypoint.Waypoint.Position
            end
        end)
    end
end)

-- Speed Hack
example:AddSlider("Speed Hack (Car)", 50, 1000, function(value)
    local car = game.Players.LocalPlayer.Character.Humanoid.SeatPart and game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent
    if car and car:FindFirstChild("VehicleSeat") then
        car.VehicleSeat.MaxSpeed = value
    end
end)

-- Anti AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
    warn("Anti AFK running")
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- Auto Collect Money
example:AddButton("Auto Collect Money", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end)

-- Unlimited Money
local unlimitedMoney = false
example:AddToggle("Unlimited Money", function(state)
    unlimitedMoney = state
    while unlimitedMoney do
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Money") then
            player.leaderstats.Money.Value = player.leaderstats.Money.Value + 100000000000000
        end
        wait(1)
    end
end)

-- Close GUI
example:AddButton("Close GUI", function()
    library.gui:Destroy()
end)

-- Bypass Anti-Cheat & Anti-Ban System
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if tostring(args[1]) == "BanPlayer" or tostring(args[1]) == "Kick" then
        return
    end
    return old(...)
end)
setreadonly(mt, true)
