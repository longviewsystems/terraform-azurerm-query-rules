# variables.tfvars
location = "eastus"
#alert_resource_group_name = ""
email_address     = "demo@demo.abc"
action_group_name = "ag-terratest-action-group"
tags = {
  environment = "test"
  owner       = "Terratest"
}
trigger_threshold = "3"
kusto_log_query   = <<EOT
AzureDiagnostics 
| where ResourceProvider == "MICROSOFT.NETWORK" and Category == "ApplicationGatewayAccessLog"
EOT
