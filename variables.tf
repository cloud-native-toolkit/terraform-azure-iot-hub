variable "resource_group_name" {
  type        = string
  description = "Existing resource group where the IKS cluster will be provisioned."
}

variable "region" {
  type        = string
  description = "Region for VLANs defined in private_vlan_number and public_vlan_number."
}

variable "name_prefix" {
  type        = string
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
}

variable "storage_account_name" {

  type        = string
  description = "Name of the storage account for iothub"
}

variable "storage_account_tier" {
  type        = string
  description = "The Tier of the Azure Storage Account"
}

variable "replication_type" {
  type        = string
  description = "The type of the Replication for Azure Storage Account"
}

variable "sku" {
  type = string
  description = "The sku value of the eventhub namespace"
}

variable "container_name" {
  type        = string
  description = "The name of the Azure Blob Storage Container"
}

variable "container_access_type" {
  type        = string
  description = "The type of access for Azure Storage Container"
}


variable "namespace" {

  type = string
  description = "Name for the namespace for iothub"
}

variable "eventhub_name" {
  
  type = string
  description = "Name of the eventhub for iothub"
}

variable "iothub_name" {

 type = string
 description = "Name of the azure iothub"  
}



variable "iothub_id" {
  type = string
  description = "Id of azure iothub"
}

variable "servicebus_namespace" {
  type = string
  description = "Name of the servicebus namespace"
}

variable "servicebus_namespace_id" {
  type = string
  description = "Id of the servicebus namespace"
}

variable "servicebus_queue_name" {
  type = string
  description = "Name of the servicebus_queue"
}

variable "servicebus_queue_id" {
  type = string
  description = "Id of the servicebus queue"
}

variable "sku_name" {
  type  = string
  description = "Name of sku for iothub"
}

variable "sku_capacity" {
  type  = string
  description = "Capacity of sku for iothub"
}

variable "tags" {
  type =  map
  }

  variable "servicebus_queue_authorization_rule_name" {

    type = string
    description = "Name of the servicebus queue authorization rule"
}

variable "iothub_endpoint_storage_container_name" {
  
  type = string
  description = "Name of the iot hub endpoint storage container"
}

variable "iothub_route_name" {
  type = string
  description = "Name of the iot hub route"
}

variable "servicebus_endpoint_queue_name" {
  type = string
  description = "Name of the endpoint service bus queue"
}
  
