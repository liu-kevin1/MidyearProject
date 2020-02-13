local function destroyIfStillWorkspace()
	local i = 0
	while i < 60 do
		wait(1)
		if script.Parent.Parent.Name ~= "Workspace" then
			script.Parent.Handle.CanCollide = false
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