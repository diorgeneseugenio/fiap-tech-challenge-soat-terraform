resource "aws_cognito_user_pool" "fiap_tech_challenge_clients_pool" {
  name = "clientes-pool"

  username_configuration {
    case_sensitive = false
  }

  tags = {
    Name = "fiap_soat_tech_challenge_clients_pool"
  }
}

resource "aws_cognito_user_pool" "fiap_tech_challenge_admin_pool" {
  name = "admin-pool"

  username_configuration {
    case_sensitive = false
  }

  tags = {
    Name = "fiap_soat_tech_challenge_admin_pool"
  }
}

resource "aws_cognito_user_pool_client" "fiap_tech_challenge_clients_pool_client" {
  name = "pool-client"

  user_pool_id = aws_cognito_user_pool.fiap_tech_challenge_clients_pool.id
}

resource "aws_cognito_user_pool_client" "fiap_tech_challenge_admin_pool_client" {
  name = "pool-admin"

  user_pool_id = aws_cognito_user_pool.fiap_tech_challenge_admin_pool.id
}
