# Monday.com SQL Migration Template

Inside this folder you'll find everything you need to orchestrate a SQL Server migration on Monday.com—no API gymnastics required. The PowerShell script models a side-by-side migration: detach databases, shuffle LUNs, rename servers, and reattach them in their shiny new homes.

## Files

- `SQL_Migration_Tasks.csv` – starter tasks ready for import.
- `Generate_Task_List.ps1` – conjures a full task list and exports it to CSV.

## How to Use

### 1. Prepare the Monday.com board

1. Log in to Monday.com and create a new board from scratch.
2. Name the board **SQL Migration Template - DO NOT DELETE**.
3. Create the following groups to match the migration phases:
   - *Phase 1: Planning & Assessment*
   - *Phase 2: Environment Preparation*
   - *Phase 3: Data Migration*
   - *Phase 4: Testing & Validation*
   - *Phase 5: Cutover*
   - *Phase 6: Post-Migration*
4. Add these columns to the board:
   - **Team Responsible** – People or text column
   - **Priority** – Status column
   - **Timeline** – Timeline column
   - **Dependencies** – Text or dependency column
   - **Prerequisites** – Long text column
   - **Environment** – Status or dropdown column
   - **Subitems** – enable the Subitems column

### 2. Import the starter tasks

1. From the board, choose **Import Data → Excel** and select `SQL_Migration_Tasks.csv`.
2. Map each column in the CSV to the matching column in your board.
3. When prompted for the `Group` field, pick **Create groups if don't exist** so the phase groups are created automatically.

### 3. Generate a full task list

1. Customize `Generate_Task_List.ps1` to match your environment and run it with PowerShell.
2. The script creates `Monday_Migration_Import.csv`. Import this file using the same steps as above.

Set up any automations you need, adjust the views, and you're ready to orchestrate the migration!
