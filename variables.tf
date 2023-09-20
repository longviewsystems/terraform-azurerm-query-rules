variable "location" {
  type        = string
  description = "location"
}

variable "alert_resource_group_name" {
  type        = string
  description = "Resource Group name for the alert"
}

variable "email_address" {
  type        = string
  description = "Action Group recipient email address"
}

variable "action_group_name" {
  type        = string
  description = "Name of the action group"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "scope_app_gateway_id" {
  type        = string
  description = "Resource ID of the Application Gateway"
}

variable "alert_severity" {
  type        = number
  description = "Severity of the alert"
}

variable "alert_frequency" {
  type        = number
  description = "Frequency of the alert"
}

variable "alert_time_window" {
  type        = number
  description = "Time window of the alert"
}

variable "trigger_threshold" {
  type        = number
  description = "Threshold of the alert"
}

