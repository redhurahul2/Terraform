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
subscription_id = var.subscription_id
tenant_id = var.tenant_id
client_id = var.client_id
client_secret = var.client_secret

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
    name = "Rahul"
    projet = "Terraform"
  }
}
