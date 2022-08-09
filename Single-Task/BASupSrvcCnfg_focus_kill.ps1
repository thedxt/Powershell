# Kills off BASupSrvcCnfg as it randomly steals focus
# author theDXT

function Kill-FocusKiller {
if(Get-Process "BASupSrvcCnfg" -ErrorAction SilentlyContinue){
Write-host "------------------------------"
Write-host "The Focus Stealer is back"
Write-host "Killing BASupSrvcCnfg"
Get-Process "BASupSrvcCnfg" | Stop-Process
Write-host "The focus stealer BASupSrvcCnfg has been killed"
Write-host "------------------------------"
}else{
Write-host "Nothing to do. I'll be back"}
}

# forever loop as it does come back randomly
While (1){
Kill-FocusKiller
start-sleep -seconds 1
}
