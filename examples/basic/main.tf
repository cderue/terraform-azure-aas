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

  location = "westeurope"
  env      = "dev"
  app      = "sample-app"
}

output "web_app_hostname" {
  value = module.app_service.azurerm_linux_web_app_url
}
