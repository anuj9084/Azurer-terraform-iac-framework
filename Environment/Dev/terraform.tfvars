resource_group = {
  "rg1" = {
    name       = "rg1"
    location   = "East US"
    managed_by = "user1"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
    }
  }
}
virtual_networks = {
  vnet = {
    name                = "vnet-1"
    location            = "East US"
    resource_group_name = "rg1"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
    }
    subnets = [
      {
        name             = "frontsubnet"
        address_prefixes = ["10.0.0.0/24"]
      },
      {
        name             = "backsubnet"
        address_prefixes = ["10.0.1.0/24"]
      }
    ]
  }
}
public_ips = {
  pip1 = {
    name                = "publicip-1"
    location            = "East US"
    resource_group_name = "rg1"
    allocation_method   = "Static"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
    }
  }
  pip2 = {
    name                = "publicip-2"
    location            = "East US"
    resource_group_name = "rg1"
    allocation_method   = "Static"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
    }
  }
}
sql_databases = {
  "testdatabase" = {
    name                = "testdatabase"
    resource_group_name = "rg1"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 5
    sku_name            = "S0"
    server_name         = "testsqlserver01-dev-001"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
    }
  }
}
sql_servers = {
  "testsqlserver" = {
    name                         = "testsqlserver01-dev-001"
    resource_group_name          = "rg1"
    location                     = "Central US"
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    administrator_login_password = "P@ssw0rd1234!"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
    }
  }
}
virtual_machines = {
  "vm_1" = {
    vm_name             = "vm1"
    resource_group_name = "rg1"
    location            = "East US"
    size                = "Standard_DS1_v2"
    admin_username      = "azureuser"
    admin_password      = "P@ssw0rd1234!"
    nic_name            = "nic1"
    public_ip_name      = "publicip-1"
    vnet_name           = "vnet-1"
    subnet_name         = "frontsubnet"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
    }
  }
  "vm_2" = {
    vm_name             = "vm2"
    resource_group_name = "rg1"
    location            = "East US"
    size                = "Standard_DS1_v2"
    admin_username      = "azureuser"
    admin_password      = "P@ssw0rd1234!"
    nic_name            = "nic2"
    public_ip_name      = "publicip-2"
    vnet_name           = "vnet-1"
    subnet_name         = "backsubnet"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
    }
  }
}
