module "ssl" {
	source = "modules/ssl"
}

module "elb" {
	source = "modules/elb"

	security_group_ids = "${module.vpc.elb_security_group_id}"
	subnets = ["${module.vpc.public_subnet_ids}"]
	ssl_cert_arn = "${module.ssl.ssl_cert_arn}"
	tags = {
		Terraform = "true"
		Environment = "Production"
		Service = "App"
		Version = "0.0.1"
	}
}
