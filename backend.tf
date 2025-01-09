terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Test-Abhinav"

    workspaces {
      name = "Databricks-workspace"
    }
  }

}
