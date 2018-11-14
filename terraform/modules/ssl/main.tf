resource "aws_iam_server_certificate" "convertkit" {
	name = "convertkit-ssl-certificate"
	certificate_body = "${file("./modules/ssl/cfssl/convertkit.pem")}"
	private_key = "${file("./modules/ssl/cfssl/convertkit-key.pem")}"
}
