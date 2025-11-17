import os
import re
from collections import defaultdict
from textual.app import App, ComposeResult
from textual.containers import Container
from textual.widgets import Header, Footer, Static, DataTable, ProgressBar
from textual.binding import Binding
import asyncio
import pyperclip

class DuplicateCheckerApp(App):
    """Textual UI for Duplicate Checker with Image Checks"""

    CSS = """
    Screen { background: $surface; }
    Header { background: $primary; color: $text; text-style: bold; }
    Footer { background: $surface; color: $text; }
    .title { text-align: center; color: $primary; text-style: bold; }
    .scan-results { border: solid $accent; margin: 1; }
    .duplicate-items { border: solid $error; margin: 1; }
    .summary { border: solid $warning; margin: 1; }
    .warning { border: solid $error; background: $error 20%; margin: 1; }
    .success { border: solid $success; background: $success 20%; margin: 1; }
    """

    BINDINGS = [
        Binding("q", "quit", "Quit"),
        Binding("r", "refresh", "Refresh"),
        Binding("c", "copy_selected", "Copy Selected"),
    ]

    def __init__(self, option: int = 1, items_path: str = "", images_path: str = "", **kwargs):
        super().__init__(**kwargs)
        self.option = option
        self.items_path = items_path
        self.images_path = images_path

    def compose(self) -> ComposeResult:
        yield Header()
        yield Container(
            Static("FiveM ox_inventory Items Checker", classes="title"),
            Static(f"Running option: {self.option}", classes="title"),
            Static("Scanning items...", id="scan-status"),
            ProgressBar(total=100, show_eta=False, id="scan-progress"),
            id="main"
        )
        yield Footer()

    def on_mount(self) -> None:
        self.title = "Duplicate & Image Checker"
        self.run_worker(self.main_check(option=self.option))

    async def main_check(self, option: int) -> None:
        """Run chosen option"""
        if option == 1:
            await self.check_duplicate_images()
        elif option == 2:
            await self.check_missing_images()

    async def read_items(self):
        """Read and parse items.lua from user-provided path"""
        with open(self.items_path, "r", encoding="utf-8") as f:
            content = f.read()
        pattern = r"\[['\"]([^'\"]+)['\"]\]\s*=\s*\{"
        ids = [m.group(1) for m in re.finditer(pattern, content)]
        return ids

    async def check_duplicate_images(self):
        """Option 1: Find duplicate images"""
        status = self.query_one("#scan-status", Static)
        progress = self.query_one("#scan-progress", ProgressBar)
        main_container = self.query_one("#main", Container)

        status.update("Scanning for duplicate images...")
        progress.update(progress=0)

        # Clear old results but keep status/progress
        for child in list(main_container.children)[4:]:
            child.remove()

        # Gather all image files
        all_images = os.listdir(self.images_path)
        image_counts = defaultdict(list)
        total_images = len(all_images)

        for idx, img in enumerate(all_images):
            name = os.path.splitext(img)[0]
            image_counts[name].append(img)
            progress.update(progress=int((idx / max(1, total_images)) * 100))
            await asyncio.sleep(0.005)

        # Filter duplicates
        duplicates = {k: v for k, v in image_counts.items() if len(v) > 1}

        # Display results
        if duplicates:
            table = DataTable()
            table.add_columns("Image Name", "Files Count", "Files")
            for name, files in duplicates.items():
                table.add_row(name, str(len(files)), ", ".join(files))
            main_container.mount(table)
            main_container.mount(Static("Duplicate images found!", classes="warning"))
        else:
            main_container.mount(Static("No duplicate images found.", classes="success"))

    async def check_missing_images(self):
        """Option 2: Find missing images registered in items.lua"""
        status = self.query_one("#scan-status", Static)
        progress = self.query_one("#scan-progress", ProgressBar)
        main_container = self.query_one("#main", Container)

        status.update("Checking for missing images...")
        progress.update(progress=0)

        # Clear old results but keep status/progress
        for child in list(main_container.children)[4:]:
            child.remove()

        items = await self.read_items()
        images = os.listdir(self.images_path)
        images_set = set(os.path.splitext(img)[0] for img in images)

        missing = [item for item in items if item not in images_set]

        for idx, _ in enumerate(items):
            progress.update(progress=int((idx / max(1, len(items))) * 100))
            await asyncio.sleep(0.005)

        if missing:
            table = DataTable()
            table.add_columns("Missing Image Item")
            for item in missing:
                table.add_row(item)
            main_container.mount(table)
            main_container.mount(Static(f"Missing images found: {len(missing)}", classes="warning"))
        else:
            main_container.mount(Static("All item images exist.", classes="success"))

    def action_refresh(self) -> None:
        """Refresh the check (default to chosen option)"""
        self.run_worker(self.main_check(option=self.option))

    def action_copy_selected(self) -> None:
        """Copy selected item/image to clipboard"""
        try:
            tables = self.query(DataTable)
            if tables:
                table = tables[0]
                if table.cursor_row is not None:
                    row_data = table.get_row_at(table.cursor_row)
                    if row_data:
                        pyperclip.copy(row_data[0])
                        self.notify(f"Copied: {row_data[0]}")
        except Exception as e:
            self.notify(f"Copy failed: {e}")


def main():
    # Ask user for option
    print("Choose option:")
    print("1 = Find duplicate images")
    print("2 = Find missing images")
    option = input("Enter option (1 or 2): ").strip()
    if option not in ["1", "2"]:
        print("Invalid option, defaulting to 1")
        option = 1
    else:
        option = int(option)

    # Ask user for items.lua path
    items_path = input("Paste full path to items.lua: ").strip()
    while not os.path.isfile(items_path):
        items_path = input("Invalid file. Paste full path to items.lua: ").strip()

    # Ask user for images folder path
    images_path = input("Paste full path to images folder: ").strip()
    while not os.path.isdir(images_path):
        images_path = input("Invalid folder. Paste full path to images folder: ").strip()

    app = DuplicateCheckerApp(option=option, items_path=items_path, images_path=images_path)
    app.run()


if __name__ == "__main__":
    main()
