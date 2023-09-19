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