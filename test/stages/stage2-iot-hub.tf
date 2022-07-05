module "iot-hub" {
    
    source = "./module"

    resource_group_name = module.resource_group_name
    storage_account_name = module.storage_account.name
    iothub_id = var.iothub_id
    iothub_name = var.iothub_name
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
    servicebus_queue_name = var.servicebus_queue_name
    iothub_route_name = var.iothub_route_name

}