## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0, < 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_scheduled_query_rules_alert_v2.custom_query_alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_scheduled_query_rules_alert_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_groups_ids"></a> [action\_groups\_ids](#input\_action\_groups\_ids) | List of action groups IDs | `list(string)` | n/a | yes |
| <a name="input_alert_logic_operator"></a> [alert\_logic\_operator](#input\_alert\_logic\_operator) | Possible values are Equal, GreaterThan, GreaterThanOrEqual, LessThan,and LessThanOrEqual | `string` | n/a | yes |
| <a name="input_alert_resource_group_name"></a> [alert\_resource\_group\_name](#input\_alert\_resource\_group\_name) | Resource Group name for the alert | `string` | n/a | yes |
| <a name="input_alert_rule_description"></a> [alert\_rule\_description](#input\_alert\_rule\_description) | Description of the alert | `string` | n/a | yes |
| <a name="input_alert_rule_display_name"></a> [alert\_rule\_display\_name](#input\_alert\_rule\_display\_name) | Display name of the alert | `string` | n/a | yes |
| <a name="input_alert_rule_name"></a> [alert\_rule\_name](#input\_alert\_rule\_name) | Name of the alert | `string` | n/a | yes |
| <a name="input_alert_severity"></a> [alert\_severity](#input\_alert\_severity) | Severity of the alert | `number` | n/a | yes |
| <a name="input_evaluation_frequency"></a> [evaluation\_frequency](#input\_evaluation\_frequency) | The evaluation frequency for your resource | `string` | n/a | yes |
| <a name="input_kusto_log_query"></a> [kusto\_log\_query](#input\_kusto\_log\_query) | Kusto log query with Terraform escape sequences or in heredoc | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location | `string` | n/a | yes |
| <a name="input_metric_measure_column"></a> [metric\_measure\_column](#input\_metric\_measure\_column) | The column to use for metric measurement. Possible values are the column name of existing/new output column | `string` | n/a | yes |
| <a name="input_minimum_failing_periods_to_trigger_alert"></a> [minimum\_failing\_periods\_to\_trigger\_alert](#input\_minimum\_failing\_periods\_to\_trigger\_alert) | The number of periods to evaluate the alert logic operator. Possible values are 1 to 6 | `number` | n/a | yes |
| <a name="input_number_of_evaluation_periods"></a> [number\_of\_evaluation\_periods](#input\_number\_of\_evaluation\_periods) | The number of periods to evaluate the alert logic operator. Possible values are 1 to 6, window\_duration*number\_of\_evaluation\_periods < 48 hrs | `number` | n/a | yes |
| <a name="input_scope_ids"></a> [scope\_ids](#input\_scope\_ids) | Resource IDs of the alert scope | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | n/a | yes |
| <a name="input_time_aggregation_method"></a> [time\_aggregation\_method](#input\_time\_aggregation\_method) | The time aggregation method to use for alert evaluation. Possible values are: Average, Minimum, Maximum, Total, Count | `string` | n/a | yes |
| <a name="input_trigger_threshold"></a> [trigger\_threshold](#input\_trigger\_threshold) | Threshold of the alert | `number` | n/a | yes |
| <a name="input_window_duration"></a> [window\_duration](#input\_window\_duration) | The window duration for your resource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activity_log_alert_id"></a> [activity\_log\_alert\_id](#output\_activity\_log\_alert\_id) | The ID of the Activity Log Alert. |
