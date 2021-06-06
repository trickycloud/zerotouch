#  EC2 variables
variable ami {
	type = string
}

variable number {
	type = string
}

variable key_name {
	type = string
}

variable disable_api_termination {
	type = bool
    default = true
}

variable instance_type {
	type = string
}

variable public_subnet_id {
	type = string
}

variable private_subnet_id {
	type = string
}



# Sg variables

variable vpc_id {
	type = string
}

variable sg_name {
    type = list(string)
}

variable "ingress_rules" {
    type = list(string)
}

