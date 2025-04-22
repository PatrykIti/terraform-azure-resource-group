<!-- [START BADGES] -->
<!-- Please keep comment here to allow auto update -->
[![license GPL-3.0](https://img.shields.io/github/license/PatrykIti/terraform-azurerm-resource-group-1?style=flat-square)](https://github.com/PatrykIti/terraform-azurerm-resource-group-1/blob/main/LICENSE)
[![Language](https://img.shields.io/badge/language-HCL-purple.svg?style=flat-square)](https://www.hashicorp.org)
[![Ver. v1.0.0](https://img.shields.io/badge/Ver.-v1.0.0-brightgreen.svg?style=flat-square)](https://github.com/PatrykIti/testing-gitactions/releases/tag/v1.0.0)
<!-- [END BADGES] -->
<h1 align="center">Terraform module for managing Azure Resource Groups</h1>

<p>All modules were tested on my private Azure subscription before merged here, so if you encountered some problems than please check twice your configuration ☺️ </p>

<p>If you want to keep an eye on current changes made to modules than please look into <a href="https://github.com/users/PatrykIti/projects/1">Project section -> Terraform modules for Azure</a></p>
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.58.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Module Usage
More usage examples available in .\examples\ folder
### Simple Example
```hcl
locals{
    env_prefix = "dev1eunc3d7d"
}

module "rg_inf" {
    source = "git::https://github.com/PatrykIti/terraform-azurerm-resource-group-1.git?ref=v1.0.0"

    name = join("-",[local.env_prefix, "inf"])
    tags = {
      environment               = "dev1"
      environmentType           = "Development"
      latestProvisioning        = "patryk.c@example.com"
      latesteProvisioningDate   = "29-07-2023 19:34:00+00"
      ProjectCode               = "2390-11-100"
    }
}
```
### Intermediate Example
```hcl
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
```
### Advanced Example
```hcl
locals{
    env                       = "dev1"
    subscriptionInfix         = "c3d7d"
    locationAcronymPrimary    = "eun"
    locationPrimary           = "North Europe"
    locationAcronymSecondary  = "euw"
    locationSecondary         = "West Europe"
    env_prefix_primary        = join("",[local.env,local.locationAcronymPrimary,local.subscriptionInfix])
    env_prefix_secondary      = join("",[local.env,local.locationAcronymSecondary,local.subscriptionInfix])

    list_of_resource_groups   = ["raw","snp","da","wda","ecs","ecw","db","bi"]
}

#Primary Region
module "rg_primary" {
    source = "git::https://github.com/PatrykIti/terraform-azurerm-resource-group-1.git?ref=v1.0.0"

    for_each = {for rg in local.list_of_resource_groups : rg => rg}

    name      = join("-",[local.env_prefix_primary, each.key])
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
module "rg_secondary" {
    source = "git::https://github.com/PatrykIti/terraform-azurerm-resource-group-1.git?ref=v1.0.0"
    
    for_each = {for rg in local.list_of_resource_groups : rg => rg}

    name      = join("-",[local.env_prefix_secondary, each.key])
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
#Only for showing how to get them after module execution with for_each loop
#Outputs can be passed between modules of different resources

#Primary region
output "resource_groups_primary" {
  value = [for rg in local.list_of_resource_groups : {
    name        = module.rg_primary[rg].name
    location    = module.rg_primary[rg].location
    managed_by  = module.rg_primary[rg].managed_by
    id          = module.rg_primary[rg].id
  }]
}

#Secondary region
output "resource_groups_secondary" {
  value = [for rg in local.list_of_resource_groups : {
    name        = module.rg_secondary[rg].name
    location    = module.rg_secondary[rg].location
    managed_by  = module.rg_secondary[rg].managed_by
    id          = module.rg_secondary[rg].id
  }]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the resource group | `string` | `"North Europe"` | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | ID of the resource which manage this resource group | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags for resource group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | [Output] Resource Group Name |
| <a name="output_location"></a> [location](#output\_location) | [Output] Resource Group Location |
| <a name="output_managed_by"></a> [managed\_by](#output\_managed\_by) | [Output] Resource Group Managed By |
| <a name="output_id"></a> [id](#output\_id) | [Output] Resource Group ID |
<!-- END_TF_DOCS -->