variable "sql_databases" {
  type = map(object({
    name                = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    resource_group_name = string
    tags                = optional(map(string))
    server_name         = string
  }))
}
