#EC2-Instance

resource "aws_instance" "alpha_public_instance" {
  count         = var.number
  ami           = var.ami # us-east-1
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  associate_public_ip_address = true
  disable_api_termination = var.disable_api_termination
  tags          = {
    Name      = "Front_end Server${count.index +1}"
    Type      = "Front_end Server"
  }
}

resource "aws_instance" "alpha_private_instance" {
  count         = var.number
  ami           = var.ami # us-east-2
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  key_name      = var.key_name
  associate_public_ip_address = false
  disable_api_termination = var.disable_api_termination
  tags          = {
    Name      = "Private Server${count.index +1}"
    Type      = "Private Server"
  }
}

resource "aws_security_group" "alpha_sg" {
  count = length(var.sg_name)
  name        = var.sg_name[count.index]
  description = "Security group for example usage with EC2 instance"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.ingress_rules)
  type              = "ingress"
  from_port         = var.ingress_rules[count.index]
  to_port           = var.ingress_rules[count.index]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "demo test"
  security_group_id = aws_security_group.alpha_sg[0].id
}

resource "aws_security_group_rule" "allow_all" {
  count = length(var.sg_name)
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.alpha_sg[count.index].id
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_network_interface_sg_attachment" "sg_public_attachment" {
  count = var.number
  security_group_id    = aws_security_group.alpha_sg[0].id
  network_interface_id = aws_instance.alpha_public_instance[count.index].primary_network_interface_id
}

resource "aws_network_interface_sg_attachment" "sg_private_attachment" {
  count = var.number
  security_group_id    = aws_security_group.alpha_sg[1].id
  network_interface_id = aws_instance.alpha_private_instance[count.index].primary_network_interface_id
}


