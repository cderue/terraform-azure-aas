terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.22.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "app_service" {
  source = "../../"

  location             = "francecentral"
  env                  = "prod"
  app                  = "orders-api"
  node_version         = "20-lts"
  app_service_plan_sku = "P1v3"
  always_on            = true
  app_command_line     = "npm run start"

  app_settings = {
    NODE_OPTIONS                 = "--max-old-space-size=512"
    WEBSITE_NODE_DEFAULT_VERSION = "~20"
    LOG_LEVEL                    = "warn"
    FEATURE_X_ENABLED            = "false"
  }
}

output "resource_group_name" {
  value = module.app_service.resource_group_name
}

output "app_service_plan_id" {
  value = module.app_service.app_service_plan_id
}

output "web_app_hostname" {
  value = module.app_service.azurerm_linux_web_app_url
}
