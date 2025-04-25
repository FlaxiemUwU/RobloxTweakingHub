local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

--//Window
local Window = Library:CreateWindow({
    Title = "Femboy Menu UwU",
    Footer = "ฅ^•ﻌ•^ฅ",
    ToggleKeybind = Enum.KeyCode.End,
    Center = true,
    AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true
})
--//Tabs
local Tabs = {
	Visuals = Window:AddTab("Visuals", "paintbrush"),
	Combat = Window:AddTab("Combat", "sword"),
	Rage = Window:AddTab("Rage", "bomb"),
	Movement = Window:AddTab("Movement", "rabbit"),
	Skins = Window:AddTab("Skin Changer", "shirt"),
	Misc = Window:AddTab("Miscellaneous", "package"),
	Universal = Window:AddTab("Universal", "globe"),
	Settings = Window:AddTab("Settings", "settings"),
}
--//CFG + Themes
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("GaySexGUI")
SaveManager:SetFolder("GaySexGUI/CounterBlox")

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

SaveManager:LoadAutoloadConfig()
--//Variables
local RunService = game:GetService("RunService")
local MolotovFolder = Workspace:WaitForChild("Ray_Ignore"):WaitForChild("Fires")
local SmokeFolder = Workspace:WaitForChild("Ray_Ignore"):WaitForChild("Smokes")
--//Tables
local Visuals = {particles = {smokes = {enabled = false, color = Color3.fromRGB(99, 95, 98), material = tostring(Slate), percent = 100}, molotovs = {enabled = false, color = Color3.fromRGB(218, 133, 65), material = tostring(Neon), percent = 100, transparency = 1}}}
--particles = {smokes = {enabled = false, color = Color3.fromRGB(99, 95, 98), material = tostring(Slate), percent = 100}, molotovs = {enabled = false, color = Color3.fromRGB(218, 133, 65), material = tostring(Neon), percent = 100, transparency = 1}}
local Combat = {}
local Rage = {}
local Movement = {}
local Skins = {}
local Misc = {}
local Universal = {}
--//Sections
local Particles = Tabs.Visuals:AddLeftTabbox("Particles")
local SmokeTab = Particles:AddTab("Smokes")
local MolotovTab = Particles:AddTab("Molotovs")

local Scripts = Tabs.Universal:AddLeftGroupbox("Scripts")

local GroupBoxUnload = Tabs.Settings:AddRightGroupbox("Unload")
--//Content
local ManipSmoke = SmokeTab:AddToggle("ManipSmoke", {
    Text = "Manipulate Smokes",
	Default = false,
    Callback = function(Value)
		Visuals.particles.smokes.enabled = Value
	end
})

local SmokeColorPicker = ManipSmoke:AddColorPicker("SmokeAuraColor", {
    Default = Color3.fromRGB(99, 95, 98),
    Title = "Smoke Aura Color",
    Callback = function(Value)
		Visuals.particles.smokes.color = Value
    end
})

local SmokePercent = SmokeTab:AddSlider("SmokeParticle", {
    Text = "Smoke Particle Rate",
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
		Visuals.particles.smokes.percent = Value
    end
})

local SmokeMaterial = SmokeTab:AddDropdown("SmokeAuraMaterial", {
    Values = {"Asphalt", "Basalt", "Brick", "Cardboard", "Carpet", "CeramicTiles", "ClayRoofTiles", "Cobblestone", "Concrete", "Corroded", "Metal", "Cracked", "Lava", "Diamond", "Plate", "Fabric", "Foil", "Forcefield", "Glacier", "Glass", "Granite", "Grass", "Ground", "Ice", "LeafyGrass", "Leather", "Limestone", "Marble", "Metal", "Mud", "Neon", "Pavement", "Pebble", "Plaster", "Plastic", "Rock", "RoofShingles", "Rubber", "Salt", "Sand", "Sandstone", "Slate", "SmoothPlastic", "Snow", "Wood", "WoodPlanks"},
    Default = 42,
    Multi = false,
    Text = "Smoke Aura Material",
    Tooltip = "Selects material for smoke aura.",
    Callback = function(Value)
		Visuals.particles.smokes.material = tostring(Value)
    end
})

local ResetSmoke = SmokeTab:AddButton({
    Text = "Reset Smoke Properties",
    Func = function()
		Visuals.particles.smokes = {enabled = false, color = Color3.fromRGB(99, 95, 98), material = tostring(Slate), percent = 100}
    end,
    DoubleClick = true
})

