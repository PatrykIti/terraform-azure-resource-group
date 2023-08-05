locals{
    env_prefix = "dev1eunc3d7d"
}

module "rg_inf" {
    source = "https://dev.azure.com/PC-ITI/ECW%20-%20Engine%20Car%20Watcher/_git/terraform-azurerm-resource-group-1?ref=v1.0.0"

    name = join("-",[local.env_prefix, "inf"])
    tags = {
      environment               = "dev1"
      environmentType           = "Development"
      latestProvisioning        = "patryk.c@example.com"
      latesteProvisioningDate   = "29-07-2023 19:34:00+00"
      ProjectCode               = "2390-11-100"
    }
}