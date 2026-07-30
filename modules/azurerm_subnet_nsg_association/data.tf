data "azurerm_subnet" "data_subnet" {
  for_each             = var.nsgassociation_details
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_security_group" "data_nsg" {
  for_each            = var.nsgassociation_details
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}