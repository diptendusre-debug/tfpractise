variable "region" {
    description="Regio to deploy"
    type=string
    default="us-east-1"
}
variable "cidrblock"{
    description="cidr block for vpc"
    type=string
    default="10.0.0.0/16"
}