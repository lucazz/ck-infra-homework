module "app" {
	source = "modules/ec2"
	hostname = "app"
	authorized_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOndEQEa+6CZ14T2qUhUXi2fqxY3SNxLXdM5CBghfPsR"
	db_password = "redacted"
	db_username = "convertkit"
	db_name = "convertkit"
	db_address = "${module.rds.db_address}"
	docker_tag = "95b7c19"
	secret_key_name = "redacted"
	security_group_ids = ["${module.vpc.nodes_security_group_id}"]
	elb_name = "${module.elb.name}"
	subnet_ids = ["${module.vpc.nodes_subnet_ids}"]
	tags = [
	{
		key = "Name"
		value = "App"
		propagate_at_launch = true
	},
	{
		key = "Terraform"
		value = "true"
		propagate_at_launch = true
	},
	{
		key = "Environment"
		value = "Production"
		propagate_at_launch = true
	},
	{
		key = "Service"
		value = "App"
		propagate_at_launch = true
	},
	{
		key = "Version"
		value = "0.0.1"
		propagate_at_launch = true
	},
	]
}
