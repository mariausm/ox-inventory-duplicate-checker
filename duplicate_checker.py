import re
from collections import defaultdict
from colorama import init, Fore, Style

init(autoreset=True)

def print_frame(title, content_lines, color=Fore.YELLOW):
    width = max(len(title), *(len(line) for line in content_lines)) + 4
    print(color + '╔' + '═' * (width - 2) + '╗')
    print(color + f'║ {title.ljust(width - 3)}║')
    print(color + '╠' + '═' * (width - 2) + '╣')
    for line in content_lines:
        print(color + f'║ {line.ljust(width - 3)}║')
    print(color + '╚' + '═' * (width - 2) + '╝' + Style.RESET_ALL)

def check_duplicates_by_id(file_path):
    """
    Checks items.lua for duplicate item IDs
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
        pattern = r"\[['\"]([^'\"]+)['\"]\]\s*=\s*\{"  # Find all item IDs
        ids = defaultdict(int)
        matches = re.finditer(pattern, content)
        for match in matches:
            item_id = match.group(1)
            ids[item_id] += 1
        found_duplicates = False
        dubl_lines = [f'Total item IDs found: {len(ids)}', '']
        for item_id, count in ids.items():
            if count > 1:
                found_duplicates = True
                dubl_lines.append(Fore.RED + f'⚠️  DUPLICATE!  Item ID: {item_id}  (count: {count})' + Style.RESET_ALL)
        if not found_duplicates:
            dubl_lines.append(Fore.GREEN + '✅ No duplicate item IDs found!' + Style.RESET_ALL)
        stat_lines = [f'Unique item IDs: {len(ids)}']
        print_frame('ITEM ID DUPLICATE CHECK', dubl_lines, color=Fore.YELLOW)
        print_frame('STATISTICS', stat_lines, color=Fore.YELLOW)
        return found_duplicates
    except FileNotFoundError:
        print_frame('ERROR', [Fore.RED + f'❌ File "{file_path}" not found!' + Style.RESET_ALL], color=Fore.RED)
        return False
    except Exception as e:
        print_frame('ERROR', [Fore.RED + f'❌ Error: {e}' + Style.RESET_ALL], color=Fore.RED)
        return False

def main():
    print(Fore.YELLOW + '═' * 40)
    print(Fore.YELLOW + ' FiveM Items Duplicate ID Checker '.center(40, '═'))
    print(Fore.YELLOW + '═' * 40 + Style.RESET_ALL)
    file_path = "items.lua"
    has_duplicates = check_duplicates_by_id(file_path)
    if has_duplicates:
        print(Fore.RED + '\n⚠️  DUPLICATE ITEM IDs FOUND! Please resolve them.' + Style.RESET_ALL)
    else:
        print(Fore.GREEN + '\n✅ All item IDs are unique!' + Style.RESET_ALL)

if __name__ == "__main__":
    main()