variable "bastion_details" {
  type = map(any)
}

resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastion_details
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.data_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
  }
}
