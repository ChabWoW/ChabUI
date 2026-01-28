local frame = HousingDashboardFrame.HouseInfoContent.ContentFrame.InitiativesFrame.InitiativeSetFrame.ProgressBar

if frame then
    frame:HookScript("OnEnter", function()
        HousingDashboardFrame.HouseInfoContent.ContentFrame.InitiativesFrame.InitiativeSetFrame.ProgressBar.TextContainer.ProgressText:Show()
    end)
    frame:HookScript("OnLeave", function()
        HousingDashboardFrame.HouseInfoContent.ContentFrame.InitiativesFrame.InitiativeSetFrame.ProgressBar.TextContainer.ProgressText:Hide()
    end)
end
