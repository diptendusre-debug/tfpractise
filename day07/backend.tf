terraform {
  backend "s3" {
    bucket       = "diptendu-terraform-state-bucket"
    key          = "ec2/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
