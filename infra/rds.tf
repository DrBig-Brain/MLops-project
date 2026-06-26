resource "aws_db_instance" "mlops_db" {
  identifier             = "${var.project_name}-db"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  db_name                = "mlopsdb"
  username               = var.db_username
  password               = random_password.db_password.result
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Project = var.project_name
  }
}