resource "azurerm_virtual_network" "virtual_networks" {
  for_each = var.virtual_networks

  location                       = each.value.location
  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  address_space                  = each.value.address_space
  bgp_community                  = each.value.bgp_community
  dns_servers                    = each.value.dns_servers
  edge_zone                      = each.value.edge_zone
  flow_timeout_in_minutes        = each.value.flow_timeout_in_minutes
  private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
  tags                           = each.value.tags

  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan != null ? [each.value.ddos_protection_plan] : []
    content {
      enable = ddos_protection_plan.value.enable
      id     = ddos_protection_plan.value.id
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []
    content {
      enforcement = encryption.value.enforcement
    }
  }

  dynamic "ip_address_pool" {
    for_each = each.value.ip_address_pool != null ? each.value.ip_address_pool : []
    content {
      id                     = ip_address_pool.value.id
      number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
    }
  }

  dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []
    content {
      address_prefixes                = subnet.value.address_prefixes
      default_outbound_access_enabled = subnet.value.default_outbound_access_enabled
      dynamic "delegation" {
        for_each = subnet.value.delegation != null ? subnet.value.delegation : []
        content {
          name = delegation.value.name
          dynamic "service_delegation" {
            for_each = delegation.value.service_delegation != null ? delegation.value.service_delegation : []
            content {
              actions = service_delegation.value.actions
              name    = service_delegation.value.name
            }
          }
        }
      }
      id                                            = subnet.value.id
      name                                          = subnet.value.name
      private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
      private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
      route_table_id                                = subnet.value.route_table_id
      security_group                                = subnet.value.security_group
      dynamic "service_endpoint" {
        for_each = subnet.value.service_endpoint != null ? subnet.value.service_endpoint : []
        content {
          network_identifier = service_endpoint.value.network_identifier
          service            = service_endpoint.value.service
        }
      }
      service_endpoint_policy_ids = subnet.value.service_endpoint_policy_ids
    }
  }
}

