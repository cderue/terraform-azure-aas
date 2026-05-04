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

  location             = "northeurope"
  env                  = "staging"
  app                  = "api-service"
  node_version         = "18-lts"
  app_service_plan_sku = "S1"
  always_on            = true
  app_command_line     = "npm run start"

  app_settings = {
    LOG_LEVEL                      = "info"
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
    FEATURE_X_ENABLED              = "true"
  }
}

output "resource_group_name" {
  value = module.app_service.resource_group_name
}

output "web_app_hostname" {
  value = module.app_service.azurerm_linux_web_app_url
}
