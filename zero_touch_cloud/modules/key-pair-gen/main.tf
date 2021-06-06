resource "tls_private_key" "this" {
  algorithm = "RSA"
}

#resource "aws_key_pair" "new" {
#    key_name        = var.key_name
#    public_key = tls_private_key.this.public_key_openssh
#    tags = {
#        Terraform = "ec2-new-key-pair"
#    }
#}

resource "aws_key_pair" "existing" {
    key_name        = var.key_name
#    key_name_prefix = var.key_name_prefix
    public_key = var.public_key
    tags = {
        Zero-Touch = "ec2-existing-key-pair"
        External = "yes"
    }
}

