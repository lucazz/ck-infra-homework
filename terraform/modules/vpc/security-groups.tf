resource "aws_security_group" "bastion" {
	name = "bastion"
	vpc_id = "${aws_vpc.convertkit.id}"
	tags = "${var.tags}"
}

resource "aws_security_group" "elb" {
	name = "elb"
	vpc_id = "${aws_vpc.convertkit.id}"
	tags = "${var.tags}"
}

resource "aws_security_group" "rds" {
	name = "db_nodes"
	vpc_id = "${aws_vpc.convertkit.id}"
	tags = "${var.tags}"
}

resource "aws_security_group" "nodes" {
	name = "nodes"
	vpc_id = "${aws_vpc.convertkit.id}"
	tags = "${var.tags}"
}

resource "aws_security_group_rule" "allow_bastion_outbound" {
	type = "egress"
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.bastion.id}"
}

resource "aws_security_group_rule" "allow_ssh_bastion" {
	type = "ingress"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.bastion.id}"
}

resource "aws_security_group_rule" "allow_outbound" {
	type = "egress"
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.nodes.id}"
}

resource "aws_security_group_rule" "allow_https_elb" {
	type = "ingress"
	from_port = 443
	to_port = 443
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.elb.id}"
}

resource "aws_security_group_rule" "allow_elb_to_nodes" {
	type = "egress"
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["${aws_vpc.convertkit.cidr_block}"]
	security_group_id = "${aws_security_group.elb.id}"
}

resource "aws_security_group_rule" "allow_ssh_from_bastion" {
	type = "ingress"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	source_security_group_id = "${aws_security_group.bastion.id}"
	security_group_id = "${aws_security_group.nodes.id}"
}

resource "aws_security_group_rule" "allow_http_from_bastion" {
	type = "ingress"
	from_port = 3000
	to_port = 3000
	protocol = "tcp"
	source_security_group_id = "${aws_security_group.bastion.id}"
	security_group_id = "${aws_security_group.nodes.id}"
}

resource "aws_security_group_rule" "allow_traffic_from_elb" {
	type = "ingress"
	from_port = 3000
	to_port = 3000
	protocol = "tcp"
	source_security_group_id = "${aws_security_group.elb.id}"
	security_group_id = "${aws_security_group.nodes.id}"
}

resource "aws_security_group_rule" "allow_internal_traffic" {
	type = "ingress"
	from_port = -1
	to_port = -1
	protocol = -1
	security_group_id = "${aws_security_group.nodes.id}"
	source_security_group_id = "${aws_security_group.nodes.id}"
}

resource "aws_security_group_rule" "allow_mysql_from_sg" {
	type = "ingress"
	from_port = 3306
	to_port = 3306
	protocol = "tcp"
	source_security_group_id = "${aws_security_group.nodes.id}"
	security_group_id = "${aws_security_group.rds.id}"
}
