resource "aws_lambda_function" "go_128_mb" {
  function_name = "go_128_mb"

  # Runtime enviroment
  runtime     = "go1.x"
  memory_size = 128

  # Source code
  handler  = "main"
  filename = "lambda_function.zip"

  # IAM
  role = aws_iam_role.go_128_mb_iam_role.arn
}
