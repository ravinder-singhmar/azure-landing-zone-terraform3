module "resource_group" {
  source     = "../../modules/azurerm_resource_group"
  rg_details = var.rg_details
}
module "pip" {
  source      = "../../modules/azurerm_public_ip"
  pip_details = var.pip_details
  depends_on  = [module.resource_group]
}
module "nsg" {
  source      = "../../modules/azurerm_network_secuirity_group"
  nsg_details = var.nsg_details
  depends_on  = [module.resource_group]
}
module "vnet" {
  source       = "../../modules/azurerm_virtual_network"
  vnet_details = var.vnet_details
  depends_on   = [module.resource_group]
}
module "subnet" {
  source         = "../../modules/azurerm_subnet"
  subnet_details = var.subnet_details
  depends_on     = [module.vnet]
}
module "virtual_machine" {
  source     = "../../modules/azurerm_linux_virtual_machine"
  vm_details = var.vm_details
  depends_on = [module.subnet, module.nsg, module.pip, module.nsg_association]
}
module "nsg_association" {
  source                 = "../../modules/azurerm_subnet_nsg_association"
  nsgassociation_details = var.nsgassociation_details
  depends_on             = [module.subnet, module.nsg]
}

module "bastion" {
  source          = "../../modules/azurerm_bastion_host"
  bastion_details = var.bastion_details
  depends_on      = [module.subnet, module.pip]
}

locals {
  peering_details_with_ids = {
    for k, v in var.peering_details : k => merge(v, {
      remote_virtual_network_id = module.vnet.vnets[v.remote_vnet_key].id
    })
  }
}

module "vnet_peering" {
  source          = "../../modules/azurerm_virtual_network_peering"
  peering_details = local.peering_details_with_ids
  depends_on      = [module.vnet]
}