locals {
  tfc_org_name = "Test-Abhinav"
}

data "tfe_organization" "allocatesoftware" {
  name = local.tfc_org_name
}

data "tfe_oauth_client" "vcs_client" {
  organization = data.tfe_organization.allocatesoftware.name
  name = "Test-IGGithubIssue"
}

output "org_name" {
value = data.tfe_organization.allocatesoftware.name
}

output "tfe_oauth_client_vcs_client_oauth_token_id" {
  value = data.tfe_oauth_client.vcs_client.oauth_token_id
}

data "tfe_project" "colibri" {

  name         = "New-project-5"
  organization = local.tfc_org_name
}

resource "tfe_workspace" "ws_workspace" {

  name         = "rldatix-test" # each.value.ws_name
  organization = local.tfc_org_name
  description  = "rldatix-test" 
  tag_names = ["databricks-workspace"]
  working_directory = "databricks-workspaces-new"
  auto_apply        = true
  terraform_version = "~>1.8.0"

  project_id          = data.tfe_project.colibri.id
  global_remote_state = false

  vcs_repo {
    identifier     = "abhinav-tripathi14/Repo15"
    branch         = "main"
    oauth_token_id = data.tfe_oauth_client.vcs_client.oauth_token_id # "ot-bCuQ7KCojFXLSoV8"
  }
  trigger_patterns = ["databricks-workspaces-new/*", "modules/*"]

  lifecycle {
    ignore_changes = [
      auto_apply
    ]
  }
}
