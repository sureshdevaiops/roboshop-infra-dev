resource "aws_lb" "backend" {
  name               = "${local.common_name}-backend" # roboshop-dev-backend
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = false # it should be true in real time, but here we need to remove after practice, so keeping false

  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name}-backend"
    }
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.backend.arn
  port              = "80"
  protocol          = "HTTP"

  #Default Rule
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h1>Hi, I am from Backend ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.backend.dns_name
    zone_id                = aws_lb.backend.zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}