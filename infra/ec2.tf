data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_key_pair" "mlops_key" {
  key_name   = "${var.project_name}-key"
  public_key = file("~/.ssh/mlops_churn_key.pub")
}

resource "aws_instance" "mlops_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.mlops_key.key_name
  vpc_security_group_ids = [aws_security_group.mlops_sg.id]

  root_block_device {
    volume_size = 20 # gb, still within free tier (30gb limit)
    volume_type = "gp3"
  }

  tags = {
    Name    = "${var.project_name}-server"
    Project = var.project_name
  }
}