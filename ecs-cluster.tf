resource "aws_ecs_cluster" "ecs_cluster" {
  name = "resume-hosting-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "ecs_task_definition"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 2048
  container_definitions = jsonencode([
    {
      name      = "resume-hosting_container"
      image     = "rathoduday/resume-hosting-app"
      cpu       = 64
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

}

resource "aws_ecs_service" "ecs_service" {
  name             = "ecs_service"
  cluster          = aws_ecs_cluster.ecs_cluster.id
  task_definition  = aws_ecs_task_definition.ecs_task_definition.id
  desired_count    = 1
  launch_type      = "EC2"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}