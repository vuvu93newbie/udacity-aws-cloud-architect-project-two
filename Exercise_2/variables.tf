# TODO: Define the variable for aws_region
variable "aws_region" {
    default = "us-east-1"
}

variable "lambda_name" { 
    default = "uda-lambda"
}

variable "greet_lambda_zip_path" {
  default = "greet_lambda.zip"
}