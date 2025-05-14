# Changelog

All notable changes to the RecyclingTools mod will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned Features
- Additional tool recycling recipes (prospecting picks, saws, etc.)
- Configurable metal bit quantities
- Optional stick recovery from dismantling
- Support for modded metals

## [1.1.0] - 2025-05-14

### Added
- **Flint Tool Recycling System**
  - New item: Flint Chips - small fragments of flint for recycling
  - Hammer-based salvaging of flint tools and weapons
  - Calcining process: flint chips → calcined flint → powder → silica dust
  
### Recipes Added
- 1 flint axe → 3 flint chips
- 1 flint spade → 3 flint chips  
- 1 flint knife → 3 flint chips
- 1 flint hoe → 3 flint chips
- 1 flint spear → 3 flint chips
- 2 flint arrows → 1 flint chip
- 6 flint chips → 1 calcined flint (via smelting)

### Features
- Support for both regular flint and bone-hafted flint tools
- Hammer durability cost: 20-30 per salvage operation
- Flint chips can be processed same as regular flint (popping → grinding)
- Full handbook documentation for all recipes

### Known Issues
- Flint chips from damaged tools may not stack properly with those from pristine tools
- Workaround: Use separate stacks or combine through crafting

## [1.0.1] - 2025-05-11

### Fixed
- Fixed mod packaging issues causing incorrect directory structure on Linux servers
- Paths in the ZIP archive now use forward slashes for cross-platform compatibility
- Added MSBuild project file (.csproj) for consistent packaging

### Added
- MSBuild-based packaging system for reliable cross-platform deployment
- .editorconfig for consistent file formatting

### Technical Details
- Implemented automated build and packaging using dotnet CLI
- Package structure now compatible with both Windows and Linux servers

## [1.0.0] - 2025-05-11

### Added
- Initial release of RecyclingTools mod
- Helve hammer dismantling recipe (axe + helve hammer → hammer head)
- Metal salvaging from hammer heads (chisel + hammer head → 20 metal bits)
- Metal salvaging from pounder caps (chisel + pounder cap → 10 metal bits)
- Support for all metal types: tin bronze, bismuth bronze, black bronze, iron, meteoric iron, and steel
- Tool durability cost for salvaging operations (50 durability per use)
- Mod icon and basic documentation

### Technical Details
- Uses `allowedVariants` for metal type restrictions
- Implements variable substitution with `{metal}` syntax
- Content-only mod (no C# code required)
- Compatible with Vintage Story 1.20.10+