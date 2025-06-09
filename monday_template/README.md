# Monday.com SQL Migration Template

Inside this folder you'll find everything you need to orchestrate a SQL Server migration on Monday.com—no API gymnastics required. The PowerShell script models a side-by-side migration: detach databases, shuffle LUNs, rename servers, and reattach them in their shiny new homes.

## Files

- `SQL_Migration_Tasks.csv` – starter tasks ready for import.
- `Generate_Task_List.ps1` – conjures a full task list and exports it to CSV.

## How to Use

1. In Monday.com, create a board named `SQL Migration Template - DO NOT DELETE` and add the columns and groups described in the main docs.
2. Import `SQL_Migration_Tasks.csv` via **Import Data → Excel** and map the columns. Choose **Create groups if don't exist** for the `Group` column.
3. Customize `Generate_Task_List.ps1` to match your environment and run it with PowerShell. It will produce `Monday_Migration_Import.csv` for you to import.

Set up your automations, adjust the views, and you're off to the migration races!
