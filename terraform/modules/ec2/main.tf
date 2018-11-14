resource "aws_launch_configuration" "nodes" {
	name_prefix = "${var.name_prefix}"
	image_id = "${data.aws_ami.coreos.id}"
	instance_type = "${var.instance_type}"
	security_groups = ["${var.security_group_ids}"]
	user_data = "${data.template_file.cloud-config.rendered}"
	lifecycle {
		create_before_destroy = true
	}
}

resource "aws_autoscaling_group" "nodes" {
	name_prefix = "${var.name_prefix}"
	max_size = "${var.asg_max_size}"
	min_size = "${var.asg_min_size}"
	desired_capacity = "${var.asg_desired_capacity}"
	health_check_grace_period = "${var.health_check_grace_period}"
	health_check_type = "${var.health_check_type}"
	force_delete = "${var.force_delete}"
	load_balancers = ["${var.elb_name}"]
	launch_configuration = "${aws_launch_configuration.nodes.name}"
	vpc_zone_identifier = ["${var.subnet_ids}"]
	tags = "${var.tags}"
}
