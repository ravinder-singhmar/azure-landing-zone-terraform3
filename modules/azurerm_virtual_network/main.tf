variable "vnet_details" {
  type = map(any)
}

resource "azurerm_virtual_network" "dev-vnet" {
  for_each            = var.vnet_details
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}
