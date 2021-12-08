variable "project" {
  description = "Google Cloud Project ID"
}
variable "region" {
  description = "Google Cloud Region"
  default     = "us-central1"
}

variable "runtime" {
  description = "The runtime the google cloud function should run in. A list of all available runtimes can be found here: https://cloud.google.com/functions/docs/concepts/exec#runtimes"
  type        = string
  default     = "nodejs12.x"
}

variable "filename" {
  description = "The path to the .zip file that contains the cloud function source code."
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
  description = "The function entrypoint in the code. This is the name of the method in the code which receives the event and context parameter when this Lambda function is triggered. e.g: function_1.handler"
  type        = string
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
  description = "{ my-label = \"my-label-value\" }"
  default     = {}
}

variable "bucket_location" {
  description = "Available Google Bucket locations: https://cloud.google.com/storage/docs/locations"
  default     = "US"
}
