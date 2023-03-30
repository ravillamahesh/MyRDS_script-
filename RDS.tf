provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "my-rds-instance" {
  engine = "mysql"
  instance_class = "t2.micro"
  storage = "10"
  username = "admin"
  password = "admin@123"
  database_name = "my-database"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "My RDS Instance"
    "Environment" = "Production"
  }
}

resource "aws_db_instance_cluster" "my-rds-cluster" {
  instance_list = [
    {
      instance_id = aws_db_instance.my-rds-instance.instance_id
    },
    {
      instance_id = aws_db_instance.my-rds-instance.instance_id
    }
  ]
}

