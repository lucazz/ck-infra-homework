ConvertKit Challenge
============

| Candidate | Role |
|---|---|
| Lucas do Amaral Saboya | Infrastructure Engineer |


### Terraform Configs

 - All aws configs reside in the [config-aws.tf](https://github.com/lucazz/ck-infra-homework/blob/master/terraform/config-aws.tf) file
 - All Availability Zones are dynamically set on the [VPC Module](https://github.com/lucazz/ck-infra-homework/blob/master/terraform/modules/vpc/)
 - All variables reside in any module's `variable.tf` file can be overriden at the command line level, IE:

		terraform apply -var db_password=L337_53CR37 -var secret_key_name=4N07H3R_L337_53CR37

 - For a list of all the available variables, [click here](https://github.com/lucazz/ck-infra-homework/blob/master/docs/VARIABLES.md)