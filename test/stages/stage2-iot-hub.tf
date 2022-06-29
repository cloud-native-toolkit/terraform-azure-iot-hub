module "iot-hub" {
    
    source = "./module"

    resource_group_name = module.resource_group_name
    location = var.region
    storage_account_name = module.storage_account.name
    storage_container_name = module.storage_container.name
    servicebus_name = var.servicebus_namespace
    sku = var.sku
    servicebus_queue_name = var.servicebus_queue_name
    iot_hub_name = var.iothub_name
    endpoint_storage_container_name = var.iothub_endpoint_storage_container_name
    iothub_route_name = var.iothub_route_name
    iothub_endpoint_servicebus_queue_name = var.servicebus_endpoint_queue_name
}