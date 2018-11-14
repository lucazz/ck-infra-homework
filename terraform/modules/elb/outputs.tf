output "name" {
	value = "${aws_elb.convertkit.name}"
}

output "dns_name" {
	value = "${aws_elb.convertkit.dns_name}"
}
