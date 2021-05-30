$SERVER = "SERVER YOU WANT TO ENABLE SSO ON"
$WAC = "WAC SERVER NAME"

Set-ADComputer -Identity (Get-ADComputer $SERVER) -PrincipalsAllowedToDelegateToAccount (Get-ADComputer $WAC)
