variable "pip_details" {
  type = map(any)
}

resource "azurerm_public_ip" "pip" {
  for_each = var.pip_details

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}