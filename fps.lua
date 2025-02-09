--[[ WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk! ]]
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0, 150, 0, 30) -- Thu nhỏ lại
fpsLabel.Position = UDim2.new(0, 10, 0, 10) -- Góc trên bên trái
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.new(1, 1, 1) -- Mặc định màu trắng
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextScaled = true
fpsLabel.Parent = screenGui

local tweenService = game:GetService("TweenService")
local lastTime = tick()
local frames = 0
local colorIndex = 1

-- Danh sách 7 màu cầu vồng
local colors = {
    Color3.fromRGB(255, 0, 0),   -- Đỏ
    Color3.fromRGB(255, 165, 0), -- Cam
    Color3.fromRGB(255, 255, 0), -- Vàng
    Color3.fromRGB(0, 255, 0),   -- Xanh lá
    Color3.fromRGB(0, 0, 255),   -- Xanh dương
    Color3.fromRGB(75, 0, 130),  -- Chàm
    Color3.fromRGB(148, 0, 211)  -- Tím
}

-- Cập nhật FPS + hiệu ứng chuyển màu
game:GetService("RunService").RenderStepped:Connect(function()
    frames = frames + 1
    local currentTime = tick()
    
    if currentTime - lastTime >= 1 then
        fpsLabel.Text = "FPS: " .. tostring(frames)

        -- Tạo hiệu ứng chuyển màu mượt
        local tween = tweenService:Create(fpsLabel, TweenInfo.new(0.5), {TextColor3 = colors[colorIndex]})
        tween:Play()
        
        colorIndex = colorIndex % #colors + 1 -- Chuyển sang màu tiếp theo
        frames = 0
        lastTime = currentTime
    end
end)
