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
    },
    @{ 
        Name = "Disaster Recovery Strategy Review"
        Group = "Phase 1: Planning & Assessment"
        TeamResponsible = "Infrastructure"
        Priority = "High"
        Duration = 3
        Prerequisites = "Compatibility assessment complete"
        Environment = "PROD"
        Dependencies = "SQL Server 2022 Compatibility Assessment"
        Subitems = "Review RPO/RTO;Validate backup strategy"
    },
    @{ 
        Name = "Migration Plan & Timeline Approval"
        Group = "Phase 1: Planning & Assessment"
        TeamResponsible = "Project Mgmt"
        Priority = "Critical"
        Duration = 2
        Prerequisites = "Disaster Recovery Strategy Review"
        Environment = "PROD"
        Dependencies = "Disaster Recovery Strategy Review"
        Subitems = "Finalize plan;Obtain stakeholder sign-off"
    },
    @{ 
        Name = "Provision SQL Server 2022 Servers"
        Group = "Phase 2: Environment Preparation"
        TeamResponsible = "Infrastructure"
        Priority = "High"
        Duration = 4
        Prerequisites = "Migration plan approved"
        Environment = "DEV"
        Subitems = "Build new servers;Apply base configuration"
    },
    @{ 
        Name = "Configure High Availability and DR"
        Group = "Phase 2: Environment Preparation"
        TeamResponsible = "Infrastructure"
        Priority = "High"
        Duration = 3
        Prerequisites = "Provision SQL Server 2022 Servers"
        Environment = "DEV"
        Dependencies = "Provision SQL Server 2022 Servers"
        Subitems = "Setup AlwaysOn;Configure log shipping"
    },
    @{ 
        Name = "Install Required SQL Extensions"
        Group = "Phase 2: Environment Preparation"
        TeamResponsible = "DBA"
        Priority = "Medium"
        Duration = 1
        Prerequisites = "Servers provisioned"
        Environment = "DEV"
        Dependencies = "Provision SQL Server 2022 Servers"
        Subitems = "Install CLR;Configure replication agents"
    },
    @{ 
        Name = "Setup Monitoring and Alerting"
        Group = "Phase 2: Environment Preparation"
        TeamResponsible = "DBA"
        Priority = "Medium"
        Duration = 2
        Prerequisites = "Servers provisioned"
        Environment = "DEV"
        Dependencies = "Install Required SQL Extensions"
        Subitems = "Configure monitoring tools;Define alerts"
    },
    @{ 
        Name = "Create Security Baseline"
        Group = "Phase 2: Environment Preparation"
        TeamResponsible = "Security"
        Priority = "High"
        Duration = 2
        Prerequisites = "Servers provisioned"
        Environment = "DEV"
        Dependencies = "Setup Monitoring and Alerting"
        Subitems = "Apply CIS benchmarks;Create audit policies"
    },
    @{ 
        Name = "Backup Source Databases"
        Group = "Phase 3: Data Migration"
        TeamResponsible = "DBA"
        Priority = "Critical"
        Duration = 2
        Prerequisites = "Security baseline complete"
        Environment = "PROD"
        Dependencies = "Create Security Baseline"
        Subitems = "Full backups;Verify backup integrity"
    },
    @{ 
        Name = "Restore Databases to Target"
        Group = "Phase 3: Data Migration"
        TeamResponsible = "DBA"
        Priority = "Critical"
        Duration = 3
        Prerequisites = "Backups completed"
        Environment = "DEV"
        Dependencies = "Backup Source Databases"
        Subitems = "Restore backups;Configure recovery models"
    },
    @{ 
        Name = "Update Schema for Compatibility"
        Group = "Phase 3: Data Migration"
        TeamResponsible = "DBA"
        Priority = "High"
        Duration = 2
        Prerequisites = "Databases restored"
        Environment = "DEV"
        Dependencies = "Restore Databases to Target"
        Subitems = "Apply scripts;Resolve deprecated features"
    },
    @{ 
        Name = "Migrate Server Logins and Permissions"
        Group = "Phase 3: Data Migration"
        TeamResponsible = "DBA"
        Priority = "High"
        Duration = 1
        Prerequisites = "Schema updated"
        Environment = "DEV"
        Dependencies = "Update Schema for Compatibility"
        Subitems = "Transfer logins;Map SIDs"
    },
    @{ 
        Name = "Migrate SQL Agent Jobs"
        Group = "Phase 3: Data Migration"
        TeamResponsible = "DBA"
        Priority = "Medium"
        Duration = 1
        Prerequisites = "Logins migrated"
        Environment = "DEV"
        Dependencies = "Migrate Server Logins and Permissions"
        Subitems = "Script out jobs;Import on target"
    },
    @{ 
        Name = "Functional Validation in Test"
        Group = "Phase 4: Testing & Validation"
        TeamResponsible = "QA"
        Priority = "High"
        Duration = 3
        Prerequisites = "Data migration complete"
        Environment = "TEST"
        Dependencies = "Migrate SQL Agent Jobs"
        Subitems = "Run smoke tests;Validate applications"
    },
    @{ 
        Name = "Performance Benchmarking"
        Group = "Phase 4: Testing & Validation"
        TeamResponsible = "QA"
        Priority = "Medium"
        Duration = 2
        Prerequisites = "Functional validation"
        Environment = "TEST"
        Dependencies = "Functional Validation in Test"
        Subitems = "Collect baselines;Compare with source"
    },
    @{ 
        Name = "User Acceptance Testing"
        Group = "Phase 4: Testing & Validation"
        TeamResponsible = "App Owners"
        Priority = "High"
        Duration = 2
        Prerequisites = "Performance benchmarking"
        Environment = "TEST"
        Dependencies = "Performance Benchmarking"
        Subitems = "Gather sign-off;Report issues"
    },
    @{ 
        Name = "Final Cutover Preparation"
        Group = "Phase 5: Cutover"
        TeamResponsible = "Project Mgmt"
        Priority = "Critical"
        Duration = 1
        Prerequisites = "UAT complete"
        Environment = "PROD"
        Dependencies = "User Acceptance Testing"
        Subitems = "Finalize schedule;Notify stakeholders"
    },
    @{ 
        Name = "Production Cutover and Verification"
        Group = "Phase 5: Cutover"
        TeamResponsible = "DBA"
        Priority = "Critical"
        Duration = 1
        Prerequisites = "Final cutover preparation"
        Environment = "PROD"
        Dependencies = "Final Cutover Preparation"
        Subitems = "Switch connection strings;Verify application"
    },
    @{ 
        Name = "Post-Migration Review and Cleanup"
        Group = "Phase 6: Post-Migration"
        TeamResponsible = "DBA"
        Priority = "Medium"
        Duration = 2
        Prerequisites = "Production cutover complete"
        Environment = "PROD"
        Dependencies = "Production Cutover and Verification"
        Subitems = "Remove legacy servers;Update documentation"
    }
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
