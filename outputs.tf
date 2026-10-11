output "virtual_networks_id" {
  description = "Map of id values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "virtual_networks_address_space" {
  description = "Map of address_space values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.address_space if v.address_space != null && length(v.address_space) > 0 }
}
output "virtual_networks_bgp_community" {
  description = "Map of bgp_community values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.bgp_community if v.bgp_community != null && length(v.bgp_community) > 0 }
}
output "virtual_networks_ddos_protection_plan" {
  description = "Map of ddos_protection_plan values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => one(v.ddos_protection_plan) if v.ddos_protection_plan != null && length(v.ddos_protection_plan) > 0 }
}
output "virtual_networks_dns_servers" {
  description = "Map of dns_servers values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.dns_servers if v.dns_servers != null && length(v.dns_servers) > 0 }
}
output "virtual_networks_edge_zone" {
  description = "Map of edge_zone values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.edge_zone if v.edge_zone != null && length(v.edge_zone) > 0 }
}
output "virtual_networks_encryption" {
  description = "Map of encryption values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => one(v.encryption) if v.encryption != null && length(v.encryption) > 0 }
}
output "virtual_networks_flow_timeout_in_minutes" {
  description = "Map of flow_timeout_in_minutes values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.flow_timeout_in_minutes if v.flow_timeout_in_minutes != null }
}
output "virtual_networks_guid" {
  description = "Map of guid values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.guid if v.guid != null && length(v.guid) > 0 }
}
output "virtual_networks_ip_address_pool" {
  description = "Map of ip_address_pool values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.ip_address_pool if v.ip_address_pool != null && length(v.ip_address_pool) > 0 }
}
output "virtual_networks_location" {
  description = "Map of location values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.location if v.location != null && length(v.location) > 0 }
}
output "virtual_networks_name" {
  description = "Map of name values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.name if v.name != null && length(v.name) > 0 }
}
output "virtual_networks_private_endpoint_vnet_policies" {
  description = "Map of private_endpoint_vnet_policies values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.private_endpoint_vnet_policies if v.private_endpoint_vnet_policies != null && length(v.private_endpoint_vnet_policies) > 0 }
}
output "virtual_networks_resource_group_name" {
  description = "Map of resource_group_name values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "virtual_networks_subnet" {
  description = "Map of subnet values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.subnet if v.subnet != null && length(v.subnet) > 0 }
}
output "virtual_networks_tags" {
  description = "Map of tags values across all virtual_networks, keyed the same as var.virtual_networks"
  value       = { for k, v in azurerm_virtual_network.virtual_networks : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

