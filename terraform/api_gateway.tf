resource "aws_api_gateway_rest_api" "hashing_api" {
  name = "hashing_api"
}

resource "aws_api_gateway_deployment" "hashing_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.hashing_api.id
  stage_name  = "hashing"

  depends_on = [aws_api_gateway_integration.api_gateway_nodejs_128_mb_integration, aws_api_gateway_integration.api_gateway_go_128_mb_integration, aws_api_gateway_integration.api_gateway_python3_128_mb_integration, aws_api_gateway_integration.api_gateway_rust_128_mb_integration]
}
