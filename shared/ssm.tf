resource "aws_ssm_parameter" "api_gw_id" {
  name      = "/fiap-tech/api_gateway/api_id"
  type      = "String"
  value     = aws_apigatewayv2_api.api.id
  overwrite = true
}

resource "aws_ssm_parameter" "cognito_region" {
  name      = "/fiap-tech/cognito/region"
  type      = "String"
  value     = var.region
  overwrite = true
}

resource "aws_ssm_parameter" "client_clients_pool_id" {
  name      = "/fiap-tech/cognito/client/user-pool/id"
  type      = "String"
  value     = aws_cognito_user_pool.clients_pool.id
  overwrite = true
}

resource "aws_ssm_parameter" "client_clients_pool_client_id" {
  name      = "/fiap-tech/cognito/client/user-pool/client-id"
  type      = "String"
  value     = aws_cognito_user_pool_client.clients_pool_client.id
  overwrite = true
}

resource "aws_ssm_parameter" "client_identity_id" {
  name      = "/fiap-tech/cognito/client/client-identity-pool/id"
  type      = "String"
  value     = aws_cognito_identity_pool.client_identity_pool.id
  overwrite = true
}

resource "aws_ssm_parameter" "admin_clients_pool_id" {
  name      = "/fiap-tech/cognito/admin/user-pool/id"
  type      = "String"
  value     = aws_cognito_user_pool.admin_pool.id
  overwrite = true
}

resource "aws_ssm_parameter" "admin_clients_pool_client_id" {
  name      = "/fiap-tech/cognito/admin/user-pool/client-id"
  type      = "String"
  value     = aws_cognito_user_pool_client.admin_pool_client.id
  overwrite = true
}

resource "aws_ssm_parameter" "admin_identity_id" {
  name      = "/fiap-tech/cognito/admin/client-identity-pool/id"
  type      = "String"
  value     = aws_cognito_identity_pool.admin_identity_pool.id
  overwrite = true
}
