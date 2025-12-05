provider "aws" {
    region = "us-east-1" 
}

# data "aws_vpc" "default" {
#   default = true
# }


resource "aws_security_group" "web_sg" {
    name = "static-web-sg"
    # vpc_id = data.aws_vpc.default.id
    ingress {
        description = "allow ssh"
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "allow http"
        to_port = 80
        from_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "allow ssh"
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}
resource "aws_instance" "web" {
    ami = var.my_ami
    instance_type = var.my_instance_type
    key_name = var.my_key
    vpc_security_group_ids  = [aws_security_group.web_sg.id]
    user_data = file("userdata.sh")
    tags = {
        Name = "static-website-ec2"
    }
  
}
