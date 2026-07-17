terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "github_token" {
  type      = string
  sensitive = true
  default   = ""
}

module "azure_webapp" {
  source = "git::https://x-access-token:${var.github_token}@github.com/TakuyaOkugawa/my-infra-repo.git//?ref=main"

  app_name         = "my-cool-app"
  runtime_stack    = "node"
  runtime_version  = "20-lts"
  app_command_line = "npx next start"
}
