print("Unloading...")
print("-----")
if smokeConnection then
	print(">🔴smokeConnection Disconnected.")
	smokeConnection:Disconnect()
end
if molotovConnection then
	print(">🔴molotovConnection Disconnected.")
	molotovConnection:Disconnect()
end
if smoke2Connection then
	print(">🔴smoke2Connection Disconnected.")
	smoke2Connection:Disconnect()
end
if molotov2Connection then
	print(">🔴molotov2Connection Disconnected.")
	molotov2Connection:Disconnect()
end
print("Unloaded")
if Library then
	Library:Unload()
end