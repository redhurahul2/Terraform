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

locals {
  resource_group_name = "Terraform-RG"
  location = "Central India"
  storage_account_name = "terraformstrr"
}

resource "azurerm_resource_group" "rgdetails" {
  name     = locals.resource_group_name
  location = locals.location
}

resource "azurerm_storage_account" "storagedetails" {
  name                     = "terraformstrr"
  resource_group_name      = locals.resource_group_name
  location                 = locals.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"

  tags = {
    Environment = "Test"
    Name = "Rahul"
    Projet = "Terraform"
  }
  depends_on = [ azurerm_resource_group.rgdetails ]
}

resource "azurerm_storage_container" "containerdetails" {
  name                  = "terraformrr"
  storage_account_id    = azurerm_storage_account.storagedetails.id
  container_access_type = "blob"

  depends_on = [ azurerm_storage_account.storagedetails ]
}

resource "azurerm_storage_blob" "blobdetails" {
  name                   = "myblob"
  storage_account_name   = locals.storage_account_name
  storage_container_name = azurerm_storage_container.containerdetails.name
  type                   = "Block"
  source                 = "Test.txt"

  depends_on = [ azurerm_storage_container.containerdetails ]
}