variable "vpc_name" {
  type = string
  default = null
}

variable "vpc_cidr_block" {
  type = string
  default = null
}

variable "public_subnet_cidrs" {
    type = list(string)
    default = []
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = []
}

variable "public_availability_zones" {
  type = list(string)
  default = []
}

variable "private_availability_zones" {
  type = list(string)
  default = []
}

variable "tags" {
  type = map(any)
  default = {}
}
