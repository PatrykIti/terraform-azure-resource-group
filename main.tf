resource azurerm_resource_group "resource_group"{
    name        = var.name
    location    = var.location
    managed_by  = var.managed_by

    tags        = var.tags
}