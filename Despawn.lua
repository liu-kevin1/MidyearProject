local destroyThing = script.Parent.DestroyObject.Value
local despawnTime = script.Parent.DespawnTime

wait(despawnTime.Value)

destroyThing:Destroy()