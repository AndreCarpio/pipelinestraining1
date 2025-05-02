$xmlFilePath = ".\myApp.Tests\reports\coverage.cobertura.xml"

# Read the XML file content
$xmlContent = Get-Content -Path $xmlFilePath -Raw

# Parse the XML content
[xml]$xmlObject = $xmlContent

[float]$lineRate = $xmlObject.coverage.'line-rate'

[int32]$rate = $linerate * 100 

If($lineRate -lt 0.8){
    Throw "Lines rate coverage is less than $rate%"
}else{
    Write-Host "Lines rate coverage is $rate%"
    exit 0
}