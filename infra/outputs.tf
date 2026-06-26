output "ec2_public_ip" {
  value = aws_instance.mlops_server.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.mlflow_artifacts.bucket
}

output "rds_endpoint" {
  value = aws_db_instance.mlops_db.endpoint
}

output "rds_password" {
  value     = random_password.db_password.result
  sensitive = true
}