resource "aws_key_pair" "ssh_key" {
  key_name   = "hogwarts-ec2-key"
  public_key = file("${path.module}/hogwarts-ec2-key.pub")
}

resource "aws_instance" "hogwarts" {
  ami           = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ecs_agent_profile.name
  key_name      = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [var.ssh_security_group_id]

  user_data = file("${path.module}/init.sh")
}


# set up role so the ecs agent can register to ECS
resource "aws_iam_role" "ecs_agent_role" {
  name               = "ecs-agent-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_agent_policy" {
  role       = aws_iam_role.ecs_agent_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_agent_profile" {
  name = "ecs-agent-profile"
  role = aws_iam_role.ecs_agent_role.name
}