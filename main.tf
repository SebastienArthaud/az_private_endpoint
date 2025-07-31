locals {
  private_dns_zones = {
    file             = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.file.core.windows.net"]
    blob             = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
    vault            = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"]
    sqlServer        = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.database.windows.net"]
    mysqlServer      = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.mysql.database.azure.com"]
    postgresqlServer = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.postgres.database.azure.com"]
    mariadbServer    = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.mariadb.database.azure.com"]
    sites            = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
    "sites-staging"  = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net"]
    registry         = ["/subscriptions/35b8f0ee-20f9-4053-861e-cfc15d26cc77/resourceGroups/lz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.azurecr.io"]
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