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

module "azure_webapp" {
  # URLにPAT（アクセストークン）を埋め込んでプライベートリポジトリを指定
  source = "git::https://<あなたのPAT>@github.com/<アカウント名>/my-infra-repo.git//?ref=main"

  rg_name                    = "rg-my-app-production"
  app_name                   = "my-cool-app"
  log_analytics_workspace_id = "/subscriptions/xxxxxx/resourcegroups/xxxxxx/providers/microsoft.operationalinsights/workspaces/xxxxxx"
  
  runtime_stack              = "node"
  runtime_version            = "20-lts"
  app_command_line           = "npx next start"
}
