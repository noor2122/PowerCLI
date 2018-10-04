<#
synopsis   : This script is to find and start a service on local or remote server
Version    : 1.0
Created by : Noor Mohammad
Requirment : You need to run this script from within your domain network to query a remote server, this is required for passthrough login on remote machine
#>

#server name
$Servername = read-host 'Enter server name were you want to query the service'

#Service display name
$svc = read-host 'Enter the service name you want to start'

#To find the actual service name
$Svcname = (Get-Service -ComputerName $ServerName -DisplayName $svc).name

#find the service status
$svcstatus = Get-Service -ComputerName $ServerName -Name $svcname | select -ExpandProperty status

#Start the service
if($svcstatus -eq 'stopped')
     {Set-Service -name $Svcname -ComputerName $Servername -Status Running}

else{Write-Host $svc is already in running state -BackgroundColor Cyan -ForegroundColor DarkGreen}

Read-Host "Press any Key to exit"


