data "aws_availability_zones" "available" {}

resource "aws_instance" "my_instances" {
  count = 2

  ami           = "ami-0224820b4e90b6949" 
  instance_type = "t2.micro" 
  availability_zone = element(["us-east-1a","us-east-1b"], count.index)
  key_name      = "shweta-terraform-key" 
  subnet_id = element(["subnet-09c70bcefed00afad","subnet-08a89211d52d8b7f7"], count.index)

  tags = {
    Name = "rohitt-terraf-${count.index}"
  }

  security_groups = ["sg-065d6e671aceef7be"] 
  
}
