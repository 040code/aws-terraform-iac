provider "aws" {
  region  = "eu-west-1"
  version = "2.8"
}

provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
  version = "2.8"
}

locals {
  dns = "${var.domain_name}"
}

data "aws_acm_certificate" "ssl_certificate_us_east" {
  provider = "aws.us-east-1"
  domain   = "*.${local.dns}"
  statuses = ["ISSUED"]
}

module "cloudfront" {
  source  = "philips-software/cloudfront-s3/aws"
  version = "1.3.0"

  environment = "040code"
  name        = "blog"
  subdomain   = "www"

  dns_name = "${local.dns}"

  ssl_certificate_arn = "${data.aws_acm_certificate.ssl_certificate_us_east.arn}"
}


