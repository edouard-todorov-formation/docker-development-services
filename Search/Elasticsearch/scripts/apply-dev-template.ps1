$templatePath = Join-Path `
    $PSScriptRoot `
    "..\config\templates\dev-default-template.json"

$templatePath = (Resolve-Path $templatePath).Path

$response = Invoke-RestMethod `
    -Method PUT `
    -ContentType "application/json" `
    -Uri "http://localhost:9200/_index_template/dev-default" `
    -InFile $templatePath

Write-Host ""
Write-Host "Template dev-default applique avec succes."
Write-Host ""

$response