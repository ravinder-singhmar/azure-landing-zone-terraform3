rg_details = {
  hub_rg = {
    name     = "hub-rg"
    location = "South India"
  }
  spoke_rg = {
    name     = "spoke-rg"
    location = "South India"
  }
    spoke_rg2 = {
    name     = "spoke-rg2"
    location = "South India"
  }
  
}

pip_details = {
  bastion_pip = {
    name                = "dev-bastion-pip"
    resource_group_name = "hub-rg"
    location            = "South India"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nsg_details = {
  nsg1 = {
    name                = "dev-frontend-nsg"
    location            = "South India"
    resource_group_name = "spoke-rg"
  }

  nsg2 = {
    name                = "dev-backend-nsg"
    location            = "South India"
    resource_group_name = "spoke-rg"
  }

  nsg3 = {
    name                = "dev-database-nsg"
    location            = "South India"
    resource_group_name = "spoke-rg"
  }
}

vnet_details = {
  hub_vnet = {
    name                = "hub-vnet"
    resource_group_name = "hub-rg"
    location            = "South India"
    address_space       = ["10.0.0.0/16"]
  }
  spoke_vnet = {
    name                = "spoke-vnet"
    resource_group_name = "spoke-rg"
    location            = "South India"
    address_space       = ["10.1.0.0/16"]
  }
}

subnet_details = {
  bastion_subnet = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "hub-vnet"
    resource_group_name  = "hub-rg"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet1 = {
    name                 = "dev-frontend-subnet"
    virtual_network_name = "spoke-vnet"
    resource_group_name  = "spoke-rg"
    address_prefixes     = ["10.1.0.0/24"]
  }
  subnet2 = {
    name                 = "dev-backend-subnet"
    virtual_network_name = "spoke-vnet"
    resource_group_name  = "spoke-rg"
    address_prefixes     = ["10.1.1.0/24"]
  }
  subnet3 = {
    name                 = "dev-database-subnet"
    virtual_network_name = "spoke-vnet"
    resource_group_name  = "spoke-rg"
    address_prefixes     = ["10.1.2.0/24"]
  }
}

vm_details = {
  vm1 = {
    nic_name             = "dev-frontend-nic"
    location             = "South India"
    resource_group_name  = "spoke-rg"
    subnet_name          = "dev-frontend-subnet"
    virtual_network_name = "spoke-vnet"
    vm_name              = "dev-frontend-vm"
    size                 = "Standard_B2ats_v2"
    admin_username       = "admin123"
    admin_password       = "Password@123"
  }

  vm2 = {
    nic_name             = "dev-backend-nic"
    location             = "South India"
    resource_group_name  = "spoke-rg"
    subnet_name          = "dev-backend-subnet"
    virtual_network_name = "spoke-vnet"
    vm_name              = "dev-backend-vm"
    size                 = "Standard_B2ats_v2"
    admin_username       = "admin123"
    admin_password       = "Password@123"
  }

  vm3 = {
    nic_name             = "dev-database-nic"
    location             = "South India"
    resource_group_name  = "spoke-rg"
    subnet_name          = "dev-database-subnet"
    virtual_network_name = "spoke-vnet"
    vm_name              = "dev-database-vm"
    size                 = "Standard_B2ats_v2"
    admin_username       = "admin123"
    admin_password       = "Password@123"
  }
}

nsgassociation_details = {
  nsgadd1 = {
    resource_group_name  = "spoke-rg"
    subnet_name          = "dev-frontend-subnet"
    virtual_network_name = "spoke-vnet"
    nsg_name             = "dev-frontend-nsg"
  }

  nsgadd2 = {
    resource_group_name  = "spoke-rg"
    subnet_name          = "dev-backend-subnet"
    virtual_network_name = "spoke-vnet"
    nsg_name             = "dev-backend-nsg"
  }

  nsgadd3 = {
    resource_group_name  = "spoke-rg"
    subnet_name          = "dev-database-subnet"
    virtual_network_name = "spoke-vnet"
    nsg_name             = "dev-database-nsg"
  }
}

bastion_details = {
  bastion1 = {
    name                 = "dev-bastion"
    location             = "South India"
    resource_group_name  = "hub-rg"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "hub-vnet"
    pip_name             = "dev-bastion-pip"
  }
}

peering_details = {
  hub_to_spoke = {
    name                         = "hub-to-spoke"
    resource_group_name          = "hub-rg"
    virtual_network_name         = "hub-vnet"
    remote_vnet_key              = "spoke_vnet"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
  }
  spoke_to_hub = {
    name                         = "spoke-to-hub"
    resource_group_name          = "spoke-rg"
    virtual_network_name         = "spoke-vnet"
    remote_vnet_key              = "hub_vnet"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
  }
}