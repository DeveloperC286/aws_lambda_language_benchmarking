resource "null_resource" "rust_compile" {
  triggers = {
    source_code_hash = base64sha256(file("${path.module}/../rust/aws/src/main.rs"))
  }

  provisioner "local-exec" {
    command     = "rustup toolchain install stable-x86_64-unknown-linux-gnu --profile minimal && cross build --target x86_64-unknown-linux-musl --release && mkdir -p ./compiled/ && cp ./target/x86_64-unknown-linux-musl/release/aws_lambda_language_benchmarking ./compiled/bootstrap"
    working_dir = "${path.module}/../rust/aws"
  }
}

data "archive_file" "rust_lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../rust/aws/compiled"
  output_path = "${path.module}/rust_lambda.zip"

  depends_on = [null_resource.rust_compile]
}

resource "aws_lambda_function" "rust_128_mb" {
  function_name = "rust_128_mb"

  # Runtime enviroment
  runtime     = "provided.al2"
  memory_size = 128

  # Source code
  handler          = "doesnt.matter"
  filename         = data.archive_file.rust_lambda_zip.output_path
  source_code_hash = data.archive_file.rust_lambda_zip.output_base64sha256

  # IAM
  role = aws_iam_role.lambda_iam_role.arn
}
