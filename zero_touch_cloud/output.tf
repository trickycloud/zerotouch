#output main
output "ec2_public_dns" {
  value   = module.ec2.public_dns
}

output "ec2_public_ip" {
  value    = module.ec2.public_ip
}


output "public_instance_state" {
  value	= module.ec2.public_instance_state
}

output "ec2_key_id" {
	value	= module.key-pair.this_key_pair_key_pair_id
}

output "rds_endpoints" {
  value = module.rds_database.db_instance_endpoint
}

output "rds_address" {
  value = module.rds_database.db_instance_address
}

output "private_subnet_id" {
  value = module.vpc.private_subnet
}

output "public_subnet_id" {
  value = module.vpc.pb_subnet_1a
}

