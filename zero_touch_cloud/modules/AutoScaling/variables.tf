# Instance Variables
variable ami {
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

# Template Variables
variable template_name {
	type = string
}

variable template_description {
	type = string
}

variable sg {
	type = list(string)
}

# Auto Scaling Variables
variable asg_name {
	type = string
}

variable ava_zone_1 {
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
