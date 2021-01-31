data "archive_file" "python3_lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../python3/aws/src/"
  output_path = "${path.module}/python3_lambda.zip"
}

resource "aws_lambda_function" "python3_128_mb" {
  function_name = "python3_128_mb"

  # Runtime enviroment
  runtime     = "python3.8"
  memory_size = 128

  # Source code
  handler          = "main.lambda_handler"
  filename         = data.archive_file.python3_lambda_zip.output_path
  source_code_hash = data.archive_file.python3_lambda_zip.output_base64sha256

  # IAM
  role = aws_iam_role.lambda_iam_role.arn
}
