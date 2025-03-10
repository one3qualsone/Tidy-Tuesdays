terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "tidy_tuesdays" {
  name     = "tidy-tuesdays"
  location = "uksouth"
}

# Create Static Web App
resource "azurerm_static_site" "tidy_tuesdays" {
  name                = "tidy-tuesdays"
  resource_group_name = azurerm_resource_group.tidy_tuesdays.name
  location            = azurerm_resource_group.tidy_tuesdays.location
}

# Output the Static Web Apps deployment token to use in GitHub Actions
output "static_web_app_api_token" {
  value     = azurerm_static_site.tidy_tuesdays.api_key
  sensitive = true
}

# Output the default hostname
output "default_hostname" {
  value = azurerm_static_site.tidy_tuesdays.default_host_name
}