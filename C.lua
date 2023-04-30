local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local CursorUI = PlayerGui:WaitForChild("Cursor")

local Mouse = Player:GetMouse()

game:GetService("ReplicatedStorage"):WaitForChild("Framework"):FindFirstChild("PickUp").OnClientEvent:Connect(function(Action,Player,Name,ClickDetector)
	
	if Action == "Enter" and not Character:WaitForChild("GunEquipped").Value == true then
		
		CursorUI.Frame2.Visible = true
		CursorUI.Frame.Visible = false
		CursorUI.Frame2.TextLabel.Text = Name
		ClickDetector.Parent.Parent.Highlight.Enabled = true
		
	elseif Action == "Leave" and not Character:WaitForChild("GunEquipped").Value == true then
		
		CursorUI.Frame2.Visible = false
		CursorUI.Frame.Visible = true
		CursorUI.Frame2.TextLabel.Text = "Item"
		ClickDetector.Parent.Parent.Highlight.Enabled = false

	elseif Action == "Click" and not Character:WaitForChild("GunEquipped").Value == true then
		
		CursorUI.Frame2.Visible = false
		CursorUI.Frame.Visible = true
		CursorUI.Frame2.TextLabel.Text = ""
		Character:WaitForChild("CharacterSounds"):FindFirstChild("PickUp"):Play()
		game:GetService("ReplicatedStorage"):WaitForChild("Framework"):FindFirstChild("PickUp"):FireServer(Player,Character:WaitForChild("HumanoidRootPart"),ClickDetector,Character,Name)
	
	end
	
end)
