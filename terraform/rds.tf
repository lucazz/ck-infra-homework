module "rds" {
	source = "modules/rds"
	db_username = "convertkit"
	db_password = "redacted"
	db_security_group_ids = ["${module.vpc.db_security_group_id}"]
	db_security_group_ids = ["${module.vpc.db_security_group_id}"]
	db_subnet_group_id = "${module.vpc.db_subnet_group_id}"
	db_subnet_group_name = "convertkit"
}
