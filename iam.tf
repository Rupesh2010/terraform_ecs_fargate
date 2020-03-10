resource "aws_iam_role" "default" {
    name                = "terraform-ecs-nginx"
    assume_role_policy  = "${data.aws_iam_policy_document.default.json}"
}

data "aws_iam_policy_document" "default" {
    statement {
        actions = ["sts:AssumeRole"]

        principals {
            type        = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
    }
}

resource "aws_iam_role_policy_attachment" "default" {
    role       = "${aws_iam_role.default.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "default" {
    name = "terraform-ecs-nginx"
    roles = ["${aws_iam_role.default.id}"]
}
