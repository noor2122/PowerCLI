<#.Synopsis   : This script can used to get the detail of all the connected and save the results in csv file
  .Created by : Noor Mohammad
  .Ver        : 1.0 (Apr 2018)
  .Req        : PowerShell 5 and PowerCLI Module should be installed
  #>
  
  #Set the required variables
  
  $vCenter = Read-Host 'Enter the vCenter Server IP or Name'
  $Cred = Get-Credential
  $Cluster = Read-Host 'Enter the VMHost Cluster Name'
  $filepath = read-host "enter the file path where you want to save the exported file for ex. 'C:\myscripts\redmdetail.csv' "
  
  #Actual script starts here

  Connect-VIServer $vCenter

  Get-cluster $Cluster | Get-VM | Get-HardDisk -DiskType "RawPhysical","RawVirtual" | Select @{Name='VM Name';E={$_.Parent}},DiskType,ScsiCanonicalName,FileName |
   Export-Csv $filepath -NoTypeInformation
  
  Disconnect-VIServer -Confirm:$false
  
