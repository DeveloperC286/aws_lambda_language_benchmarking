data "archive_file" "nodejs_lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../nodejs/aws/src/"
  output_path = "${path.module}/nodejs_lambda.zip"
}

resource "aws_lambda_function" "nodejs_128_mb" {
  function_name = "nodejs_128_mb"

  # Runtime enviroment
  runtime     = "nodejs12.x"
  memory_size = 128
  timeout     = 10

  # Source code
  handler          = "main.handler"
  filename         = data.archive_file.nodejs_lambda_zip.output_path
  source_code_hash = data.archive_file.nodejs_lambda_zip.output_base64sha256

  # IAM
  role = aws_iam_role.lambda_iam_role.arn
}
