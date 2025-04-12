output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.rg.name
}

output "app_service_plan_id" {
  description = "App Service Plan ID"
  value       = azurerm_service_plan.plan.id
}

output "azurerm_linux_web_app_url" {
  description = "Default hostname of the Linux Web App"
  value       = azurerm_linux_web_app.web.default_hostname
}
