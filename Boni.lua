
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "BoniHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local purple = Color3.fromRGB(170, 60, 255)
local dark = Color3.fromRGB(17, 17, 23)

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(300, 330)
main.Position = UDim2.new(0.5, -150, 0.5, -165)
main.BackgroundColor3 = dark

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 14)

local stroke = Instance.new("UIStroke", main)
stroke.Color = purple
stroke.Thickness = 2

local header = Instance.new("TextLabel", main)
header.Size = UDim2.new(1, -90, 0, 44)
header.Position = UDim2.fromOffset(12, 0)
header.BackgroundTransparency = 1
header.Text = "✦ BONI HUB"
header.TextColor3 = purple
header.TextSize = 21
header.Font = Enum.Font.GothamBold
header.TextXAlignment = Enum.TextXAlignment.Left

local function button(text, y)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(1, -28, 0, 40)
    b.Position = UDim2.fromOffset(14, y)
    b.BackgroundColor3 = Color3.fromRGB(35, 29, 45)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Text = text
    b.TextSize = 14
    b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = true
    Instance.new("UICorner", b).CornerRadius =
        UDim.new(0, 9)
    local s = Instance.new("UIStroke", b)
    s.Color = purple
    s.Thickness = 1
    return b
end

local close = Instance.new("TextButton", main)
close.Size = UDim2.fromOffset(32, 30)
close.Position = UDim2.new(1, -40, 0, 7)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(90, 25, 45)
close.Font = Enum.Font.GothamBold
Instance.new("UICorner", close).CornerRadius =
    UDim.new(0, 8)

local minimize = Instance.new("TextButton", main)
minimize.Size = UDim2.fromOffset(32, 30)
minimize.Position = UDim2.new(1, -78, 0, 7)
minimize.Text = "-"
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.BackgroundColor3 = Color3.fromRGB(45, 35, 60)
minimize.Font = Enum.Font.GothamBold
Instance.new("UICorner", minimize).CornerRadius =
    UDim.new(0, 8)

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, -28, 0, 24)
status.Position = UDim2.fromOffset(14, 49)
status.BackgroundTransparency = 1
status.Text = "STATUS: DESLIGADO"
status.TextColor3 = Color3.fromRGB(220, 190, 255)
status.TextSize = 13
status.Font = Enum.Font.GothamBold

local active = false
local toggle = button("ATIVAR / DESATIVAR", 78)
toggle.Activated:Connect(function()
    active = not active
    status.Text = active and
        "STATUS: LIGADO" or "STATUS: DESLIGADO"
end)

local rarities = {
    "Comum", "Incomum", "Raro", "Épico",
    "Lendário", "Mítico", "Cósmico",
    "Secreto", "Eterno", "Divino"
}
local rarityIndex = 1
local rarity = button("RARIDADE: Comum", 128)

rarity.Activated:Connect(function()
    rarityIndex = rarityIndex % #rarities + 1
    rarity.Text = "RARIDADE: " .. rarities[rarityIndex]
end)

local areaNumber = 1
local area = button("ÁREA: 1 / 10", 178)

area.Activated:Connect(function()
    areaNumber = areaNumber % 10 + 1
    area.Text = "ÁREA: " .. areaNumber .. " / 10"
end)

local note = Instance.new("TextLabel", main)
note.Size = UDim2.new(1, -28, 0, 55)
note.Position = UDim2.fromOffset(14, 230)
note.BackgroundTransparency = 1
note.Text = "BONI HUB\nInterface visual • versão inicial"
note.TextColor3 = Color3.fromRGB(180, 170, 195)
note.TextSize = 12
note.Font = Enum.Font.Gotham
note.TextWrapped = true

local minimized = false
minimize.Activated:Connect(function()
    minimized = not minimized
    for _, item in ipairs(main:GetChildren()) do
        if item ~= header and item ~= close
            and item ~= minimize
            and not item:IsA("UICorner")
            and not item:IsA("UIStroke") then
            item.Visible = not minimized
        end
    end
    main.Size = minimized
        and UDim2.fromOffset(300, 44)
        or UDim2.fromOffset(300, 330)
end)

close.Activated:Connect(function()
    gui:Destroy()
end)
