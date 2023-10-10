# Terraform module for creating an Azure Application Gateway firewall alert for unthorized access

resource "azurerm_monitor_scheduled_query_rules_alert_v2" "custom_query_alert" {
  name                = var.alert_rule_name
  resource_group_name = var.alert_resource_group_name
  location            = var.location

  evaluation_frequency = var.evaluation_frequency
  window_duration      = var.window_duration
  scopes               = var.scope_ids
  severity             = var.alert_severity
  criteria {
    query                   = var.kusto_log_query
    metric_measure_column  = var.metric_measure_column
    time_aggregation_method = var.time_aggregation_method
    threshold               = var.trigger_threshold
    operator                = var.alert_logic_operator
    failing_periods {
      minimum_failing_periods_to_trigger_alert = var.minimum_failing_periods_to_trigger_alert
      number_of_evaluation_periods             = var.number_of_evaluation_periods
    }
  }

  description           = var.alert_rule_description
  display_name          = var.alert_rule_display_name
  enabled               = true
  skip_query_validation = false
  action {
    action_groups = var.action_groups_ids
  }

  tags = var.tags
}