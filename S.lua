local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PickUpEvent = ReplicatedStorage:WaitForChild("Framework"):FindFirstChild("PickUp")

PickUpEvent.OnServerEvent:Connect(function(_,Player,HRP,ClickDetector,Character,ItemName)
	
	local Backpack = Player:WaitForChild("Backpack")
	local Item = game:GetService("ServerStorage"):WaitForChild("Items"):FindFirstChild(ItemName)
	
	if (HRP.Position - ClickDetector.Parent.Position).Magnitude <= ClickDetector.MaxActivationDistance then
		
		print("PICKED UP")
		
		local ItemClone = Item:Clone()
		ItemClone.Parent = Backpack
		
	end
	
	
	
end)
