provider "aws" {
   region     = "us-east-1"
   access_key = "AKIA5UIDRHDXKBEGCKP3"
   secret_key = "RRvi4f2B8DQivnLA0ZBnQ8t8TdCJjHXqHReeVz/l"
}

resource "aws_instance" "example" {
     instance_type = "t2.micro"
     ami           = "ami-0fe630eb857a6ec83"
     key_name = "docker-demo"
}