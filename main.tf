# Terraform module for creating an Azure Application Gateway firewall alert for unthorized access

resource "azurerm_monitor_action_group" "action_group" {
  name                = var.action_group_name
  resource_group_name = var.alert_resource_group_name
  short_name          = "frewlalrt"

  email_receiver {
    name                    = "health-alert-email-receiver"
    email_address           = var.email_address
    use_common_alert_schema = false
  }

  tags = var.tags
}

resource "azurerm_monitor_scheduled_query_rules_alert" "custom_query_alert" {
  name                = "app-gateway-firewall-alerts-rule"
  location            = var.location
  resource_group_name = var.alert_resource_group_name

  action {
    action_group  = [azurerm_monitor_action_group.action_group.id]
    email_subject = "Application Gateway Firewall Alert"
  }
  data_source_id = var.scope_app_gateway_id
  description    = "Alert when total results cross threshold"
  enabled        = true
  query = templatefile("${path.module}/templates/query.tftpl", {
    app_gateway_id = azurerm_application_gateway.terratest_app_gateway.id
  })
  severity    = var.alert_severity
  frequency   = var.alert_frequency
  time_window = var.alert_time_window
  trigger {
    operator  = "GreaterThan"
    threshold = var.trigger_threshold
  }
  tags = var.tags
}