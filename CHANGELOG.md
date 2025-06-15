# Changelog

All notable changes to the RecyclingTools mod will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned Features
- Configurable metal bit quantities via config file
- Optional stick recovery from dismantling as separate recipes
- Support for modded metals from other mods
- **Container recycling for baskets and other storage items**
- Recipe adaptation based on tool durability (more recovery for less worn tools)

## [1.3.1] - 2025-06-15

### Fixed
- Fixed missing copper variant in hammer dismantling recipe - copper hammers can now be dismantled
- Added missing spear dismantling recipe to recover spearheads  
- **Fixed axe disappearing when dismantling hammers and helve hammers** - axes now properly lose durability instead of being consumed
- All basic metal tools can now be properly dismantled and recycled

### Technical
- Added missing `isTool: true` and `toolDurabilityCost` properties to hammer dismantling recipes
- Ensured consistent tool behavior across all dismantling operations

## [1.3.0] - 2025-05-22

### Added
- **Metal Recovery System**: Comprehensive metal recycling system for tools and tool parts
  - Two-stage recycling process: First dismantle tools to recover parts, then process parts to recover metal bits
  - Support for various tools including knives, axes, swords, pickaxes, and more
  - Material hierarchy respect: Base metal tools can only be processed with equal or higher hardness chisels
  - Balanced recovery rates: 
    - Small items (arrowheads): 1-2 metal bits 
    - Medium items (knife blades, axe heads): 3-5 metal bits
    - Large items (helve hammer heads): 8-10 metal bits
    - Very large items (anvil parts): 15-20 metal bits
  - Steel chisels provide better efficiency with less durability cost and more recovered material

### Features
- Appropriate naming and labels for all recycling recipes
- Consistent recipe format for easy mod maintenance and expansion
- Economic balance to ensure recycling remains valuable but not exploitable
- Integration with xSkills mod forging mechanics 
- Durability transfer from tools to recovered parts

### Technical
- Organized recipe structure in JSON files
- Consistent use of tool durability costs based on metal hardness
- Standardized metal type handling for all supported metals
- Simplified recipe structure for easier maintenance

### Balance
- Recovery rates adjusted based on original crafting costs
- Steel chisel bonus for skilled crafters (+1 to +5 metal bits depending on item size)
- Balanced durability costs for processing tools

### Known Issues
- Tool dismantling with the same tool type (e.g., axe to axe) can cause conflicts and requires using different tools for dismantling

## [1.2.1] - 2025-05-18

### Added
- Flint spearhead recycling: 1 flint spearhead → 3 flint chips
- Flint arrowhead recycling: 2 flint arrowheads → 1 flint chip

## [1.2.0] - 2025-05-14

### Added
- **Container Recycling System**
  - Linen sack recycling: knife → 2 flaxtwine, shears → 3 flaxtwine
  - Hunterbag recycling with material choice: knife → cattailtops, shears → hide pelts
  - Backpack recycling: recover leather with different efficiency (knife vs shears)
  - Normal backpack: knife → 3 leather, shears → 5 leather
  - Sturdy backpack: knife → 4 leather, shears → 6 leather

### Features
- Shears generally more efficient than knives for container recycling
- Shapeless crafting for user convenience
- Approximately 50% material recovery rate with shears

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