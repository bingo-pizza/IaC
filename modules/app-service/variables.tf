variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "location" {
  type        = string
  description = "Localidade do Azure Container Registry"
}


variable "identity_name" {
  type        = string
  description = "Nome da identidade gerenciada"
}

variable "resource_group_name_identity" {
  type        = string
  description = "Nome do Resource Group"
}

variable "service_plan_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "kind" {
  type        = string
  description = "O tipo de Plano do Serviço de Aplicativo a ser criado"
  validation {
  condition     = can(regex("Windows|Linux|elastic|xenon|FunctionApp", var.kind))
  error_message = "Selecione apenas um dos valores aceitos: Windows, Linux, elastic, xenon, FunctionApp."
  }
}

variable "tier" {
  type        = string
  description = "Especifica o tipo de preço do plano."
}

variable "size" {
  type        = string
  description = "Especifica o tamanho da instância do plano."
}

variable "acr_url" {
  type        = string
  description = "url do azure container registrer."
}

variable "arc_username" {
  type        = string
  description = "User do azure container registrer."
}

variable "arc_password" {
  type        = string
  description = "Password do azure container registrer."
}

variable "app_service_name" {
  type        = string
  description = "Nome do app service."
}

variable "https_only" {
  type        = bool
  description = "O App Service só pode ser acessado via HTTPS."
}

variable "scm_type" {
  type        = string
  description = "O tipo de controle de origem habilitado para este serviço de aplicativo."
  validation {
  condition     = can(regex("None|BitbucketGit|BitbucketHg|CodePlexGit|Dropbox|ExternalGit|ExternalHg|GitHub|LocalGit|OneDrive|Tfs|VSO|VSTSRM", var.scm_type))
  error_message = "Selecione apenas um dos valores aceitos: None, BitbucketGit, BitbucketHg, ExternalGit, ExternalHg, GitHub, LocalGit, OneDrive, Tfs, VSO ou VSTSRM."
  }
}

variable "always_on" {
  type        = bool
  description = "O App Service só pode ser acessado via HTTPS."
}
