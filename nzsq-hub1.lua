print("Script CDID Created By N4tzzSquadCommunity")
warn("Anti afk running")
local key = "nzsqkey_72Hs92Ks92uJs82Sj2oS26N2L16aD82JaoD2"
local inputKey = game:GetService("Players").LocalPlayer:Prompt("Please enter the key to continue")

if inputKey ~= key then
    warn("Invalid key! Access denied.")
    game:Shutdown()  -- This will shut down the game if the key is invalid
    return
end

-- GUI Setup
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/ui%20libs2"))()

local example = library:CreateWindow({ text = "CDID" })

-- Menampilkan Logo saat execute
local logo = Instance.new("ScreenGui")
local img = Instance.new("ImageLabel")
logo.Parent = game.CoreGui
img.Parent = logo
img.Size = UDim2.new(0, 200, 0, 200)
img.Position = UDim2.new(0.5, -100, 0.2, 0)
img.Image = "https://avatars.githubusercontent.com/u/181945053?v=4"
wait(3)
logo:Destroy()

-- Fitur Auto Farm Barista
example:AddToggle("Auto Farm Barista", function(state)
    while state do
        wait(1)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local baristaJob = workspace.Etc.Job.Barista
            if baristaJob then
                -- Menyelesaikan proses barista otomatis (misalnya membuat kopi)
                fireproximityprompt(baristaJob.Prompt)
            end
        end
    end
end)

-- Fitur Auto Farm (Menangani pekerjaan lain seperti Trucker)
example:AddToggle("Auto Farm [Trucker]", function(state)
    getfenv().drive = (state and true or false)
    workspace.Gravity = 196
    if workspace.Map:findFirstChild("Prop") then
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
                wait()
                local prepos = workspace.Etc.Waypoint.Waypoint.Position
                repeat wait()
                    fireproximityprompt(workspace.Etc.Job.Truck.Starter.Prompt)
                until workspace.Etc.Waypoint.Waypoint.Position ~= prepos
            end
        end)
    end
end)

-- Fitur untuk menambah kecepatan kendaraan menjadi 1000
example:AddSlider("Speed Hack (Car)", 50, 1000, function(value)
    local car = game.Players.LocalPlayer.Character.Humanoid.SeatPart and game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent
    if car and car:FindFirstChild("VehicleSeat") then
        car.VehicleSeat.MaxSpeed = value
    end
end)

-- Anti AFK (Mencegah Anda terdisconnect karena AFK)
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

-- Unlimited Money (Uang bertambah 100 triliun, tapi hilang jika skrip dihapus)
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

-- Tombol Close GUI
example:AddButton("Close GUI", function()
    library.gui:Destroy()
end)

-- Anti Detected & Anti Ban
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

-- Menampilkan Logo saat execute (ini untuk memastikan logo muncul saat pertama kali)
local logo = Instance.new("ScreenGui")
local img = Instance.new("ImageLabel")
logo.Parent = game.CoreGui
img.Parent = logo
img.Size = UDim2.new(0, 200, 0, 200)
img.Position = UDim2.new(0.5, -100, 0.2, 0)
img.Image = "https://avatars.githubusercontent.com/u/181945053?v=4"
wait(3)
logo:Destroy()
