resource "aws_cognito_user_pool" "clients_pool" {
  name = "clientes-pool"

  username_configuration {
    case_sensitive = false
  }

  tags = {
    Name = "clients_pool"
  }
}

resource "aws_cognito_user_pool" "admin_pool" {
  name = "admin-pool"

  username_configuration {
    case_sensitive = false
  }

  tags = {
    Name = "admin_pool"
  }
}

resource "aws_cognito_user_pool_client" "clients_pool_client" {
  name = "pool-client"

  user_pool_id = aws_cognito_user_pool.clients_pool.id
}

resource "aws_cognito_user_pool_client" "admin_pool_client" {
  name = "pool-admin"

  user_pool_id = aws_cognito_user_pool.admin_pool.id
}
