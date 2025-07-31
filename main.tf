locals {
  private_dns_zones = {
    file             = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    blob             = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    vault            = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    sqlServer        = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    mysqlServer      = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    postgresqlServer = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    mariadbServer    = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    sites            = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    "sites-staging"  = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
    registry         = [INSERER ICI L'ID DE LA PRIVATE DNS ZONE]
  }
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.private_endpoint_name
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = data.azurerm_subnet.private_endpoint_subnet.id

  private_dns_zone_group {
    name                 = "private_endpoint_dns_group"
    private_dns_zone_ids = local.private_dns_zones[var.subresourceType]
  }

  private_service_connection {
    name                           = "pe_connection_to_${var.subresourceType}"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = [var.subresourceType]
  }
}
