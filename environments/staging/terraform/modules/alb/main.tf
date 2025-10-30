data "aws_acm_certificate" "oldmoon_io_vn" {
  domain      = "*.oldmoon.io.vn"
  statuses    = ["ISSUED"]
  most_recent = true
}

resource "aws_lb_target_group" "hello_world" {
  name        = "hello-world-tg"
  port        = 8000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.default_vpc_id

  deregistration_delay = var.deregistration_delay

  health_check {
    enabled             = true
    path                = "/"
    port = "traffic-port"
    protocol            = "HTTP"
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher             = "200-399"
  }
}

resource "aws_lb" "hogwarts" {
  name                       = "hogwarts-lb"
  load_balancer_type         = "application"
  internal                   = false
  subnets                    = var.default_subnet_ids
  security_groups            = [var.http_security_group_id, var.https_security_group_id]
  enable_deletion_protection = false
  idle_timeout               = 60

  enable_cross_zone_load_balancing = var.enable_cross_zone
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.hogwarts.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.hogwarts.id
  port              = 443
  protocol          = "HTTPS"

  certificate_arn = data.aws_acm_certificate.oldmoon_io_vn.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hello_world.id
  }
}