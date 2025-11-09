data "azurerm_subnet" "demosubnet" {
  for_each             = var.virtual_machines
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each            = var.virtual_machines
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
