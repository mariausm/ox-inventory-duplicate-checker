# items-duplicator

This project is a simple tool for FiveM server developers using the [ox_inventory](https://github.com/overextended/ox_inventory) system.

## Purpose

The script checks your `items.lua` file for duplicate item IDs. It helps you avoid issues caused by accidentally having two or more items with the same identifier in your ox_inventory configuration.

## Features
- Scans your `items.lua` file for duplicate item IDs
- Clear and colorful output in the console
- Easy to use and fast
- Designed for FiveM servers using ox_inventory
- Helps keep your inventory unique and error-free

## Usage
1. Place `duplicate_checker.py` in the same folder as your `items.lua` file.
2. Make sure you have Python 3.x installed.
3. (Optional) For colored output, install colorama:
   ```
   pip install colorama
   ```
4. Run the script:
   ```
   python duplicate_checker.py
   ```

## What is checked?
- The script checks for **duplicate item IDs** (e.g., `['lighter']`) in your `items.lua` file.
- It does **not** check for duplicate labels or other fields.

## For what?
This tool is made specifically for ox_inventory item configuration files in FiveM servers.

---

## Keywords
FiveM, ox_inventory, item duplicate, item checker, Lua, FiveM script, inventory tool, unique item ID, FiveM resource, anti-duplicate, ox_inventory helper, server management, FiveM admin, FiveM utility

---

**Created by Marius.** 