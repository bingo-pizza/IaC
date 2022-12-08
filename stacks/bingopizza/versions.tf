terraform {
  backend "azurerm" {
    storage_account_name = "stoterraformdev"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"

    # rather than defining this inline, the Access Key can also be sourced
    # from an Environment Variable - more information is available below.
    access_key = "93xHRON+MVn3UADWvgViqT/FD+L5N/qCz+A84t68uz0iTLN5hjbN8PAiEKJNLaMgg4Nvuro2WTgz+ASt+Ka1Uw=="
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.18.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "= 0.7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.1"
    }
  }
}