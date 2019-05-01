output "output" {
  description = "Module outputs."

  value = {
    cloudfront_dns_record = "${module.cloudfront.cloudfront_dns_record}"
    cloudfront_bucket_arn = "${module.cloudfront.cloudfront_bucket_arn}"
    route53_dns_record    = "${module.cloudfront.route53_dns_record}"
  }
}