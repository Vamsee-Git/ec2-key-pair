resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/private_key.pem"
}

output "private_key_path" {
  value = local_file.private_key.filename
}


output "private_key_pem" {
  value = tls_private_key.example.private_key_pem
  sensitive = true
}
