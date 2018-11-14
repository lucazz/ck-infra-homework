resource "aws_eip" "nat"{
	depends_on = ["aws_internet_gateway.default"]
	vpc = true
}

resource "aws_vpc" "convertkit" {
	cidr_block = "${var.vpc_cidr_block}"
	enable_dns_hostnames = true
	enable_dns_support = true
	tags = "${var.tags}"
}

resource "aws_subnet" "public" {
	count = "${var.az_count}"
	cidr_block = "${cidrsubnet(aws_vpc.convertkit.cidr_block, 8, 10+count.index)}"
	availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
	vpc_id = "${aws_vpc.convertkit.id}"
	tags {
		Name = "public ${data.aws_availability_zones.available.names[count.index]} subnet"
	}
}

resource "aws_subnet" "rds" {
	count = "${var.az_count}"
	cidr_block = "${cidrsubnet(aws_vpc.convertkit.cidr_block, 8, 20+count.index + length(aws_subnet.public.*.id))}"
	availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
	vpc_id = "${aws_vpc.convertkit.id}"
	tags {
		Name = "rds ${data.aws_availability_zones.available.names[count.index]} subnet"
	}
}

resource "aws_subnet" "nodes" {
	count = "${var.az_count}"
	cidr_block = "${cidrsubnet(aws_vpc.convertkit.cidr_block, 8, 30+count.index + length(aws_subnet.public.*.id))}"
	availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
	vpc_id = "${aws_vpc.convertkit.id}"
	tags {
		Name = "nodes ${data.aws_availability_zones.available.names[count.index]} subnet"
	}
}

resource "aws_internet_gateway" "default" {
	vpc_id = "${aws_vpc.convertkit.id}"
	tags = "${var.tags}"
}

resource "aws_nat_gateway" "default" {
	depends_on = ["aws_internet_gateway.default"]
	allocation_id = "${aws_eip.nat.id}"
	subnet_id = "${aws_subnet.public.*.id[0]}"
	tags = "${var.tags}"
}

resource "aws_db_subnet_group" "rds" {
	name = "convertkit"
	subnet_ids = ["${aws_subnet.rds.*.id}"]
	tags = "${var.tags}"
}

resource "aws_route_table" "nodes" {
	vpc_id = "${aws_vpc.convertkit.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_nat_gateway.default.id}"
	}
	tags = "${var.tags}"
}

resource "aws_route_table" "rds" {
	vpc_id = "${aws_vpc.convertkit.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_nat_gateway.default.id}"
	}
	tags = "${var.tags}"
}

resource "aws_route_table" "public" {
	vpc_id = "${aws_vpc.convertkit.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.default.id}"
	}
	tags = "${var.tags}"
}

resource "aws_route_table_association" "public" {
	subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
	route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
	count = "${var.az_count}"
}

resource "aws_route_table_association" "rds" {
	subnet_id = "${element(aws_subnet.rds.*.id, count.index)}"
	route_table_id = "${element(aws_route_table.rds.*.id, count.index)}"
	count = "${var.az_count}"
}

resource "aws_route_table_association" "nodes" {
	subnet_id = "${element(aws_subnet.nodes.*.id, count.index)}"
	route_table_id = "${element(aws_route_table.nodes.*.id, count.index)}"
	count = "${var.az_count}"
}
