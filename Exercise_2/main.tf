provider "aws" {
    region = var.aws_region
    shared_credentials_files = ["C:/Users/3right/.aws/credentials"]
}

data "archive_file" "zip_greet_lambda" {
    type = "zip"
    source_file = "greet_lambda.py"
    output_path = var.greet_lambda_zip_path
}

resource "aws_lambda_function" "uda_lambda" {
  function_name = var.lambda_name
  role =  aws_iam_role.lambda_role.arn
  filename = data.archive_file.zip_greet_lambda.output_path
  handler = "greet_lambda.lambda_handler"
  runtime = "python3.9"
  environment{
      variables = {
          greeting = "Vu Hello!"
      }
  }
}

resource "aws_cloudwatch_log_group" "uda_lambda_log-group" {
 name = "/aws/lambda/${var.lambda_name}"
}