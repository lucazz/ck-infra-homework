output "ssl_cert_arn" {
  value = "${aws_iam_server_certificate.convertkit.arn}"
}
