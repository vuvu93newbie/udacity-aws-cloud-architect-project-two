# TODO: Define the output variable for the lambda function.
output "lambda_log_entry" {
    value = aws_lambda_function.uda_lambda.arn
}
