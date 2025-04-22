locals{
    env_prefix = "dev1eunc3d7d"
}

module "rg_inf" {
    source = "git::https://github.com/PatrykIti/terraform-azurerm-resource-group-1.git?ref=v1.0.1"

    name = join("-",[local.env_prefix, "inf"])
    tags = {
      environment               = "dev1"
      environmentType           = "Development"
      latestProvisioning        = "patryk.c@example.com"
      latesteProvisioningDate   = "29-07-2023 19:34:00+00"
      ProjectCode               = "2390-11-100"
    }
}