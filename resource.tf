data "aws_availability_zones" "available" {}

resource "aws_instance" "my_instances" {
  count = 3

  ami           = "ami-0224820b4e90b6949"
  instance_type = "t2.micro"
  key_name      = "shweta-terraform-key"
  vpc_security_group_ids = ["sg-065d6e671aceef7be"]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  subnet_id = "subnet-08a89211d52d8b7f7"

    tags = {
    Name = "Rohit-Terraform-${count.index}"
  }
  
}