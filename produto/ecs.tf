locals {
  split_endpoint = element(split(":", aws_db_instance.db.endpoint), 0)
}
resource "aws_ecs_task_definition" "produto" {
  family                   = local.name
  task_role_arn            = var.ecs_task_role_arn
  execution_role_arn       = var.ecs_exec_role_arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name         = local.name,
    image        = "${aws_ecr_repository.produto.repository_url}:latest",
    essential    = true,
    portMappings = [{ containerPort = local.port, hostPort = local.port }],

    environment = [
      { name = "PORT", value = "${tostring(local.port)}" },
      { name = "DB_NAME", value = aws_db_instance.db.db_name },
      { name = "DB_HOST", value = local.split_endpoint },
      { name = "DB_PORT", value = "${tostring(aws_db_instance.db.port)}" },
      { name = "DB_USERNAME", value = aws_db_instance.db.username },
      { name = "DB_PASSWORD", value = "${aws_db_instance.db.username}-password" },
      { name = "NODE_ENV", value = "prod" },

    ]

    logConfiguration = {
      logDriver = "awslogs",
      options = {
        "awslogs-region"        = var.region,
        "awslogs-group"         = var.cloudwatch_log_group_name,
        "awslogs-stream-prefix" = local.name
      }
    },
  }])
}

resource "aws_ecs_service" "produto" {
  name            = local.name
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.produto.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    security_groups = [aws_security_group.produto.id]
    subnets         = var.private_subnets_id
  }

  lifecycle {
    ignore_changes = [desired_count]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.produto.arn
    container_name   = local.name
    container_port   = local.port
  }
}
