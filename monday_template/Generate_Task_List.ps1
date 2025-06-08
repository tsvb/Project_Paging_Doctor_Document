# Generate Monday.com Import Excel
$tasks = @(
    # Phase 1: Planning & Assessment
    @{
        Name = "Database Inventory & Documentation"
        Group = "Phase 1: Planning & Assessment"
        TeamResponsible = "DBA"
        Priority = "High"
        Duration = 5
        Prerequisites = "None"
        Environment = "PROD"
        Subitems = "Document all databases;Map dependencies;Identify linked servers"
    },
    @{
        Name = "SQL Server 2022 Compatibility Assessment"
        Group = "Phase 1: Planning & Assessment"
        TeamResponsible = "DBA"
        Priority = "Critical"
        Duration = 4
        Prerequisites = "Database inventory complete"
        Environment = "PROD"
        Dependencies = "Database Inventory & Documentation"
        Subitems = "Run assessment tool;Review deprecated features;Plan remediation"
    }
    # Add all tasks here...
)

# Calculate timeline
$startDate = Get-Date "2024-01-15"
$exportData = @()

foreach ($task in $tasks) {
    $endDate = $startDate.AddDays($task.Duration - 1)
    $timeline = "{0} - {1}" -f $startDate.ToString("yyyy-MM-dd"), $endDate.ToString("yyyy-MM-dd")

    $exportData += [PSCustomObject]@{
        Name = $task.Name
        Group = $task.Group
        "Team Responsible" = $task.TeamResponsible
        Priority = $task.Priority
        Timeline = $timeline
        Dependencies = $task.Dependencies
        Prerequisites = $task.Prerequisites
        Environment = $task.Environment
        Subitems = $task.Subitems
    }

    $startDate = $startDate.AddDays(1)
}

$exportData | Export-Csv -Path "Monday_Migration_Import.csv" -NoTypeInformation
Write-Host "CSV file created successfully!"
