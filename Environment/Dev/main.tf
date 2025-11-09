module "rg1" {
  source         = "../../module/azurerm_resource_group"
  resource_group = var.resource_group
}

module "vnet1" {
  source           = "../../module/azurerm_networking"
  virtual_networks = var.virtual_networks
  depends_on       = [module.rg1]
}

module "public_ips" {
  source     = "../../module/azurerm_public_ip"
  public_ips = var.public_ips
  depends_on = [module.vnet1]
}

module "sql_servers" {
  source      = "../../module/azurerm_sql_server"
  sql_servers = var.sql_servers
  depends_on  = [module.rg1]
}

module "sql_databases" {
  source        = "../../module/azurerm_sql_database"
  sql_databases = var.sql_databases
  depends_on    = [module.sql_servers]
}
module "vms" {
  source           = "../../module/azurerm_compute"
  virtual_machines = var.virtual_machines
  depends_on       = [module.vnet1, module.public_ips]
}
