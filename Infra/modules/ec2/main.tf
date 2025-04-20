resource "aws_instance" "web" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = var.subnet_id
  security_groups   = [var.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "my-instance"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

