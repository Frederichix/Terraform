terraform {                         //Terraform Init
  required_providers {              //Providers
    aws = {                         
      source  = "hashicorp/aws"     //Modules 
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"     //Module Version
}

provider "aws" {                    //Choosed Provider
  region  = "us-west-2"             //Region 
}

resource "aws_instance" "app_server" {         //Resources Names. 1°: AWS 2°: Name Instance
  ami           = "ami-03f65b8614a860c29"      //Image Code || Ubuntu 22.04
  instance_type = "t2.micro"                   //Instance Type
  key_name = "iac-test"                        //Key Pair
    # user_data = <<-EOF
    #               #!/bin/bash
    #               cd /home/ubuntu
    #               echo "<h1>Feito com sucesso</h1>" > index.html
    #               nohup busybox httpd -f -p 8080 &
    #               EOF
  tags = {                                     //Markups
    Name = "Python3 with Virtualenv"
  }
}

