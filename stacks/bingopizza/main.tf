resource "azurerm_resource_group" "rg" {
  count    = length(var.resource_group_names)
  name     = "${var.resource_group_names[count.index]}-${terraform.workspace}"
  location = var.location
  tags     = merge(var.global_tags, var.tags_rg[count.index])
}

module "acr" {
  count  = var.acr_module_enabled == true ? 1 : 0
  source = "../../modules/acr"

  acr_name            = "${var.acr_name}${terraform.workspace}${var.location}"
  enable_admin        = var.acr_enable_admin
  resource_group_name = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("acr", resource_group_name))])
  location            = var.location
  tags                = merge(var.global_tags, var.tags_acr)
  sku                 = var.sku

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "app" {
   count  = var.app_module_enabled == true ? 1 : 0
   source = "../../modules/app-service"

   resource_group_name                = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("app", resource_group_name))])
   location                           = var.location
   identity_name                      = var.identity_name
   resource_group_name_identity       = var.resource_group_name_identity
   service_plan_name                  = var.service_plan_name
   kind                               = var.kind
   tier                               = var.tier
   size                               = var.size
   acr_url                            = var.acr_url
   arc_username                       = var.arc_username
   arc_password                       = var.arc_password
   app_service_name                   = var.app_service_name
   https_only                         = var.https_only
   scm_type                           = var.scm_type
   always_on                          = var.always_on
}