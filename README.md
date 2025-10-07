# FiveM ox_inventory Duplicate Item Checker

Tool to find duplicate item IDs in [ox_inventory](https://github.com/CommunityOx/ox_inventory) `items.lua` files.

## What it does
Scans your `items.lua` file and finds duplicate item IDs that can cause server errors.

## Features
- **Interactive UI** - Modern terminal interface
- **Progress bar** - Shows scanning progress
- **Copy duplicates** - Copy item names to clipboard
- **Fast scanning** - Works with large files
- **Clear results** - Shows exactly what duplicates were found

## Example Output

![Console Example](console.svg)

## Installation
```bash
pip install -r requirements.txt
```

## Usage
1. Put `duplicate_checker.py` in same folder as `items.lua`
2. Run: `python duplicate_checker.py`
3. Use keyboard shortcuts:
   - `R` - Refresh scan
   - `C` - Copy selected duplicate
   - `Q` - Quit

## What it checks
- Finds duplicate item IDs like `['lighter']` in your `items.lua`
- Shows how many times each item appears
- Only checks item IDs, not labels or other fields

## License
MIT License - see [LICENSE](LICENSE) file for details.

**Created by Marius.**