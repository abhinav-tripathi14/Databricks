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

  name         = "Test-3" # each.value.ws_name
  organization = local.tfc_org_name
  description  = "Test-2" 
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

###########################################################
# Variable Set creation for Databricks Values
###########################################################
resource "tfe_variable_set" "databricks_account_values_var_set" {

  name         = "databricks_account"
  description  = "Databricks Acccount level variables"
  organization = data.tfe_organization.allocatesoftware.name
}

resource "tfe_variable" "databricks_account_id" {

  key             = "databricks_account_id"
  value           = "0adadfb6-215e-4626-a676-c7ed67144454"
  category        = "terraform"
  description     = "The databricks account id value"
  variable_set_id = tfe_variable_set.databricks_account_values_var_set.id
}

resource "tfe_variable" "databricks_base_account_url" {

  key             = "databricks_base_account_url"
  value           = "https://accounts.cloud.databricks.com"
  category        = "terraform"
  description     = "The databricks account base url value"
  variable_set_id = tfe_variable_set.databricks_account_values_var_set.id
}

resource "tfe_variable" "databricks_client_id" {

  key             = "client_id"
  value           = "testclientid"
  category        = "terraform"
  description     = "The databricks spi client id value"
  variable_set_id = tfe_variable_set.databricks_account_values_var_set.id
}

resource "tfe_variable" "databricks_client_secret" {

  key             = "client_secret"
  value           = "testsecret"
  category        = "terraform"
  description     = "The databricks spi client secret value"
  variable_set_id = tfe_variable_set.databricks_account_values_var_set.id
  sensitive       = true
}
