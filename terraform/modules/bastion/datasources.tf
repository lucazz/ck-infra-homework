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
	owners = ["595879546273"]
}

data "template_file" "cloud-config" {
	template = "${file("${path.module}/cloud-config/cloud-config.yaml")}"
	vars {
		hostname = "${var.hostname}"
		authorizend_keys = "${var.authorized_keys}"
	}
}

