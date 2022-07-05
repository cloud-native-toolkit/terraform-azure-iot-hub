
# Resource Group Variables
# Resource Group Variables
variable "resource_group_name" {
  type        = string
  description = "The name resource group."
}

variable "region" {
  type        = string
  description = "The name of the region where the hub is provisioned."
}

# variable "name" {
#   type        = string
#   description = "The name of "
#   default     = ""
# }

variable "name_prefix" {
  type        = string
  description = "The prefix of the name of the iot hub instance"
  default     = ""
}

variable "provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}

variable "iothub_name" {
  
  type = string
  description = "Name of the iothub"
  default = ""
}

variable "iothub_endpoint_storage_container_name" {

  type = string
  description = "Name of the iothub endpoint storage container"
  default = ""  
}

variable "servicebus_queue_authorization_rule_name" {
  
  type = string
  description = "Name of the servicebus queue authorization rule"
  default = ""
}

variable "servicebus_namespace" {
  
  type = string
  description = "Name of the servicebus namespace"
  default = ""
  }

variable "eventhub_name" {

  type = string
  description = "Name of the eventhub"
  default = ""
}

variable "servicebus_queue_id" {

  type = string
  description = "Id of the servicebus queue"
  default = ""
}

variable "sku_name" {

  type = string
  description = "Name of the sku"
  default = ""
}

variable "servicebus_endpoint_queue_name" {

  type = string
  description = "Name of the servicebus endpoint queue"
  default = ""
}

variable "servicebus_namespace_id" {

  type = string
  description = "Id of the servicebus namespace"
  default = ""
}

variable "namespace" {

  type = string
  description = "The namespace for the servicebus"
  default = ""  
}

variable "sku" {

  type = string
  description = "Type of the sku"
  default = ""
}

variable "servicebus_queue_name" {
  
  type = string
  description = "Name of the servicebus queue"
  default = ""
}

variable "iothub_route_name" {

  type = string
  description = "Name of the iothub route"
  default = ""
}
variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}