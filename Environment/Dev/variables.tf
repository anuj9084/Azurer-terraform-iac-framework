variable "resource_group" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}
variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))
    tags                = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}
variable "public_ips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    tags                = optional(map(string))
  }))
}
variable "sql_databases" {
  type = map(object({
    name                = string
    resource_group_name = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    server_name         = string
    tags                = optional(map(string))
  }))
}
variable "sql_servers" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    tags                         = optional(map(string))
  }))
}
variable "virtual_machines" {
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_name            = string
    vnet_name           = string
    subnet_name         = string
    public_ip_name      = string
    tags                = optional(map(string))
  }))
}
