<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 0.13 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_subnet.private_endpoint_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | ID de la ressource ou est créé le private endpoint | `string` | n/a | yes |
| <a name="input_private_endpoint_name"></a> [private\_endpoint\_name](#input\_private\_endpoint\_name) | Nom du private endpoint qui sera créé | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource groupe name | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | nom du subnet ou sera créé le private endpoint | `string` | n/a | yes |
| <a name="input_subresourceType"></a> [subresourceType](#input\_subresourceType) | Type de sous ressource ciblée par le private endpoint. Pour plus d'information, voir https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Nom du réseau virtuel (VNET) ou sera créé le private endpoint | `string` | n/a | yes |
| <a name="input_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#input\_virtual\_network\_resource\_group\_name) | Nom du resource group du réseau virtuel (VNET) ou sera créé le private endpoint | `string` | n/a | yes |
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | Est ce que le private endpoint recquiert une approbation manuelle ? Default = false | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Location. default = westeurope | `string` | `"westeurope"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_endpoint_id"></a> [private\_endpoint\_id](#output\_private\_endpoint\_id) | ID tu private endpoint créé |
<!-- END_TF_DOCS -->