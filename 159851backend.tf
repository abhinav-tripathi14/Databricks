terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Test-Abhinav"

    workspaces {
      name = "databricks-infrastructure"
    }
  }
}