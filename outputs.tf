output "igw_id" {
  value       = element(concat(aws_internet_gateway.emr.*.id,list("")),0)
  description = "The ID of the Internet Gateway"
}

output "vpc_id" {
  value       = element(concat(aws_vpc.emr.*.id,list("")),0)
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value       = element(concat(aws_vpc.emr.*.cidr_block,list("")),0)
  description = "The CIDR block of the VPC"
}

output "vpc_main_route_table_id" {
  value       = element(concat(aws_vpc.emr.*.main_route_table_id,list("")),0)
  description = "The ID of the main route table associated with this VPC"
}

output "vpc_default_network_acl_id" {
  value       = element(concat(aws_vpc.emr.*.default_network_acl_id,list("")),0)
  description = "The ID of the network ACL created by default on VPC creation"
}

output "vpc_default_security_group_id" {
  value       = element(concat(aws_vpc.emr.*.default_security_group_id,list("")),0)
  description = "The ID of the security group created by default on VPC creation"
}

output "vpc_default_route_table_id" {
  value       = element(concat(aws_vpc.emr.*.default_route_table_id,list("")),0)
  description = "The ID of the route table created by default on VPC creation"
}

output "vpc_ipv6_association_id" {
  value       = element(concat(aws_vpc.emr.*.ipv6_association_id,list("")),0)
  description = "The association ID for the IPv6 CIDR block"
}

output "ipv6_cidr_block" {
  value       = element(concat(aws_vpc.emr.*.ipv6_cidr_block,list("")),0)
  description = "The IPv6 CIDR block"
}
