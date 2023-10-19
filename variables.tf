variable "alert_rule_name" {
  type        = string
  description = "Name of the alert"
}

variable "alert_rule_description" {
  type        = string
  description = "Description of the alert"
}

variable "alert_rule_display_name" {
  type        = string
  description = "Display name of the alert"
}

variable "location" {
  type        = string
  description = "location"
}

variable "alert_resource_group_name" {
  type        = string
  description = "Resource Group name for the alert"
}

variable "action_groups_ids" {
  type        = list(string)
  description = "List of action groups IDs"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "scope_ids" {
  type        = list(string)
  description = "Resource IDs of the alert scope" // only one resource ID is supported for now
}

variable "alert_severity" {
  type        = number
  description = "Severity of the alert"
}

variable "evaluation_frequency" {
  description = "The evaluation frequency for your resource" //chosen period of time in ISO 8601 duration format
  type        = string
}

variable "window_duration" {
  description = "The window duration for your resource" //chosen period of time in ISO 8601 duration format https://www.digi.com/resources/documentation/digidocs//90001488-13/reference/r_iso_8601_duration_format.htm
  type        = string
}

variable "trigger_threshold" {
  type        = number
  description = "Threshold of the alert"
}

variable "kusto_log_query" {
  type        = string
  description = "Kusto log query with Terraform escape sequences or in heredoc" //https://developer.hashicorp.com/terraform/language/expressions/strings#escape-sequences
}

variable "time_aggregation_method" {
  type        = string
  description = "The time aggregation method to use for alert evaluation. Possible values are: Average, Minimum, Maximum, Total, Count"
  validation {
    condition     = can(regex("^Average$|^Minimum$|^Maximum$|^Total$|^Count$", var.time_aggregation_method))
    error_message = "Valid values are Average, Minimum, Maximum, Total, or Count."
  }
}

variable "metric_measure_column" {
  type        = string
  description = "The column to use for metric measurement. Possible values are the column name of existing/new output column"
}

variable "alert_logic_operator" {
  type        = string
  description = " Possible values are Equal, GreaterThan, GreaterThanOrEqual, LessThan,and LessThanOrEqual"
  validation {
    condition     = can(regex("^Equal$|^GreaterThan$|^GreaterThanOrEqual$|^LessThan$|^LessThanOrEqual$", var.alert_logic_operator))
    error_message = "Valid values are Equal, GreaterThan, GreaterThanOrEqual, LessThan, or LessThanOrEqual."
  }
}

variable "minimum_failing_periods_to_trigger_alert" {
  type        = number
  description = "The number of periods to evaluate the alert logic operator. Possible values are 1 to 6"
  validation {
    condition     = var.minimum_failing_periods_to_trigger_alert >= 1 && var.minimum_failing_periods_to_trigger_alert <= 6
    error_message = "Valid values are 1 to 6."
  }
}

variable "number_of_evaluation_periods" {
  type        = number
  description = "The number of periods to evaluate the alert logic operator. Possible values are 1 to 6, window_duration*number_of_evaluation_periods < 48 hrs"
  validation {
    condition     = var.number_of_evaluation_periods >= 1 && var.number_of_evaluation_periods <= 6
    error_message = "Valid values are 1 to 6."
  }
}