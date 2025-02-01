game.Workspace.CurrentCamera:Destroy()
wait(0.1)
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
game.Workspace.CurrentCamera.CameraType = "Custom"
game.Players.LocalPlayer.CameraMaxZoomDistance = 100000
game.Players.LocalPlayer.CameraMinZoomDistance = 1
game.Players.LocalPlayer.CameraMode = "Classic"
game.ReplicatedStorage.HDAdminClient.Assets.NightVision:Destroy()
prefix = game.Players.LocalPlayer.PlayerGui.HDAdminGUIs.MainFrame.Pages.Settings.Custom["AE1 Prefix"].SettingValue.TextBox.Text

game.StarterGui:SetCore("SendNotification", {Title="Family Hell - Anti-Give-All"; Text="Press G to ENABLE visibly, H to ENABLE invisibly!"; Duration=math.huge;})
game.StarterGui:SetCore("SendNotification", {Title="Family Hell - Anti-Give-All"; Text="This also disables nightvision, blur and warp!"; Duration=math.huge;})
game.ReplicatedStorage.HDAdminClient.Audio.Notice:Play()

start = game:GetService('UserInputService').InputBegan:Connect(function(input, typing)
    if input.KeyCode == Enum.KeyCode.H and not typing then
        for _, nof in pairs(game.CoreGui.RobloxGui.NotificationFrame:GetChildren()) do
            nof:Destroy()
        end
        game.ReplicatedStorage.HDAdminClient.Signals.RequestCommand:InvokeServer(prefix.."tool me all")

        game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(tool)
            wait()
            tool:Destroy()
        end)
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            game.ReplicatedStorage.HDAdminClient.Signals.RequestCommand:InvokeServer(prefix.."tool me all")
            game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(tool)
                wait()
                tool:Destroy()
            end)
        end)
        game.ReplicatedStorage.HDAdminClient.Audio.Notice:Play()
        start:Disconnect()
    end
    if input.KeyCode == Enum.KeyCode.G and not typing then
        game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(tool)
            wait()
            tool:Destroy()
        end)
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(tool)
                wait()
                tool:Destroy()
            end)
        end)
        game.StarterGui:SetCore("SendNotification", {Title="Family Hell - Anti-Give-All"; Text="ENABLED!"; Duration=math.huge;})
        game.ReplicatedStorage.HDAdminClient.Audio.Notice:Play()
        start:Disconnect()
    end
end)
