local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Davix script",
   LoadingTitle = "Bem vindo ao davix hub",
   LoadingSubtitle = "by davix • Cheio de opções",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DavixHub",
      FileName = "UniversalConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "seuinvite",
      RememberJoins = true
   },
   KeySystem = false, -- Mude para true se quiser key system
})

-- ====================== TABS ======================
local PlayerTab = Window:CreateTab("Player", "user")
local MovementTab = Window:CreateTab("Movement", "move")
local VisualTab = Window:CreateTab("Visuals", "eye")
local UtilityTab = Window:CreateTab("Utilities", "wrench")
local ServerTab = Window:CreateTab("Server", "server")
local SettingsTab = Window:CreateTab("Settings", "settings")

-- ====================== PLAYER TAB ======================
local PlayerSection = PlayerTab:CreateSection("Player Modifications")

PlayerTab:CreateToggle({
   Name = "God Mode (Anti-Damage)",
   CurrentValue = false,
   Flag = "GodMode",
   Callback = function(Value)
      -- Implemente conforme o jogo (exemplo genérico)
      print("God Mode:", Value)
   end,
})

PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 5,
   Suffix = " studs/s",
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value)
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

PlayerTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 500},
   Increment = 10,
   Suffix = " studs",
   CurrentValue = 50,
   Flag = "JumpPower",
   Callback = function(Value)
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
      end
   end,
})

PlayerTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value)
      -- Lógica de Infinite Jump (exemplo)
      print("Infinite Jump:", Value)
   end,
})

PlayerTab:CreateButton({
   Name = "Reset Character",
   Callback = function()
      game.Players.LocalPlayer.Character:BreakJoints()
   end,
})

-- ====================== MOVEMENT TAB ======================
MovementTab:CreateSection("Movement Options")

MovementTab:CreateToggle({
   Name = "Fly (Press F to toggle)",
   CurrentValue = false,
   Flag = "Fly",
   Callback = function(Value)
      print("Fly mode:", Value)
      -- Implemente fly script aqui
   end,
})

MovementTab:CreateSlider({
   Name = "Fly Speed",
   Range = {10, 300},
   Increment = 5,
   Suffix = "",
   CurrentValue = 50,
   Flag = "FlySpeed",
   Callback = function(Value) end,
})

-- ====================== VISUALS TAB ======================
VisualTab:CreateSection("ESP & Visuals")

VisualTab:CreateToggle({
   Name = "ESP Players",
   CurrentValue = false,
   Flag = "ESP",
   Callback = function(Value)
      print("ESP:", Value)
   end,
})

VisualTab:CreateColorPicker({
   Name = "ESP Color",
   Color = Color3.fromRGB(255, 0, 0),
   Flag = "ESPColor",
   Callback = function(Value)
      print("ESP Color changed")
   end,
})

VisualTab:CreateDropdown({
   Name = "ESP Type",
   Options = {"Boxes", "Tracers", "Names", "All"},
   CurrentOption = {"Boxes"},
   MultipleOptions = false,
   Flag = "ESPType",
   Callback = function(Options)
      print("ESP Type:", Options)
   end,
})

-- ====================== UTILITIES TAB ======================
UtilityTab:CreateSection("Utilities")

UtilityTab:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
      game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
   end,
})

UtilityTab:CreateInput({
   Name = "Execute Custom Script",
   CurrentValue = "",
   PlaceholderText = "Cole o código aqui...",
   RemoveTextAfterFocusLost = false,
   Flag = "CustomScript",
   Callback = function(Text)
      loadstring(Text)()
   end,
})

-- ====================== SERVER TAB ======================
ServerTab:CreateSection("Server Tools")

ServerTab:CreateButton({
   Name = "Server Hop",
   Callback = function()
      print("Server Hop executado")
   end,
})

-- ====================== SETTINGS TAB ======================
SettingsTab:CreateSection("Configurações")

SettingsTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      Rayfield:Destroy()
   end,
})

SettingsTab:CreateButton({
   Name = "Load Configuration",
   Callback = function()
      Rayfield:LoadConfiguration()
   end,
})

-- Finaliza
Rayfield:LoadConfiguration()
print("✅ Grok Universal Hub carregado com sucesso!")
