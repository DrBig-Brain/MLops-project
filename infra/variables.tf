variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "mlflow_admin"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "mlops-churn"
}

variable "my_ip" {
  description = "Your IP address for SSH access (CIDR format, e.g. 1.2.3.4/32)"
  type        = string
}