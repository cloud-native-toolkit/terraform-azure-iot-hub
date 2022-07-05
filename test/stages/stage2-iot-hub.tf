module "iot-hub" {
    
    source = "./module"

    resource_group_name = module.resource_group_name
    storage_account_name = module.storage_account.name
    sku = var.sku
    servicebus_queue_name = var.servicebus_queue_name
    iothub_route_name = var.iothub_route_name

}