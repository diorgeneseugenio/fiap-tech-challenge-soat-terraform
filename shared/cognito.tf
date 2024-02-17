resource "aws_cognito_user_pool" "clients_pool" {
  name = "fiap-tech-client-pool"

  password_policy {
    require_numbers   = true
    require_symbols   = false
    require_uppercase = false
    require_lowercase = false
    minimum_length    = 6
  }

  username_configuration {
    case_sensitive = false
  }

  tags = {
    Name = "fiap_tech_client_pool"
  }
}

resource "aws_cognito_user_pool_client" "clients_pool_client" {
  name = "pool-client"

  user_pool_id = aws_cognito_user_pool.clients_pool.id

  explicit_auth_flows = [
    "ALLOW_ADMIN_USER_PASSWORD_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_PASSWORD_AUTH", "USER_PASSWORD_AUTH"
  ]
}

resource "aws_cognito_identity_pool" "client_identity_pool" {
  identity_pool_name               = "fiap-tech-client-identity"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.clients_pool_client.id
    provider_name           = "cognito-idp.${var.region}.amazonaws.com/${aws_cognito_user_pool.clients_pool.id}"
    server_side_token_check = true
  }
}

resource "aws_cognito_user_pool" "admin_pool" {
  name = "fiap-tech-admin-pool"

  username_configuration {
    case_sensitive = false
  }

  tags = {
    Name = "fiap_tech_admin_pool"
  }
}

resource "aws_cognito_user_pool_client" "admin_pool_client" {
  name = "pool-admin"

  user_pool_id = aws_cognito_user_pool.admin_pool.id

  explicit_auth_flows = [
    "ALLOW_ADMIN_USER_PASSWORD_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_PASSWORD_AUTH", "USER_PASSWORD_AUTH"
  ]
}

resource "aws_cognito_identity_pool" "admin_identity_pool" {
  identity_pool_name               = "fiap-tech-admin-identity"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.admin_pool_client.id
    provider_name           = "cognito-idp.${var.region}.amazonaws.com/${aws_cognito_user_pool.admin_pool.id}"
    server_side_token_check = true
  }
}

resource "aws_iam_role" "authenticated_role" {
  name = "fiap-tech-cognito-authenticated-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Federated = "cognito-identity.amazonaws.com"
      },
      Action = "sts:AssumeRoleWithWebIdentity",
      Condition = {
        StringEquals = {
          "cognito-identity.amazonaws.com:aud" = aws_cognito_identity_pool.admin_identity_pool.id
          "cognito-identity.amazonaws.com:aud" = aws_cognito_identity_pool.client_identity_pool.id
        },
        "ForAnyValue:StringLike" = {
          "cognito-identity.amazonaws.com:amr" = "authenticated"
        }
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "authenticated_policy_attachment" {
  name       = "fiap-tech-cognito-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  roles      = [aws_iam_role.authenticated_role.name]
}
