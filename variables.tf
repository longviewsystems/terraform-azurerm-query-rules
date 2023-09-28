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

variable "scope_app_gateway_id" {
  type        = list(string)
  description = "Resource ID of the Application Gateway" // only one resource ID is supported for now
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

