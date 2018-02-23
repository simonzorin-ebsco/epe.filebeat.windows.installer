$url = "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.2.1-windows-x86_64.zip"
$output = "c:\Users\Administrator\Downloads\filebeat-6.2.1-windows-x86_64.zip"
$start_time = Get-Date

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
#Unzip File
Expand-Archive -Path $output -DestinationPath "c:\Program Files\Filebeat"

#Run Filebeat Installer
cd "C:\Program Files\Filebeat"
PowerShell.exe -ExecutionPolicy UnRestricted -File ".\filebeat-6.2.1-windows-x86_64\install-service-filebeat.ps1"

#Start Filebeat
Start-Service filebeat
