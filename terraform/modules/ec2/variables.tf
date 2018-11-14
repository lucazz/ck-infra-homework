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
	default = "app-"
}

variable "asg_max_size"{
	type = "string"
	default = "3"
}

variable "asg_min_size"{
	type = "string"
	default = "1"
}

variable "asg_desired_capacity"{
	type = "string"
	default = "2"
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

variable "db_address"{
	type = "string"
}

variable "db_username"{
	type = "string"
}

variable "db_password"{
	type = "string"
}

variable "db_name"{
	type = "string"
}

variable "db_port"{
	type = "string"
	default = "3306"
}

variable "docker_tag"{
	type = "string"
}

variable "secret_key_name"{
	type = "string"
}

variable "security_group_ids"{
	type = "list"
}

variable "elb_name"{
	type = "string"
}

variable "subnet_ids"{
	type = "list"
}
