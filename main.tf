module "label" {
  source     = "git::https://github.com/Play-n-GO-Platform-Services/terraform-null-label.git?ref=playngoplatformv1.0"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
  enabled    = var.enabled
}

resource "aws_vpc" "emr" {
  count                            = var.enabled ? 1 : 0
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = true
  tags                             = module.label.tags
}

# If `aws_default_security_group` is not defined, it would be created implicitly with access `0.0.0.0/0`
resource "aws_default_security_group" "emr" {
  count  = var.enabled ? 1 : 0
  vpc_id = element(concat(aws_vpc.emr.*.id,list("")),0)
  tags = {
    Name = "Default Security Group"
  }
}

resource "aws_internet_gateway" "emr" {
  count  = var.enabled ? 1 : 0
  vpc_id = element(concat(aws_vpc.emr.*.id,list("")),0)
  tags   = module.label.tags
}
