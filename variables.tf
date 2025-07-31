variable "resource_group_name" {
  type        = string
  description = "Resource groupe name"
}

variable "subnet_name" {
  type        = string
  description = "nom du subnet ou sera créé le private endpoint"
}

variable "virtual_network_name" {
  type        = string
  description = "Nom du réseau virtuel (VNET) ou sera créé le private endpoint"
}

variable "virtual_network_resource_group_name" {
  type        = string
  description = "Nom du resource group du réseau virtuel (VNET) ou sera créé le private endpoint"
}

variable "private_endpoint_name" {
  type        = string
  description = "Nom du private endpoint qui sera créé"
}

variable "location" {
  type        = string
  description = "Location. default = westeurope"
  default     = "westeurope"
}

variable "subresourceType" {
  type        = string
  description = "Type de sous ressource ciblée par le private endpoint. Pour plus d'information, voir https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource"
}

variable "is_manual_connection" {
  type        = bool
  description = "Est ce que le private endpoint recquiert une approbation manuelle ? Default = false"
  default     = false
}

variable "private_connection_resource_id" {
  type        = string
  description = "ID de la ressource ou est créé le private endpoint"
}


