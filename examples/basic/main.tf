##############################################################################
# Resource Group
##############################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.0.5"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

##############################################################################
# Create Cloud Object Storage instance and a bucket
##############################################################################

module "cos" {
  source            = "terraform-ibm-modules/cos/ibm"
  version           = "6.10.1"
  resource_group_id = module.resource_group.resource_group_id
  region            = var.region
  cos_instance_name = "${var.prefix}-cos"
  cos_tags          = var.resource_tags
  bucket_name       = "${var.prefix}-bucket"
  # disable retention for test environments - enable for stage/prod
  retention_enabled      = false
  kms_encryption_enabled = false
}
