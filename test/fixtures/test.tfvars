# variables.tfvars
location = "eastus"
#alert_resource_group_name = ""
email_address     = "demo@demo.abc"
action_group_name = "ag-terratest-action-group"
#scope_app_gateway_id      = ""
tags = {
  environment = "test"
  owner       = "Terratest"
}
alert_severity    = "3"
alert_frequency   = "720"
alert_time_window = "1440"
trigger_threshold = "3"