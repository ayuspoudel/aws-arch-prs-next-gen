module "lambda_function" {
  source = "../../modules/lambda"
  function = local.lambda_function
  project               = "ticketing-triage"
  owner                 = local.owner
  function_runtime      = "python3.11"  # Choose appropriate runtime
  function_handler      = "jira_automation.lambda_handler"  # Use the handler inside the Docker image
  package_type          = "Image"
  # Point to your ECR image URI (this is the format of the URI)
  image_uri =  "905418168893.dkr.ecr.us-east-1.amazonaws.com/automated-ticketing-and-triage:latest"

  # Lambda role ARN
  lambda_role_arn       = module.iam.iam_role_arn

  tags = {
    Purpose = "Event handler for creating Jira Ticket from Github Issue"
  }
}


