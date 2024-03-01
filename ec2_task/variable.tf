variable "instance" {
    type =  any
    default = {}
}

variable "tags" {
  type = map(any)
  default = {}
}
variable "sg_name" {
  type = string
  default = "application_sg"
}
variable "sg_ingress_rule" {
  type =  any 
  default = []
}
# ===================================================================
#                 load balancer
# ===================================================================
variable "lb_name" {
  
}

variable "lb_port" {
  
}

variable "lb_protocol" {
  
}

variable "load_balancer_type" {
  
}