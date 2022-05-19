provider "aws" {
  region     = "us-east-1"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"      = "ami-0022f774911c1d690"
    "us-west-2"      = "ami-0022f774911c1d690a"
    "ap-southeast-1" = "ami-0022f774911c1d690b"
  }
}

resource "aws_instance" "dev" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
}

output "timestamp" {
  value = local.time
}
