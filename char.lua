-- DONE Basınca Spawn Point'e Işınlan
done.MouseButton1Click:Connect(function()
	local targetName = box.Text
	local target = Players:FindFirstChild(targetName)
	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
		end
	end
end)
