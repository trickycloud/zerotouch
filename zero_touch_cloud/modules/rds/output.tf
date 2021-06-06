# Dynamodb outputs

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.alpha_rds.id
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.alpha_rds.address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.alpha_rds.arn
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.alpha_rds.endpoint
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = aws_db_instance.alpha_rds.status
}
