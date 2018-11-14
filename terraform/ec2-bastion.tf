module "bastion" {
	source = "modules/bastion"
	hostname = "bastion"
	authorized_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOndEQEa+6CZ14T2qUhUXi2fqxY3SNxLXdM5CBghfPsR"
	security_group_ids = ["${module.vpc.bastion_security_group_id}"]
	subnet_ids = ["${module.vpc.public_subnet_ids}"]
	tags = [
	{
		key = "Name"
		value = "Bastion"
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
