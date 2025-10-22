resource "aws_security_group" "ssh_sg" {
  name        = "ssh-sg"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "hogwarts-ec2-key"
  public_key = file("hogwarts-ec2-key.pub")
}

resource "aws_instance" "docker_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh_key.key_name
  security_groups = [aws_security_group.ssh_sg.name]

  # Install Docker and Docker Compose on EC2
  user_data = <<-EOF
#!/bin/bash
set -euo pipefail

yum update -y

# Install Docker and Docker Compose
amazon-linux-extras install docker -y
echo "Installed Docker successfully" >> /var/log/user_data.log

systemctl docker start
systemctl docker enable

echo "### DOCKER STATUS ###" >> /var/log/user_data.log
systemctl status docker >> /var/log/user_data.log
echo "### DOCKER STATUS ###" >> /var/log/user_data.log

usermod -a -G docker ec2-user

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo "Installed Docker Compose successfully" >> /var/log/user_data.log


# Install ECS Agent
yum install -y ecs-init
echo "Installed ECS Agent successfully." >> /var/log/user_data.log

echo "ECS_CLUSTER=ecs-cluster" >> /etc/ecs/ecs.config
systemctl enable ecs
systemctl start ecs

echo "### ECS AGENT STATUS ###" >> /var/log/user_data.log
systemctl status ecs > /var/log/user_data.log
echo "### ECS AGENT STATUS ###" >> /var/log/user_data.log
              EOF

  tags = {
    Name = "DockerEC2"
  }
}

