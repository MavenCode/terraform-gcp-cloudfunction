module "gcp_function" {
  source                = "../../"
  source_filename       = var.source_filename
  source_dir            = var.source_dir
  function_name         = var.function_name
  function_entry_point  = var.function_entry_point
  function_invoker_user = var.function_invoker_user
  project               = var.project
}

variable "source_filename" { type = string }
variable "source_dir" { type = string }
variable "function_name" { type = string }
variable "function_entry_point" {}
variable "function_invoker_user" { type = string }
variable "project" { type = string }
