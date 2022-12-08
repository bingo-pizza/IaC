data "azurerm_resource_group" "app" {
  name = var.resource_group_name
}

data "azurerm_user_assigned_identity" "assigned_identity_acr_pull" {
 name                = var.identity_name
 resource_group_name = var.resource_group_name_identity
}

resource "azurerm_app_service_plan" "my_service_plan" {
 name                = var.service_plan_name
 location            = var.location == null ? data.azurerm_resource_group.app.location : var.location
 resource_group_name = data.azurerm_resource_group.app.name
 kind                = var.kind
 reserved = true

 sku {
   tier     = var.tier
   size     = var.size
 }
}

locals {
 env_variables = {
   DOCKER_REGISTRY_SERVER_URL            = var.acr_url
   DOCKER_REGISTRY_SERVER_USERNAME       = var.arc_username
   DOCKER_REGISTRY_SERVER_PASSWORD       = var.arc_password
   WEBSITES_ENABLE_APP_SERVICE_STORAGE = false 
 }
}

#resource "azurerm_app_service" "my_app_service_container" {
# name                    = var.app_service_name
# location                = var.location == null ? data.azurerm_resource_group.app.location : var.location
# resource_group_name     = data.azurerm_resource_group.app.name
# app_service_plan_id     = azurerm_app_service_plan.my_service_plan.id
# https_only              = var.https_only
#
#
# site_config {
#   scm_type  = var.scm_type
#   always_on = var.always_on
#
#   linux_fx_version  = "DOCKER|acrpizzadefaulteastusnb0x.azurecr.io/myapp:0.0.1" #define the images to usecfor you application
# }
#
# identity {
#   type         = "SystemAssigned, UserAssigned"
#   identity_ids = [data.azurerm_user_assigned_identity.assigned_identity_acr_pull.id]
# }
#
# app_settings = local.env_variables 
#}

