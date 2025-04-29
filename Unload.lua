if smokeConnection then
	smokeConnection:Disconnect()
end
if molotovConnection then
	molotovConnection:Disconnect()
end
if CharacterAddConnection then
	CharacterAddConnection:Disconnect()
end
if CharacterRemoveConnection then
	CharacterRemoveConnection:Disconnect()
end
if runServiceConnection then
	runServiceConnection:Disconnect()
end
if Library then
	Library:Unload()
end
