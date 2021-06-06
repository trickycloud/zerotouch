provider "aws" {
   region = var.region
   access_key = var.AWS_ACCESS_KEY_ID
   secret_key = var.AWS_SECRET_ACCESS_KEY
}



module vpc {
	#count = var.create_vpc ? 1 : 0
	source = "./modules/vpc"
	region = var.region
	ava_zone_1 = var.ava_zone_1
	ava_zone_2 = var.ava_zone_2
	public_subnet = var.public_subnet
	private_subnet = var.private_subnet
	vpc_name = "zero_touch"
}


module s3_bucket {
	source = "./modules/s3"
}


module vpc_endpoints {
	source = "./modules/vpc-endpoints"
	vpc_id = module.vpc.vpc_id
	route_table_id = module.vpc.private_RT
}


module "key-pair" {
	source = "./modules/key-pair-gen"
	public_key = var.public_key
	key_name = var.key_name
}


module "ec2" {
	source = "./modules/ec2"
	number = var.number
	ami = var.ami
	instance_type = var.instance_type
	public_subnet_id = module.vpc.pb_subnet_1a
	private_subnet_id = module.vpc.private_subnet
	key_name = var.key_name
	disable_api_termination = var.disable_api_termination
	vpc_id = module.vpc.vpc_id
	sg_name = var.sg_name
	ingress_rules = var.sg_ingress_rule
	
}

module "rds_database" {
	source = "./modules/rds"
	identifier = var.identifier
#	count	= var.count
	engine  = var.engine
	engine_version    = var.engine_version
	instance_class    = var.instance_class
	allocated_storage = var.allocated_storage
	storage_type      = var.storage_type
#	storage_encrypted = var.storage_encrypted
	db_name      = var.db_name
	username  = var.username
	password  = var.password
	port      = var.port
	vpc_security_group_ids = module.ec2.security_group_ids
	availability_zone   = var.ava_zone_1
	multi_az  = var.multi_az
	iops      = var.iops
	publicly_accessible = var.publicly_accessible
	allow_major_version_upgrade = var.allow_major_version_upgrade
	auto_minor_version_upgrade  = var.auto_minor_version_upgrade
	apply_immediately   = var.apply_immediately
	subnet_group_name        = var.subnet_group_name
#	name_prefix = var.name_prefix
	description = var.description
	subnet_id  = [module.vpc.private_subnet,module.vpc.pb_subnet_1a]
	subnet_group_value = var.subnet_group_value
}


module "AutoScaling" {
	source = "./modules/AutoScaling"
	ami = var.ami
	key_name = var.key_name
	disable_api_termination = var.disable_api_termination
	instance_type = var.instance_type
	public_subnet_id = module.vpc.pb_subnet_1a
	template_name = var.template_name
	template_description = var.template_description
	sg = [module.ec2.security_group_ids[0]]
	asg_name = var.asg_name
	ava_zone_1 = var.ava_zone_1
	min_size = var.min_size
	max_size = var.max_size
	desired_capacity = var.desired_capacity
}
