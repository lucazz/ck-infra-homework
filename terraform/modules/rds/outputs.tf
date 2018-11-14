output "db_address" {
  value = "${aws_db_instance.convertkit.address}"
}

output "db_name" {
  value = "${aws_db_instance.convertkit.name}"
}

output "db_username" {
  value = "${aws_db_instance.convertkit.username}"
}

output "db_port" {
  value = "${aws_db_instance.convertkit.port}"
}
