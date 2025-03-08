print("Script CDID Created By N4tzzSquadCommunity")
warn("Anti afk running")

-- Progress Bar di Developer Console dengan animasi lebih smooth
for i = 10, 100, 10 do
    print("N4tzzHub | Loading Assets... [✅" .. i .. "%]")
    wait(0.1)  -- Lebih cepat dan lebih smooth
end

-- UI Loading Screen dengan animasi halus
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
textLabel.TextSize = 60
textLabel.TextStrokeTransparency = 0.5

subTextLabel.Parent = frame
subTextLabel.Text = "Welcome"
subTextLabel.Size = UDim2.new(0.5, 0, 0.05, 0)
subTextLabel.Position = UDim2.new(0.25, 0, 0.5, 0)
subTextLabel.TextColor3 = Color3.new(1, 1, 1)
subTextLabel.TextSize = 30
subTextLabel.TextStrokeTransparency = 0.5

wait(2)
screenGui:Destroy()

-- Key System UI
local keyScreen = Instance.new("ScreenGui")
local keyFrame = Instance.new("Frame")
local keyTextBox = Instance.new("TextBox")
local submitButton = Instance.new("TextButton")

keyScreen.Parent = game.CoreGui
keyFrame.Parent = keyScreen
keyFrame.Size = UDim2.new(0.3, 0, 0.3, 0)
keyFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
keyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local corner = Instance.new("UICorner")
corner.Parent = keyFrame
corner.CornerRadius = UDim.new(0, 15)

keyTextBox.Parent = keyFrame
keyTextBox.Size = UDim2.new(0.8, 0, 0.3, 0)
keyTextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
keyTextBox.PlaceholderText = "Enter Key Here"
keyTextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
keyTextBox.TextColor3 = Color3.new(1, 1, 1)

submitButton.Parent = keyFrame
submitButton.Text = "Submit"
submitButton.Size = UDim2.new(0.8, 0, 0.3, 0)
submitButton.Position = UDim2.new(0.1, 0, 0.6, 0)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)

local correctKey = "nz-key_A8sJ2SJ3wO3jDS3Ods8J2H2Ka9"

submitButton.MouseButton1Click:Connect(function()
    if keyTextBox.Text == correctKey then
        keyScreen:Destroy()
        print("Key Accepted! Access Granted.")
    else
        warn("Invalid Key! Access Denied.")
    end
end)

-- Fitur Tambahan: Notifikasi jika key salah
local errorLabel = Instance.new("TextLabel")
errorLabel.Parent = keyFrame
errorLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
errorLabel.Position = UDim2.new(0.1, 0, 0.9, 0)
errorLabel.TextColor3 = Color3.new(1, 0, 0)
errorLabel.Text = "Invalid Key!"
errorLabel.Visible = false

submitButton.MouseButton1Click:Connect(function()
    if keyTextBox.Text ~= correctKey then
        errorLabel.Visible = true
        wait(2)
        errorLabel.Visible = false
    end
end)

-- Frame Control Panel (UI lebih menarik dengan animasi smooth)
local controlPanel = Instance.new("ScreenGui")
local controlFrame = Instance.new("Frame")
local toggleButton = Instance.new("TextButton")

controlPanel.Parent = game.CoreGui
controlFrame.Parent = controlPanel
controlFrame.Size = UDim2.new(0.35, 0, 0.6, 0)
controlFrame.Position = UDim2.new(0.325, 0, 0.2, 0)
controlFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
controlFrame.BorderSizePixel = 0

local corner = Instance.new("UICorner")
corner.Parent = controlFrame
corner.CornerRadius = UDim.new(0, 15)

toggleButton.Parent = controlPanel
toggleButton.Text = "Open Control Panel"
toggleButton.Size = UDim2.new(0.12, 0, 0.05, 0)
toggleButton.Position = UDim2.new(0.44, 0, 0.9, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)

toggleButton.MouseButton1Click:Connect(function()
    controlFrame.Visible = not controlFrame.Visible
end)

controlFrame.Visible = false

-- Fitur Tambahan
local example = Instance.new("TextLabel")
example.Parent = controlFrame
example.Text = "Auto Farm Barista"
example.Size = UDim2.new(0.8, 0, 0.05, 0)
example.Position = UDim2.new(0.1, 0, 0.1, 0)
example.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
example.TextColor3 = Color3.new(1, 1, 1)
example.TextSize = 20

example.MouseButton1Click:Connect(function()
    while true do
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
