local player = game.Players.LocalPlayer
local obj = game:GetService("Workspace"):FindFirstChild("DeeKub")
local List = {
        "Roberto35365",
        "badte_maru008",
        "Coragem496",
    }
    
local listado = false
    for _, nome in ipairs(List) do
        if player.Name == nome then
            listado = true
            break
        end
    end
   
local function killPlayer()
      while true do
          wait(1)
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 0
                break
            end
        end
    end
    
  while true do
    if obj or listado then
        print("passou")
        break
    else
        player:Kick("Pare de Roubar os Script dos outros")
        killPlayer()
    end
  end

local shiftlockk = Instance.new("ScreenGui")
local LockButton = Instance.new("ImageButton")
local btnIcon = Instance.new("ImageLabel")
local susDrag = Instance.new("Frame")

shiftlockk.Name = "shiftlockk"
shiftlockk.Parent = game.CoreGui
shiftlockk.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
shiftlockk.ResetOnSpawn = false

LockButton.Name = "LockButton"
LockButton.Parent = shiftlockk
LockButton.AnchorPoint = Vector2.new(0.5, 0)
LockButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LockButton.BackgroundTransparency = 1
LockButton.BorderColor3 = Color3.fromRGB(255, 255, 1)
LockButton.Position = UDim2.new(0.5, 267, 0, 246)
LockButton.Size = UDim2.new(0, 60, 0, 60)
LockButton.ZIndex = 3
LockButton.Image = "rbxassetid://530406505"
LockButton.ImageColor3 = Color3.fromRGB(0, 133, 199)
LockButton.ImageRectOffset = Vector2.new(2, 2)
LockButton.ImageRectSize = Vector2.new(98, 98)
LockButton.ImageTransparency = 1
LockButton.ScaleType = Enum.ScaleType.Fit

btnIcon.Name = "btnIcon"
btnIcon.Parent = LockButton
btnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btnIcon.BackgroundTransparency = 1.000
btnIcon.Position = UDim2.new(0.100000001, 0, 0.100000001, 0)
btnIcon.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
btnIcon.ZIndex = 3
btnIcon.Image = "rbxasset://textures/ui/mouseLock_off.png"
btnIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
btnIcon.ScaleType = Enum.ScaleType.Fit
btnIcon.SliceCenter = Rect.new(-160, 0, 100, 0)

susDrag.Name = "susDrag"
susDrag.Parent = LockButton
susDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
susDrag.BackgroundTransparency = 1
susDrag.BorderColor3 = Color3.fromRGB(0, 0, 0)
susDrag.BorderSizePixel = 0
susDrag.Position = UDim2.new(0.100000001, 0, 0.100000001, 0)
susDrag.Size = UDim2.new(0, 50, 0, 50)

local function YDYMLAX_fake_script()
	local script = Instance.new('LocalScript', LockButton)

	local Input = game:GetService("UserInputService")
	local V = false

	local main = script.Parent
	local susDragFrame = main.susDrag
	local dragging = false
	local offset

	local function onInputBegan(input, gameProcessedEvent)
		if not gameProcessedEvent then
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				offset = main.Position - UDim2.new(0, input.Position.X, 0, input.Position.Y)
			end
		end
	end

	local function onInputMoved(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			main.Position = UDim2.new(0, input.Position.X, 0, input.Position.Y) + offset
			print(main.Position)
		end
	end

	local function onInputEnded(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragging = false
		end
	end

	susDragFrame.InputBegan:Connect(onInputBegan)
	susDragFrame.InputChanged:Connect(onInputMoved)
	susDragFrame.InputEnded:Connect(onInputEnded)

	main.MouseButton1Click:Connect(function()
		V = not V
		main.btnIcon.ImageColor3 = V and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(255, 255, 255)
		if V then
			ForceShiftLock()
		else
			EndForceShiftLock()
		end
	end)

	local g = nil
	local GameSettings = UserSettings():GetService("UserGameSettings")
	local J = nil

	function ForceShiftLock()
		local i, k = pcall(function()
			return GameSettings.RotationType
		end)
		_ = i
		g = k
		J = game:GetService("RunService").RenderStepped:Connect(function()
			pcall(function()
				GameSettings.RotationType = Enum.RotationType.CameraRelative
			end)
		end)
	end

	function EndForceShiftLock()
		if J then
			pcall(function()
				GameSettings.RotationType = g or Enum.RotationType.MovementRelative
			end)
			J:Disconnect()
		end
	end
end
coroutine.wrap(YDYMLAX_fake_script)()
print("Foi")
