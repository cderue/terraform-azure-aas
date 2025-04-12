locals {
  stack = "${var.env}-${var.location}-001"

  default_tags = {
    environment = var.env
    app         = var.app
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.stack}"
  location = var.location

  tags = local.default_tags
}

resource "azurerm_service_plan" "plan" {
  name                = "asp-${local.stack}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku

  tags = local.default_tags
}

resource "azurerm_linux_web_app" "web" {
  name                = "${var.app}-${local.stack}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id
  https_only          = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on        = var.always_on
    app_command_line = var.app_command_line

    application_stack {
      node_version = var.node_version
    }
  }

  app_settings = merge(
    {
      NODE_ENV                        = var.env
      SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
      WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    },
    var.app_settings
  )

  tags = local.default_tags
}
