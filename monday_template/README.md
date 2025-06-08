# Monday.com SQL Migration Template

This folder contains resources to set up a SQL migration project in Monday.com without using the API. Use the provided CSV file for bulk task import and the PowerShell script to generate additional tasks if required.

## Files

- `SQL_Migration_Tasks.csv` – example import file with basic columns.
- `Generate_Task_List.ps1` – script to build a full task list and export to CSV.

## Usage

1. In Monday.com, create a new board named `SQL Migration Template - DO NOT DELETE` and add the columns and groups described in the main project documentation.
2. Import `SQL_Migration_Tasks.csv` via **Import Data → Excel** and map the columns accordingly. Select **Create groups if don't exist** when mapping the `Group` column.
3. After importing, configure the automation rules and views as needed. Consult the template documentation for detailed steps.

To generate a custom task list, edit `Generate_Task_List.ps1` and run it with PowerShell. The script creates `Monday_Migration_Import.csv`, which you can then import into Monday.com.
