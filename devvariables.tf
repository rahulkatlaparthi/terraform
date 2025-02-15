
variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "dev"
  type        = string
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "East US"
  type        = string
}
