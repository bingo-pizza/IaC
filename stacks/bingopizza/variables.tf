#----------------------
# Global Vars
#----------------------

variable "resource_group_names" {
  type        = list(string)
  description = "O nome do seu Resource Group"
}

variable "tags_rg" {
  type        = list(map(any))
  description = "Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = [{}]
}

variable "location" {
  type        = string
  description = "A região do datacenter onde seus recursos serão criados."
  default     = "eastus2"
}

variable "global_tags" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "acr_module_enabled" {
  type        = bool
  default     = true
}

variable "app_module_enabled" {
  type        = bool
  default     = true
}

#----------------------
# ACR Vars
#----------------------

variable "acr_name" {
  type        = string
  description = "Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry."
  default = ""
}

variable "tags_acr" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "acr_enable_admin" {
  type        = string
  description = "Habilita usuário administrativo no Azure Container Registry"
  default = ""
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`."
  validation {
    condition     = can(regex("Standard|Premium|Basic", var.sku))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Basic, Standard, ou Premium."
  }
}

#----------------------
# App Service Vars
#----------------------

variable "identity_name" {
  type        = string
  default     = ""
  description = "Nome da identidade gerenciada"
}

variable "resource_group_name_identity" {
  type        = string
  default     = ""
  description = "Nome do Resource Group"
}

variable "service_plan_name" {
  type        = string
  default     = ""
  description = "Nome do Resource Group"
}

variable "kind" {
  type        = string
  description = "O tipo de Plano do Serviço de Aplicativo a ser criado"
  default     = "Linux"
  validation {
  condition     = can(regex("Windows|Linux|elastic|xenon|FunctionApp", var.kind))
  error_message = "Selecione apenas um dos valores aceitos: Windows, Linux, elastic, xenon, FunctionApp."
  }
}

variable "tier" {
  type        = string
  default     = "Free"
  description = "Especifica o tipo de preço do plano."
}

variable "size" {
  type        = string
  default     = "F1"
  description = "Especifica o tamanho da instância do plano."
}

variable "acr_url" {
  type        = string
  default     = ""
  description = "url do azure container registrer."
}

variable "arc_username" {
  type        = string
  default     = ""
  description = "User do azure container registrer."
}

variable "arc_password" {
  type        = string
  default     = ""
  description = "Password do azure container registrer."
}

variable "app_service_name" {
  type        = string
  default     = ""
  description = "Nome do app service."
}

variable "https_only" {
  type        = bool
  default     = false
  description = "O App Service só pode ser acessado via HTTPS."
}

variable "scm_type" {
  type        = string
  description = "O tipo de controle de origem habilitado para este serviço de aplicativo."
  default     = "None"
  validation {
  condition     = can(regex("None|BitbucketGit|BitbucketHg|CodePlexGit|Dropbox|ExternalGit|ExternalHg|GitHub|LocalGit|OneDrive|Tfs|VSO|VSTSRM", var.scm_type))
  error_message = "Selecione apenas um dos valores aceitos: None, BitbucketGit, BitbucketHg, ExternalGit, ExternalHg, GitHub, LocalGit, OneDrive, Tfs, VSO ou VSTSRM."
  }
}

variable "always_on" {
  type        = bool
  default     = false
  description = "O App Service só pode ser acessado via HTTPS."
}