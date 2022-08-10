module "iot-hub" {
    
    source = "./module"

    resource_group_name = module.resource_group_name
    storage_account_name = var.storage_account_name
    container_name = var.container_name
    sku_capacity = var.sku_capacity
    iothub_id = var.iothub_id
    iothub_name = var.iothub_name
    iothub_endpoint_storage_container_name = var.iothub_endpoint_storage_container_name
    servicebus_queue_authorization_rule_name = var.servicebus_queue_authorization_rule_name
    region = var.region
    servicebus_namespace = var.servicebus_namespace
    eventhub_name = var.eventhub_name
    servicebus_queue_id = var.servicebus_queue_id
    sku_name = var.sku_name
    servicebus_endpoint_queue_name = var.servicebus_endpoint_queue_name
    servicebus_namespace_id = var.servicebus_namespace_id
    namespace = var.namespace
    sku = var.sku
    tags = var.tags
    container_access_type = var.container_access_type
    name_prefix = var.name_prefix
    storage_account_tier = var.storage_account_tier
    servicebus_queue_name = var.servicebus_queue_name
    iothub_route_name = var.iothub_route_name

}