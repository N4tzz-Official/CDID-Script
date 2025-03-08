print("Script CDID Created By N4tzzSquadCommunity")
warn("Anti afk running")

-- Progress Bar di Developer Console
for i = 10, 100, 10 do
    print("N4tzzHub | Loading Assets... [✅" .. i .. "%]")
    wait(0.5)
end

-- UI Loading Screen
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textLabel = Instance.new("TextLabel")
local subTextLabel = Instance.new("TextLabel")

screenGui.Parent = game.CoreGui
frame.Parent = screenGui
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)

textLabel.Parent = frame
textLabel.Text = "N4tzzHub"
textLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
textLabel.Position = UDim2.new(0.25, 0, 0.4, 0)
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextSize = 50

subTextLabel.Parent = frame
subTextLabel.Text = "Welcome"
subTextLabel.Size = UDim2.new(0.5, 0, 0.05, 0)
subTextLabel.Position = UDim2.new(0.25, 0, 0.5, 0)
subTextLabel.TextColor3 = Color3.new(1, 1, 1)
subTextLabel.TextSize = 30

wait(3)
screenGui:Destroy()

-- Frame Control Panel (Dapat Dibuka/Tutup)
local controlPanel = Instance.new("ScreenGui")
local controlFrame = Instance.new("Frame")
local toggleButton = Instance.new("TextButton")

controlPanel.Parent = game.CoreGui
controlFrame.Parent = controlPanel
controlFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
controlFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
controlFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)

toggleButton.Parent = controlPanel
toggleButton.Text = "Open Control Panel"
toggleButton.Size = UDim2.new(0.1, 0, 0.05, 0)
toggleButton.Position = UDim2.new(0.45, 0, 0.9, 0)
toggleButton.MouseButton1Click:Connect(function()
    controlFrame.Visible = not controlFrame.Visible
end)

controlFrame.Visible = false

-- Tambahkan semua fitur ke dalam control panel
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/ui%20libs2"))()
local example = library:CreateWindow({ text = "CDID" })

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

example:AddSlider("Speed Hack (Car)", 50, 1000, function(value)
    local car = game.Players.LocalPlayer.Character.Humanoid.SeatPart and game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent
    if car and car:FindFirstChild("VehicleSeat") then
        car.VehicleSeat.MaxSpeed = value
    end
end)

example:AddButton("Auto Collect Money", function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end)

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
