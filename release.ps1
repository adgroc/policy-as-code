$resourceGroupName = "$(ResourceGroupName)"
$subscriptionId = "$(SubscriptionId)"
$managementGroupName = "$(ManagementGroupName)"

if(!$subscriptionId -and !$managementGroupName)
{
    Write-Error "Unable to create policy assignment: `$(SubscriptionId) '$subscriptionId' or `$(ManagementGroupName) '$managementGroupName' were not provided. Either may be provided, but not both."
}

if ($subscriptionId -and $managementGroupName)
{
    Write-Error "Unable to create policy assignment: `$(SubscriptionId) '$subscriptionId' and `$(ManagementGroupName) '$managementGroupName' were both provided. Either may be provided, but not both."
}

if ($managementGroupName -and $resourceGroupName)
{
    Write-Error "Unable to create policy assignment: `$(ManagementGroupName) '$managementGroupName' and `$(ResourceGroupName) '$resourceGroupName' were both provided. Either may be provided, but not both."
}

if ($managementGroupName)
{
    $scope = "/providers/Microsoft.Management/managementGroups/$managementGroupName"
    $searchParameters = @{ManagementGroupName=$managementGroupName}
}
else
{
    if (!$subscriptionId)
    {
        $subscription = Get-AzureRmContext | Select-Object -Property Subscription
        $subscriptionId = $subscription.Id
    }

    $scope = "/subscriptions/$subscriptionId"
    $searchParameters = @{SubscriptionId=$subscriptionId}
    
    if ($resourceGroupName)
    {
        $scope += "/resourceGroups/$resourceGroupName"
    }
}