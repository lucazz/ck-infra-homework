resource "aws_elb" "convertkit" {
	name = "${var.name}"
	security_groups = ["${var.security_group_ids}"]
	subnets = ["${var.subnets}"]
	listener {
		instance_port = "${var.instance_port}"
		instance_protocol = "${var.instance_protocol}"
		lb_port = "${var.lb_port}"
		lb_protocol = "${var.lb_protocol}"
		ssl_certificate_id = "${var.ssl_cert_arn}"
	}
	health_check {
		healthy_threshold = "${var.hc_healty_threshold}"
		unhealthy_threshold = "${var.hc_unhealthy_threshold}"
		timeout = "${var.hc_timeout}"
		target = "${var.hc_target}"
		interval = "${var.hc_interval}"
	}
	cross_zone_load_balancing = "${var.cross_zone_lb}"
	idle_timeout = "${var.idle_timeout}"
	connection_draining = "${var.connection_draining}"
	connection_draining_timeout = "${var.connection_draining_timeout}"
	tags = "${var.tags}"
}
