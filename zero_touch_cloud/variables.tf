#Variables main

variable AWS_ACCESS_KEY_ID {
	type = string
}
variable AWS_SECRET_ACCESS_KEY {
	type = string
}
variable instance_type {
	type = string
}
variable region {
	type = string
}
variable ava_zone_1 {
	type = string
}
variable ava_zone_2 {
	type = string
}
#variable "create_vpc" {
#  description = "Controls if VPC should be created (it affects almost all resources)"
#  type        = bool
#  default     = true
#}
variable public_subnet {
	type = string
}
variable number {
	type = string
}
variable private_subnet {
	type = string
}
variable vpc_name {
	type = string
}

variable sg_name {
    type = list(string)
}

variable sg_ingress_rule {
	type = list(string)
	default = [22.80]
}

variable key_name {
	type = string
}
variable public_key {
    type = string
}

variable ami {
	type = string
}

variable disable_api_termination {
	type = bool
	default = false
}


variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
}
variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  type        = string
  default     = null
}
variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
}
variable "engine" {
  description = "The database engine to use"
  type        = string
}
variable "engine_version" {
  description = "The engine version to use"
  type        = string
}
variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}
variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = null
}
variable "username" {
  description = "Username for the master DB user"
  type        = string
}
variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}
variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}
variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 0
}
variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}
variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}
variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}
variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

# RDS Subnet Group variables


variable "subnet_group_name" {
    type    = string
}

variable "description" {
    type    = string
}

variable "subnet_group_value" {
    type    = string
}



# Auto Sclaing Variables

variable template_name {
	type = string
}

variable template_description {
	type = string
}

variable asg_name {
	type = string
}

variable min_size {
	type = string
}

variable max_size {
	type = string
}

variable desired_capacity {
	type = string
}
