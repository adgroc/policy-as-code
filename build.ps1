foreach($parentDir in Get-ChildItem -Directory)
{
    foreach($childDir in Get-ChildItem -Path $parentDir -Directory)
    {
        if(!(Test-Path $parentDir\$childDir\policy.config.json))
        {
            Write-Error "Required file policy.config.json does not exist in $childDir."
            exit 1
        }

        if(!(Test-Path $parentDir\$childDir\policy.parameters.json))
        {
            Write-Error "Required file policy.config.json does not exist in $childDir."
            exit 1
        }

        if(!(Test-Path $parentDir\$childDir\policy.rules.json))
        {
            Write-Error "Required file policy.config.json does not exist in $childDir."
            exit 1
        }

        $configFile = "$parentDir\$childDir\policy.config.json"

        $policyName  = (Get-Content $configFile | ConvertFrom-Json).config.policyName.value
        
        if(!$policyName)
        {
            Write-Error "Required parameter policyName not specified in $configFile."
            exit 1
        }

        $policyDisplayName = (Get-Content $configFile | ConvertFrom-Json).config.policyDisplayName.value

        if(!$policyDisplayName)
        {
            Write-Warning "Optional parameter policyDisplayName not specified in $configFile"
        }

        $policyDescription = (Get-Content $configFile | ConvertFrom-Json).config.policyDescription.value

        if(!$policyDescription)
        {
            Write-Warning "Optional parameter policyDescription not specified in $configFile"
        }

        $assignmentName = (Get-Content $configFile | ConvertFrom-Json).config.assignmentName.value

        if(!$assignmentName)
        {
            Write-Error "Required parameter assignmentName not specified in $configFile."
            exit 1
        }

        $assignmentDisplayName = (Get-Content $configFile | ConvertFrom-Json).config.assignmentDisplayName.value

        if(!$assignmentDisplayName)
        {
            Write-Warning "Required parameter assignmentDisplayName not specified in $configFile."
        }

        $assignmentDescription = (Get-Content $configFile | ConvertFrom-Json).config.assignmentDescription.value

        if(!$assignmentDescription)
        {
            Write-Warning "Required parameter assignmentDescription not specified in $configFile."
        }

        $policySetName = (Get-Content $configFile | ConvertFrom-Json).config.policySetName.value

        if(!$policySetName)
        {
            Write-Warning "Required parameter policySetName not specified in $configFile."
        }
    }
}