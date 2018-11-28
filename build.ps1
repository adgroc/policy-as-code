foreach($parentDir in Get-ChildItem -Directory)
{
    foreach($childDir in Get-ChildItem -Path $parentDir -Directory)
    {
        if(!(Test-Path $parentDir\$childDir\policy.config.json))
        {
            throw "Required file policy.config.json does not exist in $childDir."
        }

        if(!(Test-Path $parentDir\$childDir\policy.parameters.json))
        {
            throw "Required file policy.config.json does not exist in $childDir."
        }

        if(!(Test-Path $parentDir\$childDir\policy.rules.json))
        {
            throw "Required file policy.config.json does not exist in $childDir."
        }
    }
}