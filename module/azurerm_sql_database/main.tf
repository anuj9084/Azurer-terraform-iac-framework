resource "azurerm_mssql_database" "testsqldb" {
  for_each     = var.sql_databases
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.demoserver[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = "VBS"

  tags = each.value.tags
}
