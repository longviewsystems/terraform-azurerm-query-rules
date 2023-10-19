output "activity_log_alert_id" {
  description = "The ID of the Activity Log Alert."
  value       = azurerm_monitor_scheduled_query_rules_alert_v2.custom_query_alert.id
}