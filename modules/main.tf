terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "my-first-azure-resource-group" {
  name     = "example-webapps"
  location = "West Europe"
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appservice-plan" {
  name                = "webapp-asp-1"
  resource_group_name = azurerm_resource_group.my-first-azure-resource-group.name
  location            = azurerm_resource_group.my-first-azure-resource-group.location
  os_type             = "Linux"
  sku_name            = "B1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                = "webapp-1477"
  resource_group_name = azurerm_resource_group.my-first-azure-resource-group.name
  location            = azurerm_resource_group.my-first-azure-resource-group.location
  service_plan_id     = azurerm_service_plan.appservice-plan.id
  https_only          = false
  site_config {
    minimum_tls_version = "1.2"
  }
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "my-source-control" {
  app_id                 = azurerm_linux_web_app.webapp.id
  repo_url               = "https://github.com/Malek-Zaag/notes-api"
  branch                 = "main"
  use_manual_integration = false

}
