resource "aws_security_group" "default_lb" {
  name        = "terraform-ecs-nginx-lb"
  description = "Allow traffic"
  vpc_id      = "vpc-68426b12"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
