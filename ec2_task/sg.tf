resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.terraform_remote_state.peak.outputs.vpc_id
  tags = merge(var.tags, {
    Name : "${var.sg_name}"
  })
  dynamic "ingress" {
    for_each = toset(var.sg_ingress_rule)
    iterator = ingress
    content {
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "TCP"
        to_port = ingress.key
        from_port         = ingress.key
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}