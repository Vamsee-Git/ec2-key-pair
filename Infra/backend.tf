terraform{
  backend "s3" {
    bucket         = "terraform-state-backend-vamsee"
    key            = "terraform/ec2-key-pair"
    region         = "us-west-1"
    encrypt        = true
    #dynamodb_table = "Dynamodb-lock"
  }
}
