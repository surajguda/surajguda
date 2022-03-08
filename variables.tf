variable "vpc_cidr" {
  type = string
  description = "The CIDR to use for the VPC."
}
variable "region" {
  type = string
  description = "The region into which to deploy the VPC."
}
variable "availability_zones" {
  type = list(string)
  description = "The availability zones for which to add subnets."
  default=["us-west-2a","us-west-2b"]
}

variable "component" {
  type = string
  description = "The component this network will contain."
}
variable "deployment_identifier" {
  type = string
  description = "An identifier for this instantiation."
}
variable "dependencies" {
  description = "A comma separated list of components depended on my this component."
  type = list(string)
  default = []
}

variable "private_subnets_offset" {
  description = "The number of /24s to offset the private subnets in the VPC CIDR."
  type = number
  default = 0
}

variable "include_route53_zone_association" {
  description = "Whether or not to associate the VPC with a zone id (\"yes\" or \"no\")."
  type = string
  default = "yes"
}

variable "private_zone_id" {
  description = "The ID of the private Route 53 zone."
  type = string
  default = ""
}
variable "owner"{
    description = "The owner of the workload"
    type = string
}

variable "source_repo"{
    description = "The source repository"
    type = string
}

variable "peer_owner_id"{
    description = "The AWS account id of the source data account"
    type = string
}
variable "peer_vpc_id"{
    description = "The VPC id of the network where the source data exists"
    type = string
}
variable "peer_vpc_cidr"{
    description = "The CIDR range of the VPC where the source data resides"
    type = string
}
variable "firewall_subnet_cidr"{
  description = "The CIDR range of the Vpc"
  type = string
}
variable "secretsmanager_endpoint_subnet_ids"{
 description= " Subnets which are used to create secret manager endpoint "
 type = string
}