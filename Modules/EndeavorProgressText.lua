local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function()
    EventRegistry:RegisterCallback("HousingDashboard.Toggled", function(isShown)
        if isShown then
            -- Your code here when HousingDashboardFrame shows
            local progressBar = HousingDashboardFrame.HouseInfoContent.ContentFrame.InitiativesFrame.InitiativeSetFrame.ProgressBar
            if progressBar then
                    progressBar:HookScript("OnEnter", function()
                        HousingDashboardFrame.HouseInfoContent.ContentFrame.InitiativesFrame.InitiativeSetFrame.ProgressBar.TextContainer.ProgressText:Show()
                    end)
                    progressBar:HookScript("OnLeave", function()
                        HousingDashboardFrame.HouseInfoContent.ContentFrame.InitiativesFrame.InitiativeSetFrame.ProgressBar.TextContainer.ProgressText:Hide()
                    end)
                end
        end
    end)
end)