This project is a World of Warcraft addon written in Lua. Instructions for AI coding agents supporting development.

## Project Overview

ChabUI is a minimal UI addon for WoW that provides targeted quality-of-life enhancements across multiple systems (quest tracking, auction house filtering, UI anchoring, progress indicators). It operates as a collection of independent modules loaded via `.toc` manifest, with no monolithic application state.

## Architecture

**Module-Based Design**: Each module in `Modules/` is independent and self-contained. Modules typically:
- Create a single Frame and register for specific WoW events (see `ClearHiddenQuests.lua`, `EndeavorProgressText.lua`)
- Use `EventRegistry:RegisterCallback` or `EventRegistry:RegisterFrameEventAndCallback` for modern event registration (see `CurrentExpansionOnlyAuctionHouseFilter.lua`)
- Perform initialization on `PLAYER_ENTERING_WORLD` or specific UI frame show events
- Use `C_Timer.After(0, callback)` to defer execution after UI layout completes (see `CurrentExpansionOnlyAuctionHouseFilter.lua`)

**Load Order** defined in `ChabUI.toc` (lines 6-12). Interface version targets 120000+ (WoW 10.x).

**SharedMedia Integration**: `Modules/SharedMedia_Chab/MyMedia.lua` registers custom media assets with `LibStub("LibSharedMedia-3.0")` for borders, fonts, and status bars.

## Code Patterns

**Event Registration Pattern**:
```lua
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function()
    -- initialization code
end)
```

**Modern EventRegistry Pattern** (preferred for new code):
```lua
EventRegistry:RegisterFrameEventAndCallback("EVENT_NAME", function()
    -- callback logic
end)
```

**UI Hook Pattern** (for modifying existing frames):
```lua
-- Defer execution to allow UI layout to complete
C_Timer.After(0, function()
    targetFrame:HookScript("OnShow", function()
        -- modify frame state
    end)
end)
```

**Conditional Addon Loading**:
```lua
if not C_AddOns.IsAddOnLoaded("AddonName") then return end
```

## Essential WoW API Usage

- **Quest System**: `C_QuestLog.GetNumQuestLogEntries()`, `C_QuestLog.GetInfo(index)`, `C_QuestLog.RemoveQuestWatch(questID)`
- **Auction House**: `Enum.AuctionHouseFilter.*` for filter state, access frames via `AuctionHouseFrame.SearchBar`
- **Housing/Activities**: `EventRegistry:RegisterCallback("HousingDashboard.Toggled", callback)`
- **UI Timing**: Use `C_Timer.After(0, callback)` to run after event/layout processing
- **Slash Commands**: Define with `SLASH_CMDNAME1 = "/command"` and `SlashCmdList.CMDNAME = function(msg) end`

## Coding Conventions

- **Namespacing**: Use `local addonName, Private = ...` (see `CurrentExpansionOnlyAuctionHouseFilter.lua`) for modules that need to pass private data
- **Scope**: Always use `local` for functions and variables; minimize globals
- **String Formatting**: Use `string.format()` for debug output (see `ClearHiddenQuests.lua`)
- **Conditional Logic**: Gate features behind `C_AddOns.IsAddOnLoaded()` for cross-addon compatibility

## Options Panel Architecture

**Central Options System**: `Modules/OptionsPanel.lua` manages all module settings and WoW Settings panel integration.

**Module Registration Pattern** - Each module can register its settings with the central panel:
```lua
-- In each module file
local moduleConfig = {
    name = "Module Display Name",
    enabled = true,  -- persisted in SavedVariables
    settings = {
        someSetting = "defaultValue",
        anotherOption = false,
    }
}
-- Register with OptionsPanel via callback or exported function
```

**Settings Persistence**:
- All module settings stored in `ChabUI` SavedVariables table
- Load from SavedVariables on `PLAYER_LOGIN` before modules initialize
- Modules should check their enabled state and respect saved settings

**WoW Settings Panel Integration**:
- Use `InterfaceOptions.AddCategory()` and `InterfaceOptions.AddCategoryAndLayout()` for WoW 10.x+
- Create category with toggle for each module's enable/disable
- Module-specific settings as checkboxes/dropdowns below enable toggle
- Changes apply immediately and persist to SavedVariables

**Module Initialization Respect**:
- Check `ChabUI.modules[moduleName].enabled` before performing initialization
- Use early returns in event handlers if module is disabled
- Example: `if not ChabUI.modules.ClearHiddenQuests.enabled then return end`

## Testing & Validation

- Test in-game in target expansion (Interface 120000+)
- Use `print()` for debug output and user feedback
- Verify frames exist before accessing (e.g., check `HousingDashboardFrame` before hooking)
- Test out-of-combat restrictions with `InCombatLockdown()` (see `SlashWA.lua`)

## Key Files

- `ChabUI.toc`: Addon manifest and load order
- `Modules/ClearHiddenQuests.lua`: Quest filtering example
- `Modules/CurrentExpansionOnlyAuctionHouseFilter.lua`: UI hooking and EventRegistry pattern
- `Modules/SharedMedia_Chab/MyMedia.lua`: LibSharedMedia integration

