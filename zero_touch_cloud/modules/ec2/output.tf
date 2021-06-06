output "public_id" {
  description = "List of IDs of instances"
  value       = aws_instance.alpha_public_instance[*].id
}

output "private_id" {
  description = "List of IDs of instances"
  value       = aws_instance.alpha_private_instance[*].id
}

output "public_arn" {
  description = "List of ARNs of instances"
  value       = aws_instance.alpha_public_instance[*].arn
}

output "private_arn" {
  description = "List of ARNs of instances"
  value       = aws_instance.alpha_private_instance[*].arn
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, alpha_instance is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.alpha_public_instance[*].public_dns
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.alpha_public_instance[*].public_ip
}


output "public_instance_state" {
  description = "List of instance states of instances"
  value       = aws_instance.alpha_public_instance[*].instance_state
}

output "security_group_ids" {
  value = aws_security_group.alpha_sg[*].id
}
