# variables.tfvars
location                  = "eastus"
alert_resource_group_name = ""
email_address             = "demo@demo.abc"
action_group_name         = "ag-terratest-action-group"
scope_app_gateway_id      = ""
tags = {
  environment = "test"
  owner       = "Terratest"
}
