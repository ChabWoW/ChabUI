local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function()
	local function AddAnchorsToBCDM()
		if not C_AddOns.IsAddOnLoaded("BetterCooldownManager") then return end
		local ElvUF_Anchors = {
			["ElvUF_Player"] = "|c4080ffFFElvUI|r: Player Frame",
			["ElvUF_Target"] = "|c4080ffFFElvUI|r: Target Frame",
		}
		BCDMG:AddAnchors("ElvUI", {"Utility", "Custom", "AdditionalCustom", "Item", "ItemSpell", "Trinket"}, ElvUF_Anchors)
	end
	AddAnchorsToBCDM()
end)