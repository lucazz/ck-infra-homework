provider "aws" {
	region = "us-east-1"
	profile = "convertkit"
}

terraform {
	backend "s3" {
		bucket = "convertkit-challenge-lucas"
		key    = "terraform.tfstate"
		region = "us-east-1"
		profile = "convertkit"
	}
}
