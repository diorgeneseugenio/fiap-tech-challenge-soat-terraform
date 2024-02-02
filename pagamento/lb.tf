resource "aws_security_group" "pagamento_lb" {
  name   = "${local.name}-alb-sg"
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "pagamento" {
  name   = "${local.name}-sg"
  vpc_id = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = local.port
    to_port         = local.port
    security_groups = [aws_security_group.pagamento_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "pagamento_db" {
  name   = "${local.name}-db-sg"
  vpc_id = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = local.db_port
    to_port         = local.db_port
    security_groups = [aws_security_group.pagamento.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "pagamento" {
  name            = "${local.name}-lb"
  subnets         = var.subnets_id
  security_groups = [aws_security_group.pagamento_lb.id]
}

resource "aws_lb_target_group" "pagamento" {
  name        = "${local.name}-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "pagamento" {
  load_balancer_arn = aws_lb.pagamento.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.pagamento.arn
    type             = "forward"
  }
}
