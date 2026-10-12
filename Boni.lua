
-- BONI HUB | Interface inicial
-- Versão visual para teste no Roblox Studio

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("BoniHub")
if old then
    old:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "BoniHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 390)
main.Position = UDim2.new(0.5, -150, 0.5, -195)
main.BackgroundColor3 = Color3.fromRGB(20, 15, 32)
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(160, 70, 255)
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 48)
title.BackgroundColor3 = Color3.fromRGB(90, 35, 160)
title.Text = "BONI HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = main

local function makeButton(text, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -24, 0, 38)
    button.Position = UDim2.new(0, 12, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(48, 35, 67)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.TextScaled = true
    button.Font = Enum.Font.Gotham
    button.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    button.Activated:Connect(callback)
    return button
end

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -24, 0, 28)
status.Position = UDim2.new(0, 12, 0, 55)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(210, 180, 255)
status.Text = "Auto Eggs: DESLIGADO"
status.TextScaled = true
status.Parent = main

local enabled = false

makeButton("LIGAR / DESLIGAR", 88, function()
    enabled = not enabled
    status.Text = enabled and
        "Auto Eggs: LIGADO (visual)" or
        "Auto Eggs: DESLIGADO"
end)

local rarities = {
    "Comum", "Incomum", "Raro", "Épico", "Lendário",
    "Mítico", "Cósmico", "Secreto", "Eterno", "Divino"
}

local selected = 1

makeButton("Raridade: " .. rarities[selected], 136, function()
    selected = selected % #rarities + 1
end).Activated:Connect(function()
    -- A seleção será atualizada no próximo passo.
end)

local area = 1

makeButton("Área: 1", 184, function()
    area = area % 9 + 1
end)

makeButton("FECHAR PAINEL", 232, function()
    gui:Destroy()
end)

local note = Instance.new("TextLabel")
note.Size = UDim2.new(1, -20, 0, 65)
note.Position = UDim2.new(0, 10, 0, 285)
note.BackgroundTransparency = 1
note.TextColor3 = Color3.fromRGB(190, 175, 210)
note.TextWrapped = true
note.TextScaled = true
note.Text = "Interface inicial de teste. Automação ainda não configurada."
note.Parent = main

