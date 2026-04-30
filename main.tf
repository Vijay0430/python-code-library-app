provider "aws" {
  region = "us-east-1"
}   



resource "aws_instance" "docker_host" {
  ami           = "ami-098e39bafa7e7303d" # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  key_name      = "test-01" # Replace with your key pair name

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose 
              sudo yum install java-1.8.0-openjdk-devel -y
              EOF 


  tags = {
    Name = "DockerHost"
  }
}
