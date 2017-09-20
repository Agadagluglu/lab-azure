$RGName = 'RG-azure-lab'
$location = 'Westeurope'

try {
    New-AzureRmResourceGroup -Name $RGName -Location $location -ErrorAction Stop
    Write-Host 'RG $RGName already exists.'
}
catch {
    New-AzureRmResourceGroup -Name $RGName -Location $location
}

New-AzureRmResourceGroupDeployment -Name DeployLab `
-ResourceGroupName $RGName -TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json -Verbose