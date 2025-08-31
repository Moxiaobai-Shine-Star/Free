local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Image =
    game:HttpGet("https://raw.githubusercontent.com/Moxiaobai-Shine-Star/Dead-rails/refs/heads/main/Background.png")

if not isfile("Background.jpg") then
    writefile("Background.jpg", Image)
end

local Window =
    WindUI:CreateWindow(
    {
        Title = "日月 Xyz | 在超市生活一周",
        Icon = "rbxassetid://129260712070622",
        IconThemed = true,
        Author = "日月 Xyz | Team",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(300, 270),
        Transparent = true,
        Theme = "Dark",
        User = {
            Enabled = true,
            Callback = function()
                print("clicked")
            end,
            Anonymous = false
        },
        SideBarWidth = 200,
        HideSearchBar = true,
        ScrollBarEnabled = true,
        Background = getcustomasset("Background.jpg")
    }
)

Window:SetToggleKey(Enum.KeyCode.F)

Window:EditOpenButton(
    {
        Title = "打开UI",
        Icon = "monitor",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 2,
        Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
        Draggable = true
    }
)

Section =
    Window:Section(
    {
        Title = "主要功能",
        Opened = true
    }
)

local Main = Section:Tab({Title = "主要", Icon = "sword"})

local a = false

Main:Toggle(
    {
        Title = "自动收集食物",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                for _, v in next, workspace.Map.Util.Items:GetChildren() do
                    if v.ToolStats.ItemType.Value == "Food" then
                        game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                    end
                end
            end
        end
    }
)

Main:Toggle(
    {
        Title = "自动收集手电筒",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                for _, v in next, workspace.Map.Util.Items:GetChildren() do
                    if v.ToolStats.ItemType.Value == "Flashlight" then
                        game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                    end
                end
            end
        end
    }
)

Main:Toggle(
    {
        Title = "自动收集武器",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                for _, v in next, workspace.Map.Util.Items:GetChildren() do
                    if v.ToolStats.ItemType.Value == "Melee" then
                        game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                    end
                end
            end
        end
    }
)

Main:Toggle(
    {
        Title = "自动收集枪",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                for _, v in next, workspace.Map.Util.Items:GetChildren() do
                    if v.ToolStats.ItemType.Value == "Gun" then
                        game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                    end
                end
            end
        end
    }
)

Main:Toggle(
    {
        Title = "自动收集药品",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                for _, v in next, workspace.Map.Util.Items:GetChildren() do
                    if v.ToolStats.ItemType.Value == "Health" then
                        game:GetService("ReplicatedStorage").Remotes.RequestPickupItem:FireServer(v)
                    end
                end
            end
        end
    }
)

Main:Toggle(
    {
        Title = "自动装弹",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                game:GetService("ReplicatedStorage").Remotes.Weapon.GunReloaded:FireServer(v, 1)
            end
        end
    }
)

Main:Toggle(
    {
        Title = "修改超级枪 需在背包中",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                for _, v in next, game.Players.Backpack:GetChildren() do
                    if v.ToolStats:FindFirstChild("Ammo") then
                        v.ToolStats.ReloadTime.Value = 0
                        v.ToolStats.FireDelay.Value = 0
                        v.ToolStats.Ammo.Value = math.huge
                        v.ToolStats.Damage.Value = math.huge
                    end
                end
            end
        end
    }
)

Main:Toggle(
    {
        Title = "无限体力饥饿值",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                game.Players.LocalPlayer.Character.CharacterData.MaxStamina.Value = math.huge
                game.Players.LocalPlayer.Character.CharacterData.MaxEnergy.Value = math.huge
                game.Players.LocalPlayer.Character.CharacterData.Energy.Value =
                    game.Players.LocalPlayer.Character.CharacterData.MaxEnergy.Value
                game.Players.LocalPlayer.Character.CharacterData.Stamina.Value =
                    game.Players.LocalPlayer.Character.CharacterData.MaxStamina.Value
            end
        end
    }
)

Main:Toggle(
    {
        Title = "夜晚自动躲避",
        Default = false,
        Image = "check",
        Callback = function(state)
            a = state
            while a and task.wait() do
                if game:GetService("ReplicatedStorage").GameInfo.TimeOfDay.Value == "Night" then
                    oldpos = game.Players.LocalPlayer.Character:GetPivot().Position
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character:PivotTo(
                            CFrame.new(306.18927001953125, 36.67450714111328, -519.2435913085938)
                        )
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    until game:GetService("ReplicatedStorage").GameInfo.TimeOfDay.Value ~= "Night"
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
                else
                    task.wait()
                end
            end
        end
    }
)
