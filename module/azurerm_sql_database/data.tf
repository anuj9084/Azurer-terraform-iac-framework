data "azurerm_mssql_server" "demoserver" {
  for_each            = var.sql_databases
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
}
