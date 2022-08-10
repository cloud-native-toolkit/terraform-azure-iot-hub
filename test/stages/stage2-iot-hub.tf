module "iot-hub" {
    
    source = "./module"

    resource_group_name = module.resource_group_name
}