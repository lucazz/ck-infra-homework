resource "aws_db_instance" "convertkit" {
	allocated_storage = "${var.disk_size}"
	engine = "${var.engine}"
	engine_version = "${var.engine_version}"
	instance_class = "${var.instance_type}"
	multi_az = "${var.multi_az}"
	skip_final_snapshot = "${var.skip_final_snapshot}"
	final_snapshot_identifier = "${var.final_snapshot_identifier}"
	name = "${var.name}"
	identifier = "${var.name}"
	username = "${var.db_username}"
	password = "${var.db_password}"
	vpc_security_group_ids = ["${var.db_security_group_ids}"]
	db_subnet_group_name = "${coalesce(var.db_subnet_group_name, var.db_subnet_group_id)}"
}
