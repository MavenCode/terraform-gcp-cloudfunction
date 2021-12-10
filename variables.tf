variable "runtime" {
  description = "The runtime the google cloud function should run in. A list of all available runtimes can be found here: https://cloud.google.com/functions/docs/concepts/exec#runtimes"
  type        = string
  default     = "nodejs12"
}

variable "source_filename" {
  description = "name of the file that contains the source code."
  type        = string
}

variable "source_dir" {
  description = "The path to the directory that contains the source code file. This directory should only contain the source code and will be compressed and uploaded to the bucket."
  type        = string
}

variable "function_name" {
  description = "A unique name for the cloud function on google. Like: function_1"
  type        = string
}

variable "environment_variables" {
  description = "These variables will be set to the process Environment Variable an could be access via the function. { MY_ENV_VAR =\"my-env-var-value\" }"
  default     = {}
}

variable "function_entry_point" {
  description = "The function entrypoint in the code. It might be the name of a method in your source code."
  type        = string
}

variable "function_invoker_user" {
  description = "Identities that will be granted the privilege to invoke the function. Public: 'allUsers'."
}

variable "timeout" {
  description = "Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds."
  default     = 60
}

variable "available_memory_mb" {
  description = "Memory (in MB), available to the function. Default value is 256. Possible values include 128, 256, 512, 1024, etc."
  default     = 128
}

variable "labels" {
  description = "These lables will be attached to your hosted function in the cloud. { my-label = \"my-label-value\" }"
  default     = {}
}

variable "bucket_location" {
  description = "Available Google Bucket locations: https://cloud.google.com/storage/docs/locations"
  default     = "US"
}

variable "project" {
  description = "Google Cloud Project ID"
  type        = string
}
variable "region" {
  description = "Google Cloud Region"
  default     = "us-central1"
}
