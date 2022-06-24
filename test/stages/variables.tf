
# Resource Group Variables
# Resource Group Variables
variable "resource_group_name" {
  type        = string
  description = "The name of the IBM Cloud resource group where the VPC instance will be created."
}

variable "region" {
  type        = string
  description = "The IBM Cloud region where the cluster will be/has been installed."
}

variable "name" {
  type        = string
  description = "The name of the vpc instance"
  default     = ""
}

variable "name_prefix" {
  type        = string
  description = "The name of the vpc resource"
  default     = ""
}

variable "provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default     = true
}