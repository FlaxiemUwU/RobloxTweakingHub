local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

--window
local Window = Library:CreateWindow({
    Title = "TweakingGUI",
    Footer = "ฅ^•ﻌ•^ฅ",
    ToggleKeybind = Enum.KeyCode.End,
    Center = true,
    AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true
})
--tabs
local Tabs = {
	VisualsTab = Window:AddTab("Visuals", "paintbrush"),
	TrollingTab = Window:AddTab("Trolling", "bomb"),
	TweakingTab = Window:AddTab("Tools/Universal", "wrench"),
	["SettingsTab"] = Window:AddTab("Settings", "settings"),
}
--VisualsTab
--Smokes
local GlobalspValue = 100
local GlobalsMaterial = tostring(Slate)
local GlobalsaColor = Color3.fromRGB(99, 95, 98)
local smokesFolder = Workspace:WaitForChild("Ray_Ignore"):WaitForChild("Smokes")
local Smokes = Tabs.VisualsTab:AddLeftGroupbox("Smokes")
local spToggle = Smokes:AddToggle("Smoke Particles Toggle", {
    Text = "Adjust Particles",
    Default = false,
    Tooltip = "Enables or disables adjusting smoke particles",
    Callback = function(spToggle)
		if spToggle == false then
			if smokeConnection then
				print(">🔴smokeConnection Disconnected.")
				smokeConnection:Disconnect()
			end
		else
			print(">🟢smokeConnection Connected.")
			smokeConnection = smokesFolder.ChildAdded:Connect(function(newSmoke)
				local emitter = newSmoke:FindFirstChildWhichIsA("ParticleEmitter", true)
				if emitter then
					task.delay(0.1, function()
						emitter.Rate = GlobalspValue
					end)
				end
			end)
		end
	end
})
local smToggle = Smokes:AddToggle("Smoke Material Toggle", {
    Text = "Adjust Material",
    Default = false,
    Tooltip = "Enables or disables adjusting smoke aura material.",
    Callback = function(smToggle)
		if smToggle == false then
			if smoke2Connection then
				print(">🔴smoke2Connection Disconnected.")
				smoke2Connection:Disconnect()
			end
		else
			print(">🟢smoke2Connection Connected.")
			smoke2Connection = smokesFolder.ChildAdded:Connect(function(newSmoke2)
				task.delay(0.1, function()
					newSmoke2.Material = Enum.Material[GlobalsMaterial]
					newSmoke2.Color = GlobalsaColor
				end)
			end)
		end
	end
})
local saColorPicker = smToggle:AddColorPicker("Smoke Aura Color", {
    Default = Color3.fromRGB(99, 95, 98),
    Title = "Smoke Aura Color",
    Transparency = 0,
    Callback = function(saColor)
		GlobalsaColor = saColor
    end
})
local sParticle = Smokes:AddSlider("Smoke Particle", {
    Text = "Smoke Particle Rate",
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(spValue)
		GlobalspValue = spValue
    end
})
local sMaterial = Smokes:AddDropdown("Smoke Aura Material", {
    Values = {"Asphalt", "Basalt", "Brick", "Cardboard", "Carpet", "CeramicTiles", "ClayRoofTiles", "Cobblestone", "Concrete", "Corroded", "Metal", "Cracked", "Lava", "Diamond", "Plate", "Fabric", "Foil", "Forcefield", "Glacier", "Glass", "Granite", "Grass", "Ground", "Ice", "LeafyGrass", "Leather", "Limestone", "Marble", "Metal", "Mud", "Neon", "Pavement", "Pebble", "Plaster", "Plastic", "Rock", "RoofShingles", "Rubber", "Salt", "Sand", "Sandstone", "Slate", "SmoothPlastic", "Snow", "Wood", "WoodPlanks"},
    Default = 42,
    Multi = false,
    Text = "Smoke Aura Material",
    Tooltip = "Selects material for smoke aura.",
    Callback = function(sMaterial)
		GlobalsMaterial = tostring(sMaterial)
    end
})
--Molotovs
local GlobalmpValue = 100
local GlobalmTransparency = 1
local GlobalmMaterial = tostring(Neon)
local GlobalmaColor = Color3.fromRGB(218, 133, 65)
local molotovFolder = Workspace:WaitForChild("Ray_Ignore"):WaitForChild("Fires")
local Molotovs = Tabs.VisualsTab:AddLeftGroupbox("Molotovs")

