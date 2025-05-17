terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.29.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
subscription_id = "4dc3faf0-d4bf-4d7c-9dfb-957fb6e4d45d"
tenant_id = "b1d107be-1298-435c-a9c4-34586c26a33a"
client_id = "ae592fdc-56cc-4696-b88d-e72b6c8fe5a1"
client_secret = "G9O8Q~oyHiFXo-Xj63GxWb3kOQw_cD6dTOFmjblf"

features {}
}

resource "azurerm_resource_group" "rgdetails" {
  name     = "Terraform-RG"
  location = "Central India"
}

resource "azurerm_storage_account" "storagedetails" {
  name                     = "terraformstrr"
  resource_group_name      = "Terraform-RG"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"

  tags = {
    environment = "Test"
  }
}