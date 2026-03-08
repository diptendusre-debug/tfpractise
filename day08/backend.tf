terraform {
  backend "s3" {
    bucket       = "diptendu-terraform-state-bucket"
    key          = "meta-arguments/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
