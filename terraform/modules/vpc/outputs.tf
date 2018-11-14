output "vpc_id" {
	value = "${aws_vpc.convertkit.id}"
}

output "db_security_group_id" {
	value = "${aws_security_group.rds.id}"
}

output "elb_security_group_id" {
	value = "${aws_security_group.elb.id}"
}

output "nodes_security_group_id" {
	value = "${aws_security_group.nodes.id}"
}

output "bastion_security_group_id" {
	value = "${aws_security_group.bastion.id}"
}

output "public_subnet_ids" {
	value = ["${aws_subnet.public.*.id}"]
}

output "nodes_subnet_ids" {
	value = ["${aws_subnet.nodes.*.id}"]
}

output "db_subnet_group_id" {
	value = "${aws_db_subnet_group.rds.id}"
}
