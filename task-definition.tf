/*
data "aws_ecs_task_definition" "default" {
  task_definition = "${aws_ecs_task_definition.default.family}"
}
*/

resource "aws_ecs_task_definition" "default" {
    family                = "nginx"
    container_definitions = <<DEFINITION
[
  {
    "name": "nginx",
    "image": "ganez/helloapp-nginx:v1",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 512,
    "cpu": 1024
  }
]
DEFINITION
}
