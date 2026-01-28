# ChabUI - World of Warcraft Addon

A modular UI addon for World of Warcraft that provides quality-of-life improvements and customizations.

## Features

- **ClearHiddenQuests**: Automatically unwatches hidden quests on login
- **BCDMAnchors**: Adds ElvUI frame anchors to Better Cooldown Manager
- **CurrentExpansionOnlyAuctionHouseFilter**: Defaults auction house and crafting orders to current expansion
- **SlashWA**: Quick toggle for cooldown viewer with `/cd` and `/wa` commands
- **EndeavorProgressText**: Shows neighborhood initiative progress text on mouseover
- **SharedMedia_Chab**: Custom media assets for UI customization

## Installation

1. Download the latest release from [Releases](../../releases)
2. Extract the `ChabUI` folder to your World of Warcraft `Interface/AddOns/` directory
3. Reload UI or restart World of Warcraft
4. Enable ChabUI in the AddOns menu

## Building

The addon is modular - each feature is self-contained in the `Modules/` directory. You can disable individual modules by commenting them out in `ChabUI.toc`.

## Releases

Releases are automatically created when you push a version tag:

```bash
git tag v1.0.0
git push origin v1.0.0
```

Tags should follow semantic versioning (v1.0.0, v1.0.1, etc.).

Pre-release versions (v1.0.0-beta, v1.0.0-alpha) are automatically marked as pre-releases.

## Development

See [`.github/copilot-instructions.md`](.github/copilot-instructions.md) for development guidelines and architecture information.

## License

This addon is provided as-is for personal use.
