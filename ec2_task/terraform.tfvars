tags={
    environment = "prod"
    region      = "us-east-1"
    namespace   = "peak"
}

instance = [
    {
        instance_name = "ops1_server"
        instance_type = "t2.micro"
        key_name      = "vikas6400"
    },
    {
        instance_name = "ops2_server"
        instance_type = "t2.micro"
        key_name      = "vikas6400"
    }
]
sg_name = "application_sg"

sg_ingress_rule = [80,22]

lb_name = "application"
lb_port = 80
lb_protocol = "TCP"
load_balancer_type = "network"