local ManipMolotov = MolotovTab:AddToggle("ManipMolotov", {
    Text = "Manipulate Molotovs",
	Default = false,
    Callback = function(Value)
		Visuals.particles.molotovs.enabled = Value
	end
})

local MolotovColorPicker = ManipMolotov:AddColorPicker("MolotovAreaColor", {
    Default = Color3.fromRGB(218, 133, 65),
    Title = "Molotov Area Color",
    Callback = function(Value)
		Visuals.particles.molotovs.color = Value
    end
})

local MolotovPercent = MolotovTab:AddSlider("MolotovParticle", {
    Text = "Molotov Particle Rate",
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
		Visuals.particles.molotovs.percent = Value
    end
})

local MolotovTransparency = MolotovTab:AddSlider("MolotovTransparency", {
    Text = "Transparency",
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
		Visuals.particles.molotovs.transparency = Value
    end
})

local MolotovMaterial = MolotovTab:AddDropdown("MolotovMaterial", {
    Values = {"Asphalt", "Basalt", "Brick", "Cardboard", "Carpet", "CeramicTiles", "ClayRoofTiles", "Cobblestone", "Concrete", "Corroded", "Metal", "Cracked", "Lava", "Diamond", "Plate", "Fabric", "Foil", "Forcefield", "Glacier", "Glass", "Granite", "Grass", "Ground", "Ice", "LeafyGrass", "Leather", "Limestone", "Marble", "Metal", "Mud", "Neon", "Pavement", "Pebble", "Plaster", "Plastic", "Rock", "RoofShingles", "Rubber", "Salt", "Sand", "Sandstone", "Slate", "SmoothPlastic", "Snow", "Wood", "WoodPlanks"},
    Default = 31,
    Multi = false,
    Text = "Smoke Aura Material",
    Tooltip = "Selects material for smoke aura.",
    Callback = function(Value)
		Visuals.particles.molotovs.material = tostring(Value)
    end
})

local ResetMolotov = MolotovTab:AddButton({
    Text = "Reset Molotov Properties",
    Func = function()
		Visuals.particles.molotovs = {enabled = false, color = Color3.fromRGB(99, 95, 98), material = tostring(Neon), percent = 100, transparency = 1}
    end,
    DoubleClick = true
})

local InfYield = Scripts:AddButton({
    Text = "Infinite Yield",
    Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
    DoubleClick = false
})

local DexV3 = Scripts:AddButton({
    Text = "Dex v3",
    Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
    end,
    DoubleClick = false
})

local UnamedESP = Scripts:AddButton({
    Text = "Unamed ESP",
    Func = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))()
    end,
    DoubleClick = false
})

local UnloadButton = GroupBoxUnload:AddButton({
    Text = "Unload",
    Func = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/FlaxiemUwU/RobloxTweakingHub/refs/heads/main/Unload.lua'))()
    end,
    DoubleClick = true
})
--//Functions
local function Visuals()
	if Visuals.particles.smokes.enabled == false then
		if smokeConnection then
			smokeConnection:Disconnect()
		end
	else
		smokeConnection = SmokeFolder.ChildAdded:Connect(function(newSmoke)
			task.delay(0.1, function()
				newSmoke.Material = Enum.Material[Visuals.particles.smokes.material]
				newSmoke.Color = Visuals.particles.smokes.color
			end)
			local emitter = newSmoke:FindFirstChildWhichIsA("ParticleEmitter", true)
			if emitter then
				task.delay(0.1, function()
					emitter.Rate = Visuals.particles.smokes.percent
				end)
			end
		end)
	end
	if Visuals.particles.molotovs.enabled == false then
		if molotovConnection then
			molotovConnection:Disconnect()
		end
	else
		molotovConnection = MolotovFolder.ChildAdded:Connect(function(newMolotov)
			task.delay(0.1, function()
				newMolotov.Material = Enum.Material[Visuals.particles.smokes.material]
				newMolotov.Color = Visuals.particles.smokes.color
			end)
			local emitter = newMolotov:FindFirstChildWhichIsA("ParticleEmitter", true)
			if newMolotov:FindFirstChild("Fire") then
				emitter.Rate = Visuals.particles.molotovs.percent
			end
		end)
	end
end
--[[//Functions
local function Visuals()
local function Combat()
local function Rage()
local function Movement()
local function Misc()
local function Universal()
]]
--//Run Functions
RunService.RenderStepped:Connect(function()
	do Visuals() end
--	do Combat() end
--	do Rage() end
--	do Movement() end
--	do Misc() end
--	do Universal()end
end
