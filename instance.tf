resource "aws_instance" "ec2" {
    ami = "ami-0c2af51e265bd5e0e"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sub1.id
    vpc_security_group_ids = [aws_security_group.allow_ssh_http_https.id]
  tags = {
    Name = "public-ec2"
  }
}   
resource "aws_security_group" "allow_ssh_http_https" {
    name = "allow_ssh"
    description = "allow ssh,http,https"  
  
 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 }



