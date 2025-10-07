# FiveM ox_inventory Items Duplicate ID Checker

This project is a tool for FiveM server developers to check for duplicate item IDs in their [ox_inventory](https://github.com/overextended/ox_inventory) items.lua configuration.

## Purpose

The script checks your `items.lua` file for duplicate item IDs. It helps you avoid issues caused by accidentally having two or more items with the same identifier in your ox_inventory configuration.

## Features
- **Modern Textual UI** with interactive interface
- **Progress bar** with real-time scanning animation
- **Copy to clipboard** functionality for duplicate items
- **Refresh** button to re-scan items
- **Color-coded results** with red warnings for duplicates
- **Detailed statistics** showing unique vs duplicate items
- **Fast scanning** of large item files
- **Designed specifically for FiveM ox_inventory**

## Installation

### Required Python Modules
```bash
pip install textual rich pyperclip
```

### Optional (for enhanced experience)
```bash
pip install colorama
```

## Usage
1. Place `duplicate_checker.py` in the same folder as your `items.lua` file.
2. Make sure you have Python 3.8+ installed.
3. Install required modules:
   ```
   pip install textual rich pyperclip
   ```
4. Run the script:
   ```
   python duplicate_checker.py
   ```

## Interface Features
- **Interactive UI**: Modern terminal interface with buttons and tables
- **Progress Tracking**: Real-time progress bar during scanning
- **Copy Function**: Click to copy duplicate item names to clipboard
- **Refresh**: Re-scan your items.lua file
- **Color Coding**: Red warnings for duplicates, green for success

## What is checked?
- The script checks for **duplicate item IDs** (e.g., `['lighter']`) in your `items.lua` file.
- It does **not** check for duplicate labels or other fields.
- Shows detailed statistics of unique vs duplicate items

## For what?
This tool is made specifically for ox_inventory item configuration files in FiveM servers.

## Keywords
FiveM, ox_inventory, item duplicate, item checker, Lua, FiveM script, inventory tool, unique item ID, FiveM resource, anti-duplicate, ox_inventory helper, server management, FiveM admin, FiveM utility, textual UI, terminal interface, progress bar, clipboard, item detection, duplicate detection, ox_inventory items, FiveM inventory, item scanner, duplicate scanner, ox_inventory scanner, FiveM duplicate checker, inventory duplicate finder, ox_inventory duplicate finder, item ID checker, FiveM item checker, ox_inventory item checker, duplicate item finder, FiveM duplicate item finder, ox_inventory duplicate item finder, item duplicate detector, FiveM item duplicate detector, ox_inventory item duplicate detector, duplicate item scanner, FiveM duplicate item scanner, ox_inventory duplicate item scanner, item ID duplicate checker, FiveM item ID duplicate checker, ox_inventory item ID duplicate checker, duplicate item ID finder, FiveM duplicate item ID finder, ox_inventory duplicate item ID finder, item duplicate ID detector, FiveM item duplicate ID detector, ox_inventory item duplicate ID detector, duplicate item ID scanner, FiveM duplicate item ID scanner, ox_inventory duplicate item ID scanner

---

**Created by Marius.**