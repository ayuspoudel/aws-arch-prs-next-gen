variable "project" {
  description = "Project name for naming and tagging."
  type        = string
}

variable "owner" {
  description = "Owner of the infrastructure."
  type        = string
  default     = "ayush"
}

variable "resource_lifecycle" {
  description = "Lifecycle tag (temporary or longterm)"
  type        = string
  default     = "temporary"
}

variable "force_destroy" {
  description = "Allow force destroy of the S3 bucket."
  type        = bool
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "User-defined additional tags"
  default     = {}

  validation {
    condition = alltrue([
      !contains(keys(var.tags), "Lifecycle"),
      !contains(keys(var.tags), "Project"),
      !contains(keys(var.tags), "Owner"),
      !contains(keys(var.tags), "Managed_by"),
      !contains(keys(var.tags), "Terraform"),
      !contains(keys(var.tags), "CreatedDate")
    ])
    error_message = "You cannot override reserved tags: Lifecycle, Project, Owner, Terraform, CreatedDate, Managed_by"
  }
}
