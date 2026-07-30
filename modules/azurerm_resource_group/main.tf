variable "rg_details" {
  type = map(any)
}

resource "azurerm_resource_group" "dev-rg" {
  for_each = var.rg_details
  name     = each.value.name
  location = each.value.location
}