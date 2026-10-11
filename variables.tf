variable "virtual_networks" {
  description = <<EOT
Map of virtual_networks, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - address_space
    - bgp_community
    - dns_servers
    - edge_zone
    - flow_timeout_in_minutes
    - private_endpoint_vnet_policies
    - tags
    - ddos_protection_plan (block):
        - enable (required)
        - id (required)
    - encryption (block):
        - enforcement (required)
    - ip_address_pool (block):
        - id (required)
        - number_of_ip_addresses (required)
    - subnet (block):
        - address_prefixes (optional)
        - default_outbound_access_enabled (optional)
        - delegation (optional, block):
            - name (optional)
            - service_delegation (optional, block):
                - actions (optional)
                - name (optional)
        - id (optional)
        - name (optional)
        - private_endpoint_network_policies (optional)
        - private_link_service_network_policies_enabled (optional)
        - route_table_id (optional)
        - security_group (optional)
        - service_endpoint (optional, block):
            - network_identifier (optional)
            - service (optional)
        - service_endpoint_policy_ids (optional)
EOT

  type = map(object({
    location                       = string
    name                           = string
    resource_group_name            = string
    address_space                  = optional(set(string))
    bgp_community                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    flow_timeout_in_minutes        = optional(number)
    private_endpoint_vnet_policies = optional(string)
    tags                           = optional(map(string))
    ddos_protection_plan = optional(object({
      enable = bool
      id     = string
    }))
    encryption = optional(object({
      enforcement = string
    }))
    ip_address_pool = optional(list(object({
      id                     = string
      number_of_ip_addresses = string
    })))
    subnet = optional(list(object({
      address_prefixes                = optional(list(string))
      default_outbound_access_enabled = optional(bool)
      delegation = optional(list(object({
        name = optional(string)
        service_delegation = optional(list(object({
          actions = optional(set(string))
          name    = optional(string)
        })))
      })))
      id                                            = optional(string)
      name                                          = optional(string)
      private_endpoint_network_policies             = optional(string)
      private_link_service_network_policies_enabled = optional(bool)
      route_table_id                                = optional(string)
      security_group                                = optional(string)
      service_endpoint = optional(list(object({
        network_identifier = optional(string)
        service            = optional(string)
      })))
      service_endpoint_policy_ids = optional(set(string))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.virtual_networks : (
        v.ip_address_pool == null || (length(v.ip_address_pool) <= 2)
      )
    ])
    error_message = "Each ip_address_pool list must contain at most 2 items"
  }
}

