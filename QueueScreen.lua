local killQueue = game.ReplicatedStorage:WaitForChild("KillQueue")
local v_q1 = killQueue.q1
local v_q2 = killQueue.q2
local v_q3 = killQueue.q3
local v_q4 = killQueue.q4
local v_q5 = killQueue.q5

local l_q1 = script.Parent.q1
local l_q2 = script.Parent.q2
local l_q3 = script.Parent.q3
local l_q4 = script.Parent.q4
local l_q5 = script.Parent.q5

local function update_label(label, value_object)
	label.Text = value_object.Value
end

local function update_labels()
	update_label(l_q1, v_q1)
	update_label(l_q2, v_q2)
	update_label(l_q3, v_q3)
	update_label(l_q4, v_q4)
	update_label(l_q5, v_q5)
end

v_q1:GetPropertyChangedSignal("Value"):Connect(update_labels)
v_q2:GetPropertyChangedSignal("Value"):Connect(update_labels)
v_q3:GetPropertyChangedSignal("Value"):Connect(update_labels)
v_q4:GetPropertyChangedSignal("Value"):Connect(update_labels)
v_q5:GetPropertyChangedSignal("Value"):Connect(update_labels)