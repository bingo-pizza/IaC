#----------------------
# RG Outputs
#----------------------

output "rg_name" {
  value = azurerm_resource_group.rg.*.name
}

output "rg_location" {
  value = azurerm_resource_group.rg.*.location
}

#----------------------
# ACR Outputs
#----------------------

output "acr_id" {
  value     = var.acr_module_enabled == true ? module.acr[0].acr_id : null
  sensitive = true
}
