
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BoniHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local purple = Color3.fromRGB(170, 60, 255)
local dark = Color3.fromRGB(22, 18, 30)
local black = Color3.fromRGB(13, 12, 18)
local white = Color3.fromRGB(255, 255, 255)

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 300, 0, 340)
main.Position = UDim2.new(0.5, -150, 0.5, -170)
main.BackgroundColor3 = dark
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = purple
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 48)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "BONI HUB"
title.TextColor3 = purple
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 36, 0, 36)
close.Position = UDim2.new(1, -42, 0, 6)
close.BackgroundColor3 = black
close.Text = "X"
close.TextColor3 = white
close.TextSize = 18
close.Font = Enum.Font.GothamBold
close.Parent = main

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = close

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -65)
content.Position = UDim2.new(0, 10, 0, 55)
content.BackgroundColor3 = black
content.BorderSizePixel = 0
content.Parent = main

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = content

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -20, 0, 65)
info.Position = UDim2.new(0, 10, 0, 10)
info.BackgroundTransparency = 1
info.Text = "SWIM FOR EGGS"
info.TextColor3 = white
info.TextSize = 19
info.Font = Enum.Font.GothamBold
info.Parent = content

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 35)
status.Position = UDim2.new(0, 10, 0, 65)
status.BackgroundTransparency = 1
status.Text = "Boni Hub carregado!"
status.TextColor3 = purple
status.TextSize = 14
status.Font = Enum.Font.Gotham
status.Parent = content

local function createButton(text, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 42)
    button.Position = UDim2.new(0, 10, 0, y)
    button.BackgroundColor3 = dark
    button.Text = text
    button.TextColor3 = white
    button.TextSize = 15
    button.Font = Enum.Font.GothamBold
    button.Parent = content

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    local s = Instance.new("UIStroke")
    s.Color = purple
    s.Thickness = 1
    s.Parent = button

    button.Activated:Connect(callback)
    return button
end

createButton("INÍCIO", 110, function()
    status.Text = "Bem-vindo ao Boni Hub!"
end)

createButton("CONFIGURAÇÕES", 160, function()
    status.Text = "Configurações do painel"
end)

createButton("INFORMAÇÕES", 210, function()
    status.Text = "Boni Hub - Swim for Eggs"
end)

close.Activated:Connect(function()
    main.Visible = false
end)

local open = Instance.new("TextButton")
open.Name = "OpenBoniHub"
open.Size = UDim2.new(0, 110, 0, 42)
open.Position = UDim2.new(0, 15, 0.5, -21)
open.BackgroundColor3 = dark
open.Text = "ABRIR BONI"
open.TextColor3 = purple
open.TextSize = 14
open.Font = Enum.Font.GothamBold
open.Parent = gui

local openCorner = Instance.new("UICorner")
openCorner.CornerRadius = UDim.new(0, 10)
openCorner.Parent = open

local openStroke = Instance.new("UIStroke")
openStroke.Color = purple
openStroke.Thickness = 2
openStroke.Parent = open

open.Activated:Connect(function()
    main.Visible = true
end)
