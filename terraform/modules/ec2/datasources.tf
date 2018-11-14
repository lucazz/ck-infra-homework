data "aws_ami" "coreos" {
	most_recent = true
	filter {
	name   = "name"
	values = ["CoreOS-stable-*"]
	}
	filter {
		name   = "virtualization-type"
		values = ["hvm"]
	}
	owners = ["595879546273"] # CoreOS
}

data "template_file" "cloud-config" {
	template = "${file("${path.module}/cloud-config/cloud-config.yaml")}"
	vars {
		hostname = "${var.hostname}"
		authorizend_keys = "${var.authorized_keys}"
		secret_key_name = "${var.secret_key_name}"
		db_address = "${var.db_address}"
		db_name = "${var.db_name}"
		db_username = "${var.db_username}"
		db_password = "${var.db_password}"
		db_port = "${var.db_port}"
		docker_tag = "${var.docker_tag}"
	}
}
