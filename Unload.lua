if smokeConnection then
	smokeConnection:Disconnect()
end
if molotovConnection then
	molotovConnection:Disconnect()
end
if RunServiceConnection then
	RunServiceConnection:Disconnect()
end
if Library then
	Library:Unload()
end
