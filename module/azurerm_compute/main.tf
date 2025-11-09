resource "azurerm_network_interface" "demointerface" {
  for_each            = var.virtual_machines
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.demosubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.public_ip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "demomachine" {
  for_each                        = var.virtual_machines
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  tags                            = each.value.tags
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.demointerface[each.key].id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
