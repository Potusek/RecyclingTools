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

## [1.4.1] - 2025-06-23

### Added
- **Stonepath splitting recipes**: Convert full stone paths into slabs using shovels
  - Premium option: shovel + soil + stonepath → 2 slabs (no material loss)
  - Budget option: shovel + stonepath → 1 slab (50% material loss)
- **Recipe grouping system**: All recycling recipes now grouped by tool type for better UI organization

### Improved
- **Enhanced UI experience**: Recipes are now logically grouped in the crafting interface
  - Group 1320: Copper chisel recipes
  - Group 1321: Bronze chisel recipes  
  - Group 1322: Iron chisel recipes
  - Group 1323: Steel chisel recipes
- **Better recipe discoverability**: Players can easily see all available options for each tool type
- **Cleaner crafting interface**: Reduced clutter by grouping related recipes together

### Technical
- Added `recipeGroup` properties to all recycling recipes for consistent UI presentation
- Organized recipes by tool compatibility rather than output type

## [1.4.0] - 2025-06-18

### 🚨 Breaking Changes
- **Removed tool dismantling exploit**: Tools can no longer be dismantled into parts and reassembled at full durability
- **Replaced two-stage recycling system**: Direct tool recycling now bypasses intermediate tool parts

### Added
- **New item: Metal Scrap** - intermediate recycling product for all metal tools
- **Direct tool recycling system**: Tools are now recycled directly into metal scrap using chisels
- **Conversion recipe**: 2 metal scraps → 1 metal bit for final processing
- **Material hierarchy preservation**: Higher-tier chisels provide better efficiency and durability

### Changed
- **Recycling economics rebalanced**: 
  - Complete tools yield 50% less metal than processing individual parts would have
  - Recovery rates now range from 10-25% of original crafting cost (1 ingot = 20 metal bits)
  - Steel chisels provide +1-2 bonus scrap and consume less durability
- **Tool recycling philosophy**: Shifted from "repair alternative" to "salvage system"
- **Recipe organization**: All tool recycling now follows consistent chisel + tool → metal scrap pattern

### Removed
- **Tool dismantling recipes**: No longer possible to dismantle complete tools into reusable parts
- **Exploit prevention**: Eliminates the ability to "repair" tools by dismantling and reassembling

### Technical Details
- Metal scrap uses ingot textures with custom transforms for visual consistency
- Recipes organized by metal tier compatibility (copper/bronze/iron/steel chisels)
- Balanced durability costs: 2-6 points per recycling operation depending on chisel quality
- All recipes support shapeless crafting for user convenience

### Balance Notes
- **Recovery rates by tool type**:
  - Arrows: ~22% (cost: 2.2 metal bits from 9 per ingot)
  - Hammers: ~20% (cost: 20 metal bits, recover 4)
  - Axes/Pickaxes/Shovels: ~15% (cost: 20 metal bits, recover 3)
  - Knives/Small tools: ~10% (cost: 20 metal bits, recover 2)
- Steel chisel efficiency bonus encourages skill progression
- System designed to make recycling valuable but not exploitable

### Why This Change?
This update addresses community feedback about an unintended exploit where players could effectively "repair" tools by dismantling them into parts and reassembling at full durability. The new system maintains the core recycling functionality while ensuring it serves its intended purpose as a salvage mechanism rather than a repair alternative.

### Migration Notes
- Existing tool parts (axeheads, hammerheads, etc.) can still be recycled using the old part-based system
- No existing saves will be broken, but the dismantling recipes are no longer available
- Players are encouraged to process any stockpiled damaged tools through the new direct recycling system

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