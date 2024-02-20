#3: API Integration
resource "aws_apigatewayv2_integration" "api_pagamento_integration" {
  api_id             = var.api_gateway_api_id
  integration_type   = "HTTP_PROXY"
  connection_id      = aws_apigatewayv2_vpc_link.vpc_link.id
  connection_type    = "VPC_LINK"
  description        = "VPC integration"
  integration_method = "ANY"
  integration_uri    = aws_lb_listener.pagamento.arn

  depends_on = [aws_lb.pagamento]
}
#4: APIGW Route
resource "aws_apigatewayv2_route" "pagamento_route" {
  api_id    = var.api_gateway_api_id
  route_key = "ANY /api/${local.name}/{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.api_pagamento_integration.id}"
}
resource "aws_apigatewayv2_route" "metodo_pagamento_route" {
  api_id    = var.api_gateway_api_id
  route_key = "ANY /api/metodo-pagamento/{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.api_pagamento_integration.id}"
}

resource "aws_apigatewayv2_vpc_link" "vpc_link" {
  name               = "${local.name}-vpclink"
  security_group_ids = [aws_security_group.pagamento_lb.id]
  subnet_ids         = var.private_subnets_id
}
