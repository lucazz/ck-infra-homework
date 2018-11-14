variable "az_count" {
	default = "3"
}

variable "vpc_cidr_block" {
	default = "10.0.0.0/16"
}

variable "tags" {
	description = "A mapping of tags to assign to the resource"
	default = {}
}
