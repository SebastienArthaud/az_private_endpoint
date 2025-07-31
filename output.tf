output "private_endpoint_id" {
  description = "ID tu private endpoint créé"
  value       = resource.azurerm_private_endpoint.private_endpoint.id
}