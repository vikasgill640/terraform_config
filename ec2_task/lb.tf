resource "aws_lb" "sample_lb" {
    name               = "${var.lb_name}-lb"
    internal           = false
    load_balancer_type = var.load_balancer_type
    subnets            = data.terraform_remote_state.peak.outputs.public_subnet_id
    enable_cross_zone_load_balancing = "true"
    tags = merge(var.tags, {
        Name : "${var.lb_name}-lb"
    })
}

resource "aws_lb_target_group" "test" {
    name     = "${var.lb_name}-tg"
    port     = var.lb_port 
    protocol = var.lb_protocol
    vpc_id   = data.terraform_remote_state.peak.outputs.vpc_id
    health_check {
        healthy_threshold   = "3"
        interval            = "10"
        unhealthy_threshold = "2"
        timeout             = "5"
        path                = "/"
        port                = var.lb_port
    }
    tags = merge(var.tags, {
        Name : "${var.lb_name}-tg"
    })

}

resource "aws_lb_target_group_attachment" "tg_attachment_test1" {
    for_each         = aws_instance.ec2_user
    target_id        = each.value.id
    target_group_arn = aws_lb_target_group.test.arn 
    port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.sample_lb.arn
  port              = var.lb_port
  protocol          = var.lb_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}