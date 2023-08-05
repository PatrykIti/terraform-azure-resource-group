locals{
    env                       = "dev1"
    subscriptionInfix         = "c3d7d"
    locationAcronymPrimary    = "eun"
    locationPrimary           = "North Europe"
    locationAcronymSecondary  = "euw"
    locationSecondary         = "West Europe"
    env_prefix_primary        = join("",[local.env,local.locationAcronymPrimary,local.subscriptionInfix])
    env_prefix_secondary      = join("",[local.env,local.locationAcronymSecondary,local.subscriptionInfix])
}

#Primary Region
module "rg_inf_primary" {
    source = "git::https://github.com/PatrykIti/terraform-azurerm-resource-group-1.git?ref=v1.0.0"

    name      = join("-",[local.env_prefix_primary, "inf"])
    location  = local.locationPrimary
    tags      = {
      environment               = "dev1"
      environmentType           = "Development"
      latestProvisioning        = "patryk.c@example.com"
      latesteProvisioningDate   = "29-07-2023 19:34:00+00"
      ProjectCode               = "2390-11-100"
    }
}
#Secondary Region
module "rg_inf_secondary" {
    source = "git::https://github.com/PatrykIti/terraform-azurerm-resource-group-1.git?ref=v1.0.0"

    name      = join("-",[local.env_prefix_secondary, "inf"])
    location  = local.locationSecondary
    tags      = {
      environment               = "dev1"
      environmentType           = "Development"
      latestProvisioning        = "patryk.c@example.com"
      latesteProvisioningDate   = "29-07-2023 19:34:00+00"
      ProjectCode               = "2390-11-100"
    }
}


#Testing outputs from module
#Only for showing how to get them after module execution
#Outputs can be passed between modules of different resources

#Primary region
output "rg-inf-name-primary" {
  value = module.rg_inf_primary.name
}
output "rg-inf-location-primary" {
  value = module.rg_inf_primary.location
}
output "rg-inf-id-primary" {
  value = module.rg_inf_primary.id
}
#Secondary region
output "rg-inf-name-secondary" {
  value = module.rg_inf_secondary.name
}
output "rg-inf-location-secondary" {
  value = module.rg_inf_secondary.location
}
output "rg-inf-id-secondary" {
  value = module.rg_inf_secondary.id
}
