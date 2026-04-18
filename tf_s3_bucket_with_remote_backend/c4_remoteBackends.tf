terraform {
  backend "s3" {
    bucket = "mytfbucket-zf3v"
    key    = "dev/s3/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}
