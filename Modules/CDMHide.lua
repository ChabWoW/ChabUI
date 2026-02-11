local tblCDMFrames   = {
  'EssentialCooldownViewer',
  'UtilityCooldownViewer',
  'BuffIconCooldownViewer',
} 


if  C_AddOns.IsAddOnLoaded("BetterCooldownManager") then
  tblCDMFrames[#tblCDMFrames + 1] = 'BCDM_PowerBar'
  tblCDMFrames[#tblCDMFrames + 1] = 'BCDM_SecondaryPowerBar'
  tblCDMFrames[#tblCDMFrames + 1] = 'BCDM_TrinketBar'
  tblCDMFrames[#tblCDMFrames + 1] = 'BCDM_CustomCooldownViewer'
end

for _, group in next, tblCDMFrames do
  -- hide whenever in pet battle, or when skyriding
  local listener = CreateFrame('Frame', nil, nil, 'SecureHandlerStateTemplate')
  RegisterStateDriver(listener, 'visibility', '[petbattle][bonusbar:5] hide; show')
  listener:HookScript('OnAttributeChanged', function(_, _, shouldHide)
    if _G[group] then
      _G[group]:SetAlphaFromBoolean(not shouldHide, 1, 0)
    end
  end)
end