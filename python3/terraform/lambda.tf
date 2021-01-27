resource "aws_lambda_function" "python3_128_mb" {
  function_name = "python3_128_mb"

  # Runtime enviroment
  runtime     = "python3.8"
  memory_size = 128

  # Source code
  handler  = "main.lambda_handler"
  filename = "lambda_function.zip"

  # IAM
  role = aws_iam_role.python3_128_mb_iam_role.arn
}
