resource "aws_lambda_function" "rust_128_mb" {
  function_name = "rust_128_mb"

  # Runtime enviroment
  runtime     = "provided.al2"
  memory_size = 128

  # Source code
  handler  = "doesnt.matter"
  filename = "lambda_function.zip"

  # IAM
  role = aws_iam_role.rust_128_mb_iam_role.arn
}
