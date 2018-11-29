param([string] $subscriptionId,
      [string] $managementGroupName,
      [string] $resourceGroupName)

if(!$subscriptionId -and !$managementGroupName)
{
    Write-Error "Unable to create policy: `$(SubscriptionId) '$subscriptionId' or `$(ManagementGroupName) '$managementGroupName' were not provided. Either may be provided, but not both."
}

if ($subscriptionId -and $managementGroupName)
{
    Write-Error "Unable to create policy: `$(SubscriptionId) '$subscriptionId' and `$(ManagementGroupName) '$managementGroupName' were both provided. Either may be provided, but not both."
}

if ($managementGroupName -and $resourceGroupName)
{
    Write-Error "Unable to create policy: `$(ManagementGroupName) '$managementGroupName' and `$(ResourceGroupName) '$resourceGroupName' were both provided. Either may be provided, but not both."
}