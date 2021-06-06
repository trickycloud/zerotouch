
locals {
  user_data = <<EOF
#!/bin/bash
echo "Hello Terraform!"
EOF
}


resource "aws_instance" "alpha_public_instance" {
  ami           = var.ami # us-east-1
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  associate_public_ip_address = true
  disable_api_termination = var.disable_api_termination
  tags          = {
    Name      = "Test Server"
    Type      = "Test Server"
  }
  user_data_base64 = base64encode(local.user_data)
}

#resource "aws_ami_from_instance" "alpha_ami" {
#  name               = "front-page-ami"
#  source_instance_id = aws_instance.alpha_public_instance.id
#}



resource "aws_ebs_snapshot" "alpha_snapshot" {
  volume_id = aws_instance.alpha_public_instance.root_block_device.0.volume_id

  tags = {
    Name = "zero-touch-snapshot"
  }
}

resource "aws_ami" "alpha_ami" {
  name                = "zero-touch-ami"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = aws_ebs_snapshot.alpha_snapshot.id
    volume_size = 8
  }
}



resource "aws_launch_template" "alpha_template" {
    name        = var.template_name
    description = var.template_description
    image_id    = aws_ami.alpha_ami.id
    instance_type = var.instance_type
    key_name      = var.key_name
    vpc_security_group_ids = var.sg
    disable_api_termination = var.disable_api_termination
               
}

resource "aws_autoscaling_group" "alpha_asg" {
    name    = var.asg_name    
    launch_template  {
    id      = aws_launch_template.alpha_template.id
    version = "$Latest"
    }
    #availability_zones        = [var.ava_zone_1]
    min_size                  = var.min_size
    max_size                  = var.max_size
    desired_capacity          = var.desired_capacity        
    health_check_grace_period = 30
    vpc_zone_identifier       = [var.public_subnet_id]      


}

