resource "aws_instance" "web" {
  ami           = "ami-07d9b9ddc6cd8dd30"
  instance_type = "t2.micro"
  key_name = "docker-demo"
  vpc_security_group_ids = [ aws_security_group.jenkins-sg.id ]
  user_data = templatefile("./install.sh", {})

  tags = {
    Name = "jenkins"
  }
}
resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"

ingress = [ 
    for port in [22, 80, 443, 8080] : {
    description = "inbound rules"
    from_port        = port
    to_port          = port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false 
  }
]
egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
}
tags = {
    Name = "jenkins-sg"
}
}
