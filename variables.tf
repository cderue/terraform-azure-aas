variable "waypoint_application" {
  type        = string
  default     = ""
  description = "Waypoint application name."
}

variable "location" {
  description = "Azure infrastructure region"
  type        = string
}

variable "env" {
  description = "Application env"
  type        = string
}

variable "app" {
  description = "Application that we want to deploy"
  type        = string
}

variable "node_version" {
  description = "Node.js runtime version for Azure App Service (for example: 18-lts, 20-lts)"
  type        = string
  default     = "20-lts"
}

variable "app_service_plan_sku" {
  description = "App Service Plan SKU (for example: B1, S1, P1v3)"
  type        = string
  default     = "B1"
}

variable "always_on" {
  description = "Whether Always On should be enabled for the web app"
  type        = bool
  default     = true
}

variable "app_command_line" {
  description = "Startup command for the Linux web app"
  type        = string
  default     = ""
}

variable "app_settings" {
  description = "Additional application settings for the web app"
  type        = map(string)
  default     = {}
}
