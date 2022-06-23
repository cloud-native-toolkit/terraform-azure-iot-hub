resource "azurerm_resource_group" {
  name     = var.resource_group_name
  location = var.region
}


resource "azurerm_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.region
  # account_tier             = "Standard"
  # account_replication_type = "LRS"
}


resource "azurerm_storage_container" {
  name                  = ""
  storage_account_name  = var.storage_account_name
  # container_access_type = "private"
}


resource "azurerm_eventhub_namespace" {
  name                = ""
  resource_group_name = var.resource_group_name
  location            = var.region
  sku                 = "Basic"
}


resource "azurerm_eventhub" {
  name                = ""
  resource_group_name = var.resource_group_name
  namespace_name      = var.namespace
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub_authorization_rule"  {
  resource_group_name = var.resource_group_name
  namespace_name      = var.namespace
  eventhub_name       = var.eventhub_name
  name                = ""
  send                = true
}

resource "azurerm_servicebus_namespace" {
  name                = ""
  location            = var.region
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" {
  name         = ""
  namespace_id = var.servicebus_namespace_id
  enable_partitioning = true
}

resource "azurerm_servicebus_queue_authorization_rule"  {
  name     = ""
  queue_id = var.servicebus_queue_id

  listen = false
  send   = true
  manage = false
}

resource "azurerm_iothub"  {
  name                = var.iothub_name
  resource_group_name = var.resource_group_name
  location            = var.region

  sku {
    name     = "S1"
    capacity = "1"
  }
  tags = {
    purpose = "testing"
  }
}

resource "azurerm_iothub_endpoint_storage_container" {
  resource_group_name = var.resource_group_name
  iothub_id           = var.iothub_id
  name                = ""

  connection_string          = var.storage_account_name.connection_string
  batch_frequency_in_seconds = 60
  max_chunk_size_in_bytes    = 10485760
  container_name             = ""
  encoding                   = "Avro"
  file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
}

resource "azurerm_iothub_route" {
  resource_group_name = var.resource_group_name
  iothub_name         = var.iothub_name
  name                = ""

  source         = "DeviceMessages"
  condition      = "true"
  endpoint_names = [azurerm_iothub_endpoint_storage_container.example.name]
  enabled        = true
}

resource "azurerm_iothub_endpoint_servicebus_queue" "example" {
  resource_group_name = azurerm_resource_group.example.name
  iothub_id           = azurerm_iothub.example.id
  name                = "example"

  connection_string = azurerm_servicebus_queue_authorization_rule.example.primary_connection_string
}
