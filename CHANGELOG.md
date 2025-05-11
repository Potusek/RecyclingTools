# Changelog

## [1.0.0] - 2025-01-11

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
- Compatible with Vintage Story 1.20.4+

## [Unreleased]

### Planned Features
- Additional tool recycling recipes (prospecting picks, saws, etc.)
- Configurable metal bit quantities
- Optional stick recovery from dismantling
- Support for modded metals