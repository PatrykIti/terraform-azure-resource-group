variable "name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Location for the resource group"
  type        = string
  default     = "North Europe"

  validation {
    condition     = contains(["East US", "East US 2", "South Central US", "West US 2", "West US 3", "Australia East", "Southeast Asia", "North Europe", "Sweden Central", "UK South", "West Europe", "Central US", "South Africa North", "Central India", "East Asia", "Japan East", "Korea Central", "Canada Central", "France Central", "Germany West Central", "Norway East", "Poland Central", "Switzerland North", "UAE North", "Brazil South", "Central US EUAP", "Qatar Central", "Asia", "Asia Pacific", "Australia", "Brazil", "Canada", "Europe", "France", "Germany", "Global", "India", "Japan", "Korea", "Norway", "Singapore", "South Africa", "Switzerland", "United States", "North Central US", "West US", "East US 2 EUAP", "West Central US", "South Africa West", "Australia Central", "Australia Central 2", "Australia Southeast", "Japan West", "Korea South", "South India", "West India", "Canada East", "France South", "Germany North", "Norway West", "Switzerland West", "UK West", "UAE Central", "Brazil Southeast"], var.location) || contains(["eastus", "eastus2", "southcentralus", "westus2", "westus3", "australiaeast", "southeastasia", "northeurope", "swedencentral", "uksouth", "westeurope", "centralus", "southafricanorth", "centralindia", "eastasia", "japaneast", "koreacentral", "canadacentral", "francecentral", "germanywestcentral", "norwayeast", "polandcentral", "switzerlandnorth", "uaenorth", "brazilsouth", "centraluseuap", "qatarcentral", "asia", "asiapacific", "australia", "brazil", "canada", "europe", "france", "germany", "global", "india", "japan", "korea", "norway", "singapore", "southafrica", "switzerland", "unitedstates", "northcentralus", "westus", "eastus2euap", "westcentralus", "southafricawest", "australiacentral", "australiacentral2", "australiasoutheast", "japanwest", "koreasouth", "southindia", "westindia", "canadaeast", "francesouth", "germanynorth", "norwaywest", "switzerlandwest", "ukwest", "uaecentral", "brazilsoutheast"], var.location)
    error_message = "ERROR: location allowed values are: \"East US\", \"East US 2\", \"South Central US\", \"West US 2\", \"West US 3\", \"Australia East\", \"Southeast Asia\", \"North Europe\", \"Sweden Central\", \"UK South\", \"West Europe\", \"Central US\", \"South Africa North\", \"Central India\", \"East Asia\", \"Japan East\", \"Korea Central\", \"Canada Central\", \"France Central\", \"Germany West Central\", \"Norway East\", \"Poland Central\", \"Switzerland North\", \"UAE North\", \"Brazil South\", \"Central US EUAP\", \"Qatar Central\", \"Asia\", \"Asia Pacific\", \"Australia\", \"Brazil\", \"Canada\", \"Europe\", \"France\", \"Germany\", \"Global\", \"India\", \"Japan\", \"Korea\", \"Norway\", \"Singapore\", \"South Africa\", \"Switzerland\", \"United States\", \"North Central US\", \"West US\", \"East US 2 EUAP\", \"West Central US\", \"South Africa West\", \"Australia Central\", \"Australia Central 2\", \"Australia Southeast\", \"Japan West\", \"Korea South\", \"South India\", \"West India\", \"Canada East\", \"France South\", \"Germany North\", \"Norway West\", \"Switzerland West\", \"UK West\", \"UAE Central\", \"Brazil Southeast\" or \"eastus\", \"eastus2\", \"southcentralus\", \"westus2\", \"westus3\", \"australiaeast\", \"southeastasia\", \"northeurope\", \"swedencentral\", \"uksouth\", \"westeurope\", \"centralus\", \"southafricanorth\", \"centralindia\", \"eastasia\", \"japaneast\", \"koreacentral\", \"canadacentral\", \"francecentral\", \"germanywestcentral\", \"norwayeast\", \"polandcentral\", \"switzerlandnorth\", \"uaenorth\", \"brazilsouth\", \"centraluseuap\", \"qatarcentral\", \"asia\", \"asiapacific\", \"australia\", \"brazil\", \"canada\", \"europe\", \"france\", \"germany\", \"global\", \"india\", \"japan\", \"korea\", \"norway\", \"singapore\", \"southafrica\", \"switzerland\", \"unitedstates\", \"northcentralus\", \"westus\", \"eastus2euap\", \"westcentralus\", \"southafricawest\", \"australiacentral\", \"australiacentral2\", \"australiasoutheast\", \"japanwest\", \"koreasouth\", \"southindia\", \"westindia\", \"canadaeast\", \"francesouth\", \"germanynorth\", \"norwaywest\", \"switzerlandwest\", \"ukwest\", \"uaecentral\", \"brazilsoutheast\""
  }
}
variable "managed_by" {
  description = "ID of the resource which manage this resource group"
  type        = string
  default     = null

  validation {
        condition     = var.managed_by == null || can(regex("\\/subscriptions\\/[[:ascii:]]+\\/resourceGroups\\/[[:ascii:]]+\\/providers\\/[[:ascii:]]+", var.managed_by))
        error_message = "ERROR: provide proper resource ID '/subscriptions/XXXX/resourceGroups/XXXX/providers/XXXX'"
    }
}
variable "tags" {
  description = "Map of tags for resource group"
  type        = map(string)
  default     = {}
}