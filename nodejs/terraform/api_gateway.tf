resource "aws_api_gateway_rest_api" "api_gateway_nodejs_128_mb" {
  name = "api_gateway_nodejs_128_mb"
}

resource "aws_api_gateway_resource" "api_gateway_nodejs_128_mb_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway_nodejs_128_mb.id
  parent_id   = aws_api_gateway_rest_api.api_gateway_nodejs_128_mb.root_resource_id
  path_part   = "hash"
}

resource "aws_api_gateway_method" "api_gateway_nodejs_128_mb_resource_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway_nodejs_128_mb.id
  resource_id   = aws_api_gateway_resource.api_gateway_nodejs_128_mb_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "api_gateway_nodejs_128_mb_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api_gateway_nodejs_128_mb.id
  resource_id             = aws_api_gateway_resource.api_gateway_nodejs_128_mb_resource.id
  http_method             = aws_api_gateway_method.api_gateway_nodejs_128_mb_resource_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.nodejs_128_mb.invoke_arn
}

resource "aws_lambda_permission" "api_gateway_nodejs_128_mb_permission" {
  function_name = aws_lambda_function.nodejs_128_mb.function_name
  principal     = "apigateway.amazonaws.com"
  action        = "lambda:InvokeFunction"
  source_arn    = "${aws_api_gateway_rest_api.api_gateway_nodejs_128_mb.execution_arn}/*/*"

  depends_on = [aws_lambda_function.nodejs_128_mb, aws_api_gateway_rest_api.api_gateway_nodejs_128_mb]
}

resource "aws_api_gateway_deployment" "api_gateway_nodejs_128_mb_production" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway_nodejs_128_mb.id
  stage_name  = "production"

  depends_on = [aws_api_gateway_integration.api_gateway_nodejs_128_mb_integration]
}
