# terraform-gcp-cloudfunction

This Terraform template provisions Cloud Function on GCP.

Google requirements:

- Create a project in GCP
- Create & activate billing account in GCP
- Enable "Cloud API"
- Enable "Cloud Build API"

Variables are as follows:
| Input variables | Description |
| ------------- | ------------- |
| runtime | The runtime the google cloud function should run in. A list of all available runtimes can be found here: https://cloud.google.com/functions/docs/concepts/exec#runtimes |
| source_filename | name of the file that contains the source code. |
| source_dir | The path to the directory that contains the source code file. This directory should only contain the source code and will be compressed and uploaded to the bucket. |
| function_name | A unique name for the cloud function on google. |
| environment_variables | These variables will be set to the process Environment Variable an could be access via the function. { MY_ENV_VAR =\"my-env-var-value\" } |
| function_entry_point | The function entrypoint in the code. It might be the name of a method in your source code. |
| function_invoker_user | Identities that will be granted the privilege to invoke the function. Public: 'allUsers'. |
| timeout | Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds. |
| available_memory_mb | Memory (in MB), available to the function. Default value is 256. Possible values include 128, 256, 512, 1024, etc. |
| labels | These lables will be attached to your hosted function in the cloud. { my-label = \"my-label-value\" } |
| bucket_location | Available Google Bucket locations: https://cloud.google.com/storage/docs/locations |
| project | Google Cloud Project ID |
| region | Google Cloud Region |

Default or sample values for variables are available in variables.tf.

Below, the provider requirement for module implementation and the infrastructure provider
| Requirements | |
|:---- | ----:|
|Name | Version |
|terraform | ~> 1.0, latest preferred |
| google | 4.3.0 |
