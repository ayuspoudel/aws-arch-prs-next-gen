locals {
  function_name = "${var.project}-${var.owner}-function"

  reserved_tags = {
    Owner        = var.owner
    Project      = var.project
    Terraform    = "true"
    Lifecycle    = var.resource_lifecycle
    CreatedDate  = timestamp()
    Managed_by   = "Terraform"
  }

  all_tags = merge(local.reserved_tags, var.tags)
}
