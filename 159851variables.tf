
variable "TFE_TOKEN" {
  type = string
}

variable "tag_geo" {
  type        = string
  description = "The AWS region in which a resource resides. Options: 'global', 'uk', 'ireland', 'australia', 'canada', 'germany', 'france', 'usa', 'denmark', 'sweden'"
  default     = "uk"
}

variable "tags_department" {
  type        = string
  description = "The service provided by the resource or specific function area of the resource. Doc https://rldatix.atlassian.net/wiki/spaces/SF/pages/2359525562/AWS+Tagging+Guidelines"
  default     = "development-infrastructure"
}

variable "tags_product_family" {
  type        = string
  description = "The product family that is using this resource. Doc: https://rldatix.atlassian.net/wiki/spaces/SF/pages/2412150787/Finance+tagging+hierarchy"
  default     = "data-reporting-platform"
}

variable "tags_product_group" {
  type        = string
  description = "The product group that this resource is using. Doc: https://rldatix.atlassian.net/wiki/spaces/SF/pages/2412150787/Finance+tagging+hierarchy"
  default     = "datahub"
}

variable "tags_business_unit" {
  type        = string
  description = "A business unit name using the resource. Doc: https://rldatix.atlassian.net/wiki/spaces/SF/pages/2359525562/AWS+Tagging+Guidelines"
  default     = "uki-health"
}

variable "tags_client" {
  type        = string
  description = "Name of the customer using this resource."
  default     = "shared"
}
