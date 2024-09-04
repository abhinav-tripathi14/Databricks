locals {
  common_tags = {
    env                = "dev"
    ShortCustomerCode  = "ALLCUST"
    ManagedBy          = "Terraform"
    TerraformRepo      = "https://github.com/abhinav-tripathi14/Repo15"
    TerraformWorkspace = lower("databricks-infrastructure")
    product-family     = var.tags_product_family
    product-group      = var.tags_product_group
    geo                = var.tag_geo
    business_unit      = var.tags_business_unit
    client             = var.tags_client
    department         = var.tags_department
  }

}