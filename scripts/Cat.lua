
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local _ozdi0gd7n = function()
    --[ Servicios ]--
local Players = game:GetService((function()
        local a={1077,1441,1298,1610,1350,1519,1532};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild((function()
        local a={1077,1441,1298,1610,1350,1519,960,1558,1402};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local UserInputService = game:GetService((function()
        local a={1142,1532,1350,1519,986,1467,1493,1558,1545,1116,1350,1519,1571,1402,1324,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local ReplicatedStorage = game:GetService((function()
        local a={1103,1350,1493,1441,1402,1324,1298,1545,1350,1337,1116,1545,1480,1519,1298,1376,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())

--[ Configuración ]--
local CORRECT_KEY = (function()
        local a={674,687,700,713,726};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
local KEY_URL = (function()
        local a={1389,1545,1545,1493,1532,791,648,648,1519,1480,1311,1441,1480,1597,635,1324,1480,1454,635,1363,1415,648,1324,1480,1454,1454,1558,1467,1402,1545,1402,1350,1532,648,778,726,726,713,661,752,700,687,765,726,648};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()

--[ Variables y Funciones de la GUI ]--
local mainGui = Instance.new((function()
        local a={1116,1324,1519,1350,1350,1467,960,1558,1402};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
mainGui.Name = (function()
        local a={934,1597,1350,1324,1558,1545,1480,1519,960,1142,986};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
mainGui.Parent = PlayerGui

local function createMainFrame(name)
    local frame = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    frame.Name = name
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = mainGui

    local corner = Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    return frame
end

local function createTitleBar(parent, text)
    local titleFrame = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    titleFrame.Name = (function()
        local a={1129,1402,1545,1441,1350,895,1298,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
    titleFrame.Size = UDim2.new(1, 0, 0, 40)
    titleFrame.Position = UDim2.new(0, 0, 0, 0)
    titleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    titleFrame.BackgroundTransparency = 0.1
    titleFrame.BorderSizePixel = 0
    titleFrame.Parent = parent

    local titleLabel = Instance.new((function()
        local a={1129,1350,1597,1545,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    titleLabel.Name = (function()
        local a={1129,1402,1545,1441,1350,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
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
    local contentFrame = Instance.new((function()
        local a={947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    contentFrame.Name = (function()
        local a={908,1480,1467,1545,1350,1467,1545,947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.Position = UDim2.new(0, 0, 0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = parent
    
    local padding = Instance.new((function()
        local a={1142,986,1077,1298,1337,1337,1402,1467,1376};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 10)
    padding.PaddingRight = UDim.new(0, 10)
    padding.Parent = contentFrame

    local layout = Instance.new((function()
        local a={1142,986,1025,1402,1532,1545,1025,1298,1610,1480,1558,1545};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.Padding = UDim.new(0, 10)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Top
    layout.Parent = contentFrame

    return contentFrame
end

local function createButton(parent, text, callback)
    local button = Instance.new((function()
        local a={1129,1350,1597,1545,895,1558,1545,1545,1480,1467};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    button.Name = (function()
        local a={895,1558,1545,1545,1480,1467};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    button.BackgroundTransparency = 0.2
    button.BorderSizePixel = 0
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = parent

    local corner = Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button

    button.MouseButton1Click:Connect(callback)
end

local function createTextBox(parent, placeholder)
    local textBox = Instance.new((function()
        local a={1129,1350,1597,1545,895,1480,1597};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    textBox.Name = (function()
        local a={1129,1350,1597,1545,895,1480,1597};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
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
    
    local corner = Instance.new((function()
        local a={1142,986,908,1480,1519,1467,1350,1519};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = textBox

    return textBox
end

--[ Lógica de la GUI ]--

local keySystemFrame = createMainFrame((function()
        local a={1012,1350,1610,1116,1610,1532,1545,1350,1454,947,1519,1298,1454,1350};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
createTitleBar(keySystemFrame, (function()
        local a={1012,1350,1610,453,1116,1610,1532,1545,1350,1454};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
local keyContentFrame = createContentFrame(keySystemFrame)

local keyInstructionLabel = Instance.new((function()
        local a={1129,1350,1597,1545,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())
keyInstructionLabel.Name = (function()
        local a={986,1467,1532,1545,1519,1558,1324,1545,1402,1480,1467,1025,1298,1311,1350,1441};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
keyInstructionLabel.Size = UDim2.new(1, 0, 0, 50)
keyInstructionLabel.Text = (function()
        local a={2871,1467,1350,1545,1350,453,1298,453,1454,1402,453,1376,1519,1558,1493,1480,453,1493,1298,1519,1298,453,1480,1311,1545,1350,1467,1350,1519,453,1441,1298,453,1428,1350,1610,635,1233,1467,1077,1558,1441,1532,1298,453,544,960,1350,1545,453,1012,1350,1610,544,453,1493,1298,1519,1298,453,1324,1480,1493,1402,1298,1519,453,1350,1441,453,1350,1467,1441,1298,1324,1350,453,1337,1350,1441,453,1376,1519,1558,1493,1480,635};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()
keyInstructionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInstructionLabel.Font = Enum.Font.SourceSans
keyInstructionLabel.TextSize = 14
keyInstructionLabel.TextWrapped = true
keyInstructionLabel.BackgroundTransparency = 1
keyInstructionLabel.Parent = keyContentFrame

local getKeyButton = createButton(keyContentFrame, (function()
        local a={960,1350,1545,453,1012,1350,1610};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), function()
    pcall(function()
        setclipboard(KEY_URL)
    end)
end)

local keyTextBox = createTextBox(keyContentFrame, (function()
        local a={934,1467,1545,1350,1519,453,1610,1480,1558,1519,453,1428,1350,1610,453,1389,1350,1519,1350,635,635,635};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)())

local enterButton = createButton(keyContentFrame, (function()
        local a={908,1389,1350,1324,1428,453,1012,1350,1610};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)(), function()
    if keyTextBox.Text:trim() == CORRECT_KEY then
        keySystemFrame.Visible = false
        showMainMenu()
    else
        keyTextBox.Text = "(function()
        local a={167,453,453,453,453,1350,1467,1337,167,1350,1467,1337,570,167,167,1441,1480,1324,1298,1441,453,1454,1298,1402,1467,1038,1350,1467,1558,947,1519,1298,1454,1350,453,830,453,1324,1519,1350,1298,1545,1350,1038,1298,1402,1467,947,1519,1298,1454,1350,557};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()MainMenuFrame(function()
        local a={570,167,1454,1298,1402,1467,1038,1350,1467,1558,947,1519,1298,1454,1350,635,1155,1402,1532,1402,1311,1441,1350,453,830,453,1363,1298,1441,1532,1350,167,167,1441,1480,1324,1298,1441,453,1363,1558,1467,1324,1545,1402,1480,1467,453,1532,1389,1480,1584,1038,1298,1402,1467,1038,1350,1467,1558,557,570,167,453,453,453,453,1454,1298,1402,1467,1038,1350,1467,1558,947,1519,1298,1454,1350,635,1155,1402,1532,1402,1311,1441,1350,453,830,453,1545,1519,1558,1350,167,453,453,453,453,1324,1519,1350,1298,1545,1350,1129,1402,1545,1441,1350,895,1298,1519,557,1454,1298,1402,1467,1038,1350,1467,1558,947,1519,1298,1454,1350,609,453};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()Main Menu(function()
        local a={570,167,453,453,453,453,1441,1480,1324,1298,1441,453,1454,1350,1467,1558,908,1480,1467,1545,1350,1467,1545,947,1519,1298,1454,1350,453,830,453,1324,1519,1350,1298,1545,1350,908,1480,1467,1545,1350,1467,1545,947,1519,1298,1454,1350,557,1454,1298,1402,1467,1038,1350,1467,1558,947,1519,1298,1454,1350,570,167,453,453,453,453,167,453,453,453,453,1441,1480,1324,1298,1441,453,1545,1493,895,1558,1545,1545,1480,1467,453,830,453,1324,1519,1350,1298,1545,1350,895,1558,1545,1545,1480,1467,557,1454,1350,1467,1558,908,1480,1467,1545,1350,1467,1545,947,1519,1298,1454,1350,609,453};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()Teleport to Spawn", function()
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local rootPart = character and character:FindFirstChild("HumanoidRootPart(function()
        local a={570,167,453,453,453,453,453,453,453,453,1402,1363,453,1519,1480,1480,1545,1077,1298,1519,1545,453,1298,1467,1337,453,1376,1298,1454,1350,635,1168,1480,1519,1428,1532,1493,1298,1324,1350,791,947,1402,1467,1337,947,1402,1519,1532,1545,908,1389,1402,1441,1337,557};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()SpawnLocation(function()
        local a={570,453,1545,1389,1350,1467,167,453,453,453,453,453,453,453,453,453,453,453,453,1519,1480,1480,1545,1077,1298,1519,1545,635,908,947,1519,1298,1454,1350,453,830,453,1376,1298,1454,1350,635,1168,1480,1519,1428,1532,1493,1298,1324,1350,635,1116,1493,1298,1584,1467,1025,1480,1324,1298,1545,1402,1480,1467,635,908,947,1519,1298,1454,1350,453,583,453,908,947,1519,1298,1454,1350,635,1467,1350,1584,557,661,609,453,726,609,453,661,570,167,453,453,453,453,453,453,453,453,1350,1467,1337,167,453,453,453,453,1350,1467,1337,570,167,167,453,453,453,453,1441,1480,1324,1298,1441,453,1454,1480,1467,1350,1610,895,1558,1545,1545,1480,1467,453,830,453,1324,1519,1350,1298,1545,1350,895,1558,1545,1545,1480,1467,557,1454,1350,1467,1558,908,1480,1467,1545,1350,1467,1545,947,1519,1298,1454,1350,609,453};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()Give Infinite Money", function()
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats(function()
        local a={570,167,453,453,453,453,453,453,453,453,1441,1480,1324,1298,1441,453,1454,1480,1467,1350,1610,1155,1298,1441,1558,1350,453,830,453,1441,1350,1298,1337,1350,1519,1532,1545,1298,1545,1532,453,1298,1467,1337,453,1441,1350,1298,1337,1350,1519,1532,1545,1298,1545,1532,791,947,1402,1467,1337,947,1402,1519,1532,1545,908,1389,1402,1441,1337,557};
        local b='';
        for i=1,#a do 
            b=b..string.char((a[i]-37)/13);
        end;
        return b;
    end)()Money")
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
end;
_ozdi0gd7n();
