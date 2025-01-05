# 1. Specify the version of the AzureRM Provider to use
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

# 2. Configure the AzureRM Provider
provider "azurerm" {
  # The AzureRM Provider supports authenticating using via the Azure CLI, a Managed Identity
  # and a Service Principal. More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure

  # The features block allows changing the behaviour of the Azure Provider, more
  # information can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
  features {}
  subscription_id = var.ARM_SUBSCRIPTION_ID
  tenant_id       = var.ARM_TENANT_ID
}

# Create a resource group
resource "azurerm_resource_group" "default" {
  name     = "swiggy-app-rg"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "default" {
  name                = "swiggy-app-network"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  address_space       = ["10.0.0.0/16"]
}