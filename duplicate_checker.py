import re
from collections import defaultdict
from textual.app import App, ComposeResult
from textual.containers import Container, Horizontal, Vertical
from textual.widgets import Header, Footer, Static, DataTable, Button, ProgressBar
from textual.binding import Binding
from rich.text import Text
from rich.panel import Panel
import asyncio
import pyperclip

class DuplicateCheckerApp(App):
    """Modern Textual UI for Duplicate Checker"""
    
    CSS = """
    Screen {
        background: $surface;
    }
    
    Header {
        background: $primary;
        color: $text;
        text-style: bold;
    }
    
    Footer {
        background: $surface;
        color: $text;
    }
    
    .title {
        text-align: center;
        color: $primary;
        text-style: bold;
    }
    
    .scan-results {
        border: solid $accent;
        margin: 1;
    }
    
    .duplicate-items {
        border: solid $error;
        margin: 1;
    }
    
    .summary {
        border: solid $warning;
        margin: 1;
    }
    
    .warning {
        border: solid $error;
        background: $error 20%;
        margin: 1;
    }
    
    .success {
        border: solid $success;
        background: $success 20%;
        margin: 1;
    }
    """
    
    BINDINGS = [
        Binding("q", "quit", "Quit"),
        Binding("r", "refresh", "Refresh"),
        Binding("c", "copy_selected", "Copy Selected"),
    ]
    
    def compose(self) -> ComposeResult:
        yield Header()
        yield Container(
            Static("FiveM ox_inventory Items Duplicate ID Checker", classes="title"),
            Static("Modern Duplicate Detection Tool", classes="title"),
            Static("Scanning items...", id="scan-status"),
            ProgressBar(total=100, show_eta=False, id="scan-progress"),
            id="main"
        )
        yield Footer()
    
    def on_mount(self) -> None:
        self.title = "Duplicate Checker"
        self.sub_title = "Modern UI"
        self.run_worker(self.check_duplicates())
    
    async def check_duplicates(self) -> None:
        """Check for duplicates and update UI with progress"""
        try:
            # Update status
            status = self.query_one("#scan-status", Static)
            progress = self.query_one("#scan-progress", ProgressBar)
            
            # Step 1: Reading file
            status.update("Reading items.lua...")
            progress.update(progress=0)
            await asyncio.sleep(0.1)
            
            with open("items.lua", 'r', encoding='utf-8') as file:
                content = file.read()
            
            # Step 2: Parsing
            status.update("Parsing items...")
            progress.update(progress=5)
            await asyncio.sleep(0.1)
            
            pattern = r"\[['\"]([^'\"]+)['\"]\]\s*=\s*\{"
            ids = defaultdict(int)
            all_ids = []
            matches = re.finditer(pattern, content)
            
            # Step 3: Scanning with smooth progress
            status.update("Scanning for duplicates...")
            progress.update(progress=10)
            await asyncio.sleep(0.1)
            
            match_count = 0
            total_matches = len(list(re.finditer(pattern, content)))
            
            for match in re.finditer(pattern, content):
                item_id = match.group(1)
                all_ids.append(item_id)
                ids[item_id] += 1
                match_count += 1
                
                # Smooth progress from 10% to 90%
                current_progress = 10 + int((match_count / total_matches) * 80)
                status.update(f"Scanning items... {match_count}/{total_matches}")
                progress.update(progress=current_progress)
                await asyncio.sleep(0.01)
            
            total_ids_found = len(all_ids)
            unique_ids = len(ids)
            found_duplicates = False
            
            # Step 4: Analyzing
            status.update("Analyzing results...")
            progress.update(progress=95)
            await asyncio.sleep(0.1)
            
            # Check for duplicates
            for item_id, count in ids.items():
                if count > 1:
                    found_duplicates = True
            
            # Step 5: Finalizing
            status.update("Finalizing...")
            progress.update(progress=100)
            await asyncio.sleep(0.2)
            
            # Create main container
            main_container = self.query_one("#main", Container)
            main_container.remove_children()
            
            # Add combined scan results and summary
            combined_results = Static(
                f"Items scanned: {total_ids_found}\n"
                f"Status: {'Duplicates found' if found_duplicates else 'No duplicates'}\n"
                f"Unique: {unique_ids}\n"
                f"Duplicates: {total_ids_found - unique_ids}",
                classes="scan-results"
            )
            combined_results.border_title = "SCAN RESULTS & SUMMARY"
            main_container.mount(combined_results)
            
            # Add duplicates table if found
            if found_duplicates:
                dup_table = DataTable()
                dup_table.add_columns("Item ID", "Count", "Status")
                dup_table.cursor_type = "row"
                
                for item_id, count in ids.items():
                    if count > 1:
                        dup_table.add_row(item_id, str(count), "DUPLICATE")
                
                dup_container = Container(dup_table, classes="duplicate-items")
                dup_container.border_title = "DUPLICATE ITEMS"
                main_container.mount(dup_container)
            
            # Add final message
            if found_duplicates:
                warning = Static(
                    "DUPLICATES FOUND!\n"
                    "Remove duplicate entries from items.lua",
                    classes="warning"
                )
                warning.border_title = "WARNING"
                main_container.mount(warning)
            else:
                success = Static(
                    "ALL CLEAN!\n"
                    "No duplicates found in items.lua",
                    classes="success"
                )
                success.border_title = "SUCCESS"
                main_container.mount(success)
                
        except FileNotFoundError:
            main_container = self.query_one("#main", Container)
            main_container.remove_children()
            error = Static("File 'items.lua' not found!", classes="warning")
            error.border_title = "ERROR"
            main_container.mount(error)
        except Exception as e:
            main_container = self.query_one("#main", Container)
            main_container.remove_children()
            error = Static(f"Error: {e}", classes="warning")
            error.border_title = "ERROR"
            main_container.mount(error)
    
    def action_refresh(self) -> None:
        """Refresh the duplicate check"""
        # Reset the main container
        main_container = self.query_one("#main", Container)
        main_container.remove_children()
        
        # Re-add the initial elements
        main_container.mount(Static("FiveM ox_inventory Items Duplicate ID Checker", classes="title"))
        main_container.mount(Static("Modern Duplicate Detection Tool", classes="title"))
        main_container.mount(Static("Scanning items...", id="scan-status"))
        main_container.mount(ProgressBar(total=100, show_eta=False, id="scan-progress"))
        
        # Start the check
        self.run_worker(self.check_duplicates())
    
    def action_copy_selected(self) -> None:
        """Copy selected duplicate item name to clipboard"""
        try:
            # Find the duplicate table
            dup_tables = self.query(DataTable)
            if dup_tables:
                dup_table = dup_tables[0]  # Get first table
                if hasattr(dup_table, 'cursor_row') and dup_table.cursor_row is not None:
                    # Get the selected row data
                    row_data = dup_table.get_row_at(dup_table.cursor_row)
                    if row_data and len(row_data) > 0:
                        item_name = row_data[0]  # First column is Item ID
                        pyperclip.copy(item_name)
                        # Show confirmation
                        self.notify(f"Copied: {item_name}", title="Success")
                    else:
                        self.notify("No item selected", title="Error")
                else:
                    self.notify("Please select an item first", title="Error")
            else:
                self.notify("No duplicate table found", title="Error")
        except Exception as e:
            self.notify(f"Copy failed: {e}", title="Error")

def main():
    app = DuplicateCheckerApp()
    app.run()

if __name__ == "__main__":
    main()