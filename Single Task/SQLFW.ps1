New-NetFirewallRule -DisplayName "SQL Server Connection" -Direction Inbound -LocalPort 1433 -Protocol TCP -Action Allow
