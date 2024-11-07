resource "aws_iam_role" "lambda_role" {
    name = "uda_lambda_role"

    assume_role_policy = <<EOF
    {
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Action" : "sts:AssumeRole",
                "Principal" : {
                    "Service" : "lambda.amazonaws.com"
                },
                "Effect" : "Allow",
                "Sid": ""
            }
        ]
    }
    EOF
}


resource "aws_iam_policy" "lambda_policy" {
    name   = "uda_lambda_policy"
    policy = <<EOF
    {
        "Version" : "2012-10-17",
        "Statement" : [
            {
                "Action" : [
                    "logs:CreateLogGroup",
                    "logs:CreateLogStream",
                    "logs:PutLogEvents"
                ],
                "Effect"   : "Allow",
                "Resource" : "arn:aws:logs:*:*:*"
            }
        ]
    }
    EOF
}

resource "aws_iam_role_policy_attachment" "uda_lambda_policy_attach" {
    role = aws_iam_role.lambda_role.name
    policy_arn = aws_iam_policy.lambda_policy.arn
}
