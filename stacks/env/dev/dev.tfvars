resource_group_names = [ 
  "rg-eastus-app", 
  "rg-eastus-acr"
]

tags_rg = [
  {
    rg            = "app"
  },
  {
    rg            = "acr"
  }
]

location            = "eastus"


global_tags = {
  Department    = "TI"
  Environment   = "dev"
  Project       = "POC DevOps"
  Provisioner   = "Terraform"
}

acr_module_enabled                  = true
app_module_enabled                  = true

#--------------------
# ACR Vars
#--------------------

acr_name         = "acrpizza"
acr_enable_admin = true
sku              = "Standard"
tags_acr         = {
  resource       = "acr"
}

#----------------------
# App Service Vars
#----------------------

identity_name                       = "acr"                 
resource_group_name_identity        = "rg-eastus-app-default"
service_plan_name                   = "appbingopizza"
kind                                = "Linux"
tier                                = "Free"
size                                = "F1"
acr_url                             = "https://acrpizzadefaulteastusnb0x.azurecr.io"
arc_username                        = "acrpizzadefaulteastusnb0x"
arc_password                        = "vmkqmRp/NJj82y0wECs73fIfBvhw2PAsef54Jltarl+ACRCd++Tm"
app_service_name                    = "bingopizza"
https_only                          = false
scm_type                            = "None"
always_on                           = true