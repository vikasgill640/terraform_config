environment = "preprod"
vpc_cidr_block = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
public_availability_zones   =["us-east-1","us-east-1","us-east-1"]
private_availability_zones   =["us-east-1","us-east-1","us-east-1"]
vpc_name = "opsworld_vpc"
tags={
    environment = "prod"
    region      = "us-east-1"
    namespace   = "peak"
}