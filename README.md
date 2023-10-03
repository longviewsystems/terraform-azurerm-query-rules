## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.73.0 |

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
| <a name="input_alert_resource_group_name"></a> [alert\_resource\_group\_name](#input\_alert\_resource\_group\_name) | Resource Group name for the alert | `string` | n/a | yes |
| <a name="input_alert_rule_description"></a> [alert\_rule\_description](#input\_alert\_rule\_description) | Description of the alert | `string` | n/a | yes |
| <a name="input_alert_rule_display_name"></a> [alert\_rule\_display\_name](#input\_alert\_rule\_display\_name) | Display name of the alert | `string` | n/a | yes |
| <a name="input_alert_rule_name"></a> [alert\_rule\_name](#input\_alert\_rule\_name) | Name of the alert | `string` | n/a | yes |
| <a name="input_alert_severity"></a> [alert\_severity](#input\_alert\_severity) | Severity of the alert | `number` | n/a | yes |
| <a name="input_evaluation_frequency"></a> [evaluation\_frequency](#input\_evaluation\_frequency) | The evaluation frequency for your resource | `string` | n/a | yes |
| <a name="input_kusto_log_query"></a> [kusto\_log\_query](#input\_kusto\_log\_query) | Kusto log query with Terraform escape sequences or in heredoc | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location | `string` | n/a | yes |
| <a name="input_scope_app_gateway_id"></a> [scope\_app\_gateway\_id](#input\_scope\_app\_gateway\_id) | Resource ID of the Application Gateway | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | n/a | yes |
| <a name="input_trigger_threshold"></a> [trigger\_threshold](#input\_trigger\_threshold) | Threshold of the alert | `number` | n/a | yes |
| <a name="input_window_duration"></a> [window\_duration](#input\_window\_duration) | The window duration for your resource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activity_log_alert_id"></a> [activity\_log\_alert\_id](#output\_activity\_log\_alert\_id) | The ID of the Activity Log Alert. |
