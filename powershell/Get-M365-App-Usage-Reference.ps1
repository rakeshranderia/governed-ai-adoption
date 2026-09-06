param(
    [ValidateSet('D7','D30','D90','D180')]
    [string]$Period = 'D7',
    [string]$OutputFile = ".\\M365-App-Usage-$Period.csv"
)

# Connect-MgGraph -Scopes "Reports.Read.All"
$uri = "https://graph.microsoft.com/v1.0/reports/getM365AppUserDetail(period='$Period')"
Invoke-MgGraphRequest -Method GET -Uri $uri -OutputFilePath $OutputFile
Write-Host "Usage report exported to: $OutputFile"
