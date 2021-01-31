resource "null_resource" "go_build" {
  triggers = {
    source_code_hash = base64sha256(file("${path.module}/../go/aws/src/main.go"))
  }

  provisioner "local-exec" {
    command     = "GOOS=linux go build -o compiled/main src/main.go"
    working_dir = "${path.module}/../go/aws"
  }
}

data "archive_file" "go_lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../go/aws/compiled"
  output_path = "${path.module}/go_lambda.zip"

  depends_on = [null_resource.go_build]
}

resource "aws_lambda_function" "go_128_mb" {
  function_name = "go_128_mb"

  # Runtime enviroment
  runtime     = "go1.x"
  memory_size = 128

  # Source code
  handler          = "main"
  filename         = data.archive_file.go_lambda_zip.output_path
  source_code_hash = data.archive_file.go_lambda_zip.output_base64sha256

  # IAM
  role = aws_iam_role.lambda_iam_role.arn
}
