locals {
  metastores_file_path = "../config/account/metastores.yaml"
  metastores           = yamldecode(file(local.metastores_file_path))
}

module "metastores" {
  source = "../modules/databricks_metastore"

  for_each = { for ms in local.metastores : ms["name"] => ms }

  metastore_name        = each.value.name
  metastore_region      = each.value.region
  metastore_owner_name  = each.value.owner
  databricks_workspaces = each.value.databricks_workspaces_uc
  databricks_account_id = var.databricks_account_id

  providers = {
    databricks = databricks.account
  }
}
