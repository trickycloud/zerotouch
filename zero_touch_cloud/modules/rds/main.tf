# RDS Subnet Group


resource "aws_db_subnet_group" "alpha_db_subnet_group" {

  name        = var.subnet_group_name
#  name_prefix = var.name_prefix
  description = var.description
  subnet_ids  = var.subnet_id

  tags = {
      "Value" = var.subnet_group_value
    }
  
}


# RDS Instance

resource "aws_db_instance" "alpha_rds" {
#  count = var.create && false == local.is_mssql ? 1 : 0
  identifier = var.identifier
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
#  storage_encrypted = var.storage_encrypted
#  license_model     = var.license_model

  name                                = var.db_name
  username                            = var.username
  password                            = var.password
  port                                = var.port
# domain                              = var.domain
# domain_iam_role_name                = var.domain_iam_role_name
# iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.alpha_db_subnet_group.name
#  parameter_group_name   = var.parameter_group_name
#  option_group_name      = var.option_group_name

  availability_zone   = var.availability_zone
  multi_az            = var.multi_az
  iops                = var.iops
  publicly_accessible = var.publicly_accessible
#  ca_cert_identifier  = var.ca_cert_identifier

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
#  maintenance_window          = var.maintenance_window  
  skip_final_snapshot   = var.skip_final_snapshot

}
