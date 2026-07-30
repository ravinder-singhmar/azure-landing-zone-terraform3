variable "nsgassociation_details" {
  type = map(any)
}


resource "azurerm_subnet_network_security_group_association" "nsgadd" {
  for_each                  = var.nsgassociation_details
  subnet_id                 = data.azurerm_subnet.data_subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data_nsg[each.key].id
}
