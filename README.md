# Terraform No-Code Infrastructure Module for Azure App Service (Node.js)

The Terraform No-Code Infrastructure Module for Azure App Service simplifies deployment of Node.js applications on Azure App Service with a configuration-driven approach.

## Key features:
- No-code deployment - Provision Azure App Service resources through variables only.
- Node.js runtime configuration - Configure the Node.js stack version for Linux Web Apps.
- Secure defaults - HTTPS-only web app with a system-assigned managed identity.
- Flexible app configuration - Pass custom app settings and startup command.
- Consistent tagging - Applies environment and app tags to all resources.

## Resources provisioned:
- Azure Resource Group
- Azure App Service Plan (Linux)
- Azure Linux Web App

## Required inputs:
- `location` - Azure region
- `env` - Deployment environment name
- `app` - Application name

## Optional inputs:
- `node_version` (default: `20-lts`)
- `app_service_plan_sku` (default: `B1`)
- `always_on` (default: `true`)
- `app_command_line` (default: empty)
- `app_settings` (default: empty map)

## Outputs:
- `resource_group_name`
- `app_service_plan_id`
- `azurerm_linux_web_app_url`

