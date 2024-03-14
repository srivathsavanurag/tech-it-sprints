provider "aws" {
   region     = "us-east-1"
   access_key = 
   secret_key = 
}

resource "aws_instance" "example" {
     instance_type = "t2.micro"
     ami           = "ami-0fe630eb857a6ec83"
     key_name = "docker-demo"
}
