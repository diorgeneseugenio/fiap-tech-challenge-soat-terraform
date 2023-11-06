resource "aws_db_instance" "fiap_soat_tech_challenge_db" {
  identifier           = "fiap-soat-tech-challenge-db"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  allocated_storage    = 10
  db_name              = "fiap_soat_tech_challenge_db"
  username             = "fiap_soat_tech_challenge"
  password             = "fiapsoattechchallenge"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  tags = {
    Name = "fiap_soat_tech_challenge_db"
  }
}
