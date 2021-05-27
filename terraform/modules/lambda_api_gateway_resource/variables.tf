variable "runtime" {
    type = string
}

variable "memory_size" {
    type = number
}

variable "handler" {
    type = string
}



resource "aws_lambda_function" "go_128_mb" {
  filename         = data.archive_file.go_lambda_zip.output_path
  source_code_hash = data.archive_file.go_lambda_zip.output_base64sha256

  # IAM
  role = aws_iam_role.lambda_iam_role.arn
}
