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

## [1.0.2] - 2025-05-13

### Added
- Flint tool recycling system
- New item: Flint Chips
- Hammer-based salvaging of flint tools
- Recipe to process flint chips into silica dust via popping and grinding

### Recipes Added
- 2 flint axes/spades/knives/hoes → 1 flint chip
- 4 flint spears → 1 flint chip  
- 12 flint arrowheads → 1 flint chip
- Flint chips can be popped on firepit and ground into silica dust

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