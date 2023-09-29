# Terraform module for creating an Azure Application Gateway firewall alert for unthorized access

resource "azurerm_monitor_scheduled_query_rules_alert_v2" "custom_query_alert" {
  name                = "app-gateway-firewall-alerts-rule"
  resource_group_name = var.alert_resource_group_name
  location            = var.location

  evaluation_frequency = var.evaluation_frequency
  window_duration      = var.window_duration
  scopes               = var.scope_app_gateway_id
  severity             = var.alert_severity
  criteria {
    query = templatefile("${path.module}/templates/query.tftpl", {
      app_gateway_id = var.scope_app_gateway_id[0]
    })
    time_aggregation_method = "Count"
    threshold               = var.trigger_threshold
    operator                = "GreaterThan"
    failing_periods {
      minimum_failing_periods_to_trigger_alert = 1
      number_of_evaluation_periods             = 1
    }
  }

  description           = "Application Gateway Firewall Events Alert"
  display_name          = "Application Gateway Firewall Alert"
  enabled               = true
  skip_query_validation = false
  action {
    action_groups = var.action_groups_ids
  }

  tags = var.tags
}