local mpToggle = Molotovs:AddToggle("Molotov Particles Toggle", {
    Text = "Adjust Particles",
    Default = false,
    Tooltip = "Enables or disables adjusting Molotov particles.",
    Callback = function(mpToggle)
		if mpToggle == false then
			if molotovConnection then
				print(">🔴molotovConnection Disconnected.")
				molotovConnection:Disconnect()
			end
		else
			print(">🟢molotovConnection Connected.")
			molotovConnection = molotovFolder.ChildAdded:Connect(function(newMolotov)
				local emitter = newMolotov:FindFirstChildWhichIsA("ParticleEmitter", true)
				if emitter then
					task.delay(0.1, function()
						emitter.Rate = GlobalmpValue
					end)
				elseif newMolotov:FindFirstChild("Fire") then
					task.delay(0.1, function()
						emitter.Rate = GlobalmpValue
					end)
				end
			end)
		end
	end
})
local mmToggle = Molotovs:AddToggle("Molotov Material Toggle", {
    Text = "Adjust Material",
    Default = false,
    Tooltip = "Enables or disables adjusting molotov area material and, transparency.",
    Callback = function(mmToggle)
		if mmToggle == false then
			if molotov2Connection then
				print(">🔴molotov2Connection Disconnected.")
				molotov2Connection:Disconnect()
			end
		else
			print(">🟢molotov2Connection Connected.")
			molotov2Connection = molotovFolder.ChildAdded:Connect(function(newMolotov2)
				task.delay(0.1, function()
					newMolotov2.Transparency = GlobalmTransparency
					newMolotov2.Material = Enum.Material[GlobalmMaterial]
					newMolotov2.Color = GlobalmaColor
				end)
			end)
		end
	end
})
local maColorPicker = mmToggle:AddColorPicker("Molotov Area Color", {
    Default = Color3.fromRGB(218, 133, 65),
    Title = "Molotov Area Color",
    Transparency = 0,
    Callback = function(maColor)
		GlobalmaColor = maColor
    end
})
local mParticle = Molotovs:AddSlider("Molotov Particle", {
    Text = "Molotov Particle Rate",
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(mpValue)
		GlobalmpValue = mpValue
    end
})
local mTransparency = Molotovs:AddSlider("Molotov Area Transparency", {
    Text = "Molotov Area Transparency",
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,
    Callback = function(mtValue)
		GlobalmTransparency = mtValue
    end
})
local mMaterial = Molotovs:AddDropdown("Molotov Area Material", {
    Values = {"Asphalt", "Basalt", "Brick", "Cardboard", "Carpet", "CeramicTiles", "ClayRoofTiles", "Cobblestone", "Concrete", "Corroded", "Metal", "Cracked", "Lava", "Diamond", "Plate", "Fabric", "Foil", "Forcefield", "Glacier", "Glass", "Granite", "Grass", "Ground", "Ice", "LeafyGrass", "Leather", "Limestone", "Marble", "Metal", "Mud", "Neon", "Pavement", "Pebble", "Plaster", "Plastic", "Rock", "RoofShingles", "Rubber", "Salt", "Sand", "Sandstone", "Slate", "SmoothPlastic", "Snow", "Wood", "WoodPlanks"},
    Default = 31,
    Multi = false,
    Text = "Molotov Area Material",
    Tooltip = "Selects material for molotov area.",
    Callback = function(mMaterial)
		GlobalmMaterial = tostring(mMaterial)
    end
})
--World

--SettingsTab
local GroupboxUnload = Tabs["SettingsTab"]:AddLeftGroupbox("Unload")
local Unload = GroupboxUnload:AddButton({
    Text = "Unload",
    Func = function()
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
    end,
    DoubleClick = true
})

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("TweakingGUI")
SaveManager:SetFolder("TweakingGUI/CounterBlox")

SaveManager:BuildConfigSection(Tabs["SettingsTab"])
ThemeManager:ApplyToTab(Tabs["SettingsTab"])

SaveManager:LoadAutoloadConfig()
