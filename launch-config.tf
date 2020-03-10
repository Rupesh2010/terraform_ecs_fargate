resource "aws_launch_configuration" "default" {
    name                        = "terraform-ecs-nginx"
    image_id                    = "ami-098616968d61e549e"
    instance_type               = "t2.micro"
    iam_instance_profile        = "${aws_iam_instance_profile.default.id}"

    root_block_device {
      volume_type = "standard"
      volume_size = 30
      delete_on_termination = true
    }

    lifecycle {
      create_before_destroy = true
    }

    security_groups             = ["${aws_security_group.default.id}"]
    associate_public_ip_address = "true"
    key_name                    = "terraform-ecs-nginx"
    user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=ecs-nginx >> /etc/ecs/ecs.config
                                  EOF
}
