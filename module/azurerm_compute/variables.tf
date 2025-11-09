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
    public_ip_name      = optional(string)
    tags                = optional(map(string))
  }))
}
