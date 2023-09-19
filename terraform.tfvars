# Specify the location
location = "eastus"

# Name of the resource group for service health
alert_resource_group_name = "azmonitor"

# Recipient email address
email_address = "charitha.angage@lvs1.com"

# Name of the action group
action_group_name = "ag-action_group"

# Tags
tags = {
  environment = "dev"
  project     = "my-project"
  owner       = "John Doe"
}

# List of subscription ids for scope
scope_app_gateway_id = "/subscriptions/caf1f457-d51b-4e2d-b243-4cef0766f9d1/resourceGroups/azmonitor/providers/Microsoft.Network/applicationGateways/appg"
