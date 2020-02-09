local function destroyIfStillWorkspace()
	local i = 0
	while i < 30 do
		wait(1)
		if script.Parent.Parent.Name ~= "Workspace" then
			script.Parent.Bolt.CanCollide = false
			script.Parent.BoltBack.CanCollide = false
			script.Parent.Body.CanCollide = false
			script.Parent.Handle.CanCollide = false
			script.Parent.Mag.CanCollide = false
			script.Parent.Chamber.CanCollide = false
			break
		end
		i = i + 1
	end
	
	if script.Parent.Parent.Name == "Workspace" then
		script.Parent:Destroy()
	else
		script:Destroy()
	end
end

script.Parent:GetPropertyChangedSignal("Parent"):Connect(destroyIfStillWorkspace)