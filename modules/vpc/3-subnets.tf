resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.this.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = element(var.azs, count.index % length(var.azs) )
  tags = merge({ Name = "${var.env}-private-${element(var.azs, count.index % length(var.azs))}"})
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.this.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = element(var.azs, count.index % length(var.azs) )
  tags = merge({ Name = "${var.env}-public-${element(var.azs, count.index % length(var.azs))}"})
}