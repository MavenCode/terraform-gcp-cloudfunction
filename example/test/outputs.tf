output "function_url" {
  # Access the module output with module.<module_name>.<output_name>
  value = module.gcp_function.function_url
}
