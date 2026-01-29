for _, group in next, {
  'EssentialCooldownViewer',
  'UtilityCooldownViewer',
  'BuffIconCooldownViewer',
  'BCDM_PowerBar',
  'BCDM_TrinketBar',
} do
  -- hide whenever in pet battle, or when skyriding
  local listener = CreateFrame('Frame', nil, nil, 'SecureHandlerStateTemplate')
  RegisterStateDriver(listener, 'visibility', '[petbattle][bonusbar:5] hide; show')
  listener:HookScript('OnAttributeChanged', function(_, _, shouldHide)
    _G[group]:SetAlphaFromBoolean(not shouldHide, 1, 0)
  end)
end