provider "aws"{
  region  = "us-east-1"
 }
resource "aws_instance" "master" {
  ami                    = "ami-080e1f13689e07408"
  instance_type          = "t2.micro"
  key_name               = "capston_key"
  tags = {
    Name = "Master"
  }
}
resource "aws_instance" "Slave-1" {
  ami                    = "ami-080e1f13689e07408"
  instance_type          = "t2.micro"
  key_name               = "capston_key"
   tags = {
    Name = "Slave-1"
  }
}
resource "aws_instance" "Slave-2" {
  ami                    = "ami-080e1f13689e07408"
  instance_type          = "t2.micro"
  key_name               = "capston_key"
  tags = {
    Name = "Slave-2"
  }
}  
resource "aws_ec2_instance_state" "Slave-2" {
instance_id = aws_instance.Slave-2.id
state       = "running"
}
resource "aws_ec2_instance_state" "Slave-1" {
instance_id = aws_instance.Slave-1.id
state       = "running"
}
resource "aws_ec2_instance_state" "master" {
instance_id = aws_instance.master.id
state       = "running"
}