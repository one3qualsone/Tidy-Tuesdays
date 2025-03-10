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

# Use data source for existing resource group instead of creating it
data "azurerm_resource_group" "tidy_tuesdays" {
  name = "tidy-tuesdays"
}

# Update to use the newer azurerm_static_web_app resource
resource "azurerm_static_web_app" "tidy_tuesdays" {
  name                = "tidy-tuesdays"
  resource_group_name = data.azurerm_resource_group.tidy_tuesdays.name
  location            = data.azurerm_resource_group.tidy_tuesdays.location
  sku_tier            = "Free"
  sku_size            = "Free"
}