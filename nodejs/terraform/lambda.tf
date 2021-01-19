resource "aws_lambda_function" "nodejs_128_mb" {
  function_name = "nodejs_128_mb"

  # Runtime enviroment
  runtime     = "nodejs12.x"
  memory_size = 128

  # Source code
  handler  = "main.handler"
  filename = "lambda_function.zip"

  # IAM
  role = aws_iam_role.nodejs_128_mb_iam_role.arn
}
