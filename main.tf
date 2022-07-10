
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name.default
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = var.storage_account_tier
  account_replication_type = var.replication_type
}


resource "azurerm_storage_container" "storage_container" {
  count                 = var.container_name != "" ? 1 : 0
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = var.container_access_type
}


resource "azurerm_servicebus_namespace" "servicebus_namespace" {
  name                = var.servicebus_namespace
  location            = var.region
  resource_group_name = var.resource_group_name
  sku                 = var.sku
}

resource "azurerm_servicebus_queue" "servicebus_queue" {
  name         = var.servicebus_queue_name
  namespace_id = var.servicebus_namespace_id
  enable_partitioning = true
}

resource "azurerm_servicebus_queue_authorization_rule" "servicebus_queue_authorization_rule" {
  name     = var.servicebus_queue_authorization_rule_name
  queue_id = var.servicebus_queue_id

  listen = false
  send   = true
  manage = false
}

resource "azurerm_iothub" "iothub" {
  name                = var.iothub_name
  resource_group_name = var.resource_group_name
  location            = var.region

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }
  tags = var.tags
}

resource "azurerm_iothub_endpoint_storage_container" "endpoint_storage_container" {
  resource_group_name = var.resource_group_name
  iothub_id           = var.iothub_id
  name                = var.iothub_endpoint_storage_container_name

  connection_string          = azurerm_storage_account.storage_account.primary_blob_connection_string
  batch_frequency_in_seconds = 60
  max_chunk_size_in_bytes    = 10485760
  container_name             = var.container_name
  encoding                   = "Avro"
  file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
}

resource "azurerm_iothub_route" "iothub_route" {
  resource_group_name = var.resource_group_name
  iothub_name         = var.iothub_name
  name                = var.iothub_route_name

  source         = "DeviceMessages"
  condition      = "true"
  endpoint_names = [azurerm_iothub_endpoint_storage_container.endpoint_storage_container.name]
  enabled        = true
}

resource "azurerm_iothub_endpoint_servicebus_queue" "iothub_endpoint_servicebus_queue" {
  resource_group_name = var.resource_group_name
  iothub_id           = var.iothub_id
  name                = var.servicebus_endpoint_queue_name

  connection_string = azurerm_servicebus_queue_authorization_rule.servicebus_queue_authorization_rule.primary_connection_string
}