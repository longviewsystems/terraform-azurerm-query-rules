variable "location" {
  type        = string
  description = "location"
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

variable "trigger_threshold" {
  type        = number
  description = "Threshold of the alert"
}

variable "kusto_log_query" {
  type        = string
  description = "Kusto log query"
}
