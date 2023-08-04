output "name" {
  description = "[Output] Resource Group Name"
  value = azurerm_resource_group.resource_group.name
}
output "location" {
  description = "[Output] Resource Group Location"
  value = azurerm_resource_group.resource_group.location
}
output "managed_by" {
  description = "[Output] Resource Group Managed By"
  value = azurerm_resource_group.resource_group.managed_by
}
output "id" {
  description = "[Output] Resource Group ID"
  value = azurerm_resource_group.resource_group.id
}