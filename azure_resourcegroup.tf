# Create a resource group
resource "azurerm_resource_group" "production" {
  name     = "production"
  location = "West US"
}
