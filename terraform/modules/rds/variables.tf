variable "name" {
	type = "string"
	default = "convertkit"
}

variable "disk_size" {
	type = "string"
	default = "10"
}

variable "engine" {
	type = "string"
	default = "mysql"
}

variable "engine_version" {
	type = "string"
	default = "8.0.11"
}

variable "instance_type" {
	type = "string"
	default = "db.t2.micro"
}

variable "multi_az" {
	type = "string"
	default = "true"
}

variable "skip_final_snapshot" {
	type = "string"
	default = "false"
}

variable "final_snapshot_identifier" {
	type = "string"
	default = "backup"
}

variable "db_username" {
	type = "string"
}

variable "db_password" {
	type = "string"
}

variable "db_subnet_group_name"{
	type = "string"
}

variable "db_subnet_group_id"{
	type = "string"
}

variable "db_security_group_ids"{
	type = "list"
	default = ["convertkit"]
}
