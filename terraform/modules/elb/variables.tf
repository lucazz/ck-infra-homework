variable "name" {
	type = "string"
	default = "convertkit"
}

variable "instance_port" {
	type = "string"
	default = "3000"
}

variable "instance_protocol" {
	type = "string"
	default = "http"
}

variable "lb_port" {
	type = "string"
	default = "443"
}

variable "lb_protocol" {
	type = "string"
	default = "https"
}

variable "hc_healty_threshold" {
	type = "string"
	default = "2"
}

variable "hc_unhealthy_threshold" {
	type = "string"
	default = "4"
}

variable "hc_timeout" {
	type = "string"
	default = "3"
}

variable "hc_target" {
	type = "string"
	default = "HTTP:3000/"
}

variable "hc_interval" {
	type = "string"
	default = "5"
}

variable "cross_zone_lb" {
	type = "string"
	default = "true"
}

variable "idle_timeout" {
	type = "string"
	default = "400"
}

variable "connection_draining" {
	type = "string"
	default = "true"
}

variable "connection_draining_timeout" {
	type = "string"
	default = "400"
}

variable "security_group_ids" {
	type = "string"
}

variable "subnets" {
	type = "list"
}

variable "ssl_cert_arn" {
	type = "string"
}

variable "tags" {
	description = "A mapping of tags to assign to the resource"
	default = {}
}
