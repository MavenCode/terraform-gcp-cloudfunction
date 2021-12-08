module "gcp_function" {
  source = "../"
  filename = var.filename
  function_name = var.function_name
  function_entry_point = var.function_entry_point
  project = var.project
}

variable "project" { type = string }
variable "filename" { type = string }
variable "function_name" { type = string }
variable "function_entry_point" {}
