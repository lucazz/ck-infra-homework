module "vpc" {
	source = "modules/vpc"
	tags = {
		Terraform = "true"
		Environment = "Production"
		Service = "App"
		Version = "0.0.1"
	}
}
