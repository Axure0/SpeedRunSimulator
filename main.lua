local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Speed Run Simulator",
   LoadingTitle = "Speed Run Simulator Script",
   LoadingSubtitle = "by axur.e",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Speed Run Simulator"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false,
   KeySettings = {}
})

local Tab = Window:CreateTab("Main")

local Section = Tab:CreateSection("Auto Click")

local AutoClickEnabled = false

local Slider = Tab:CreateSlider({
   Name = "Auto Click Speed",
   Range = {0.05, 10},
   Increment = 0.01,
   Suffix = "Click Speed",
   CurrentValue = 0.05,
   Flag = "ClickSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the slider changes
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Enabled",
   CurrentValue = false,
   Flag = "ClickToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(val)
    AutoClickEnabled = val
   end,
})

local Section2 = Tab:CreateSection("Auto Rebirth")

local AutoRebirthEnabled = false

local Toggle2 = Tab:CreateToggle({
   Name = "Enabled",
   CurrentValue = false,
   Flag = "RebirthToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(val)
    AutoRebirthEnabled = val
   end,
})

local Tab2 = Window:CreateTab("Misc")

local WalkSpeedEnabled = false

local Section3 = Tab2:CreateSection("Walk Speed")

local Slider2 = Tab2:CreateSlider({
   Name = "WalkSpeed",
   Range = {5, 250},
   Increment = 5,
   Suffix = "",
   CurrentValue = 16,
   Flag = "WalkSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(val)
    
   end,
})

local Toggle3 = Tab2:CreateToggle({
   Name = "Enabled",
   CurrentValue = false,
   Flag = "WalkToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(val)
    WalkSpeedEnabled = val
   end,
})

local Section4 = Tab2:CreateSection("Jump Power")

local JumpPowerEnabled = false

local Slider3 = Tab2:CreateSlider({
   Name = "Jump Power",
   Range = {0, 1000},
   Increment = 10,
   Suffix = "",
   CurrentValue = 50,
   Flag = "JumpSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(val)
    
   end,
})

local Toggle4 = Tab2:CreateToggle({
   Name = "Enabled",
   CurrentValue = false,
   Flag = "JumpToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(val)
    JumpPowerEnabled = val
   end,
})

while wait() do
    spawn(function()
        while AutoClickEnabled do
            wait(Slider.CurrentValue)
        
            game:GetService("ReplicatedStorage").Remotes.AddSpeed:FireServer()
        end
    end)

    spawn(function()
        while AutoRebirthEnabled do
            wait(0.1)
        
            if(game.Players.LocalPlayer.PlayerGui.MainUI.TopBar.Rebirth.Percentage.Text == "100%") then
                game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
            end
        end
    end)

    spawn(function()
        while WalkSpeedEnabled do
            wait (0.1)

            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Slider2.CurrentValue
        end
    end)

    spawn(function()
        while JumpPowerEnabled do
            wait (0.1)

            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Slider3.CurrentValue
        end
    end)
end
