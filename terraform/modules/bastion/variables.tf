variable "instance_type"{
	description = "EC2 instance type to use"
	type = "string"
	default = "t2.nano"
}

variable "hostname"{
	type = "string"
}

variable "tags" {
	type = "list"
	description = "A mapping of tags to assign to the resource"
}

variable "name_prefix" {
	type = "string"
	default = "bastion-"
}

variable "asg_max_size"{
	type = "string"
	default = "1"
}

variable "asg_min_size"{
	type = "string"
	default = "1"
}

variable "asg_desired_capacity"{
	type = "string"
	default = "1"
}

variable "health_check_grace_period"{
	type = "string"
	default = "3600"
}

variable "health_check_type"{
	type = "string"
	default = "ELB"
}

variable "force_delete"{
	type = "string"
	default = "true"
}

variable "authorized_keys"{
	type = "string"
}

variable "security_group_ids"{
	type = "list"
}

variable "subnet_ids"{
	type = "list"
}
