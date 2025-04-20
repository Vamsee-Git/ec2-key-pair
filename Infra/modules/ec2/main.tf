resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "my-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_instance" "web" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = aws_key_pair.deployer.key_name
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

resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/private_key.pem"
}

output "private_key_path" {
  value = local_file.private_key.filename
}


output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

output "private_key_pem" {
  value = tls_private_key.example.private_key_pem
  sensitive = true
}
