locals {
  os_map = {
   "centos-7" = {
      "owner" = "679593333241",
      "name"  = "CentOS Linux 7 x86_64 HVM EBS *",
      "user"  = "centos"
    },
    "ubuntu-19.04" = {
      "owner" = "099720109477",
      "name"  = "ubuntu/images/hvm-ssd/ubuntu-eoan-19.10-amd64-server*",
      "user"  = "ubuntu"
    },
    "ubuntu-20.04" = {
      "owner" = "099720109477",
      "name"  = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*",
      "user"  = "ubuntu"
    },
    "rhel-7" = {
      "owner" = "309956199498",
      "name"  = "RHEL-7.?_HVM_GA-*x86_64*",
      "user"  = "ec2-user"
    },
    "rhel-8" = {
      "owner" = "309956199498",
      "name"  = "RHEL-8.?.?_HVM-*-x86_64*",
      "user"  = "ec2-user"
    },
    "amazon-1" = {
      "owner" = "137112412989",
      "name"  = "amzn-ami-hvm-*x86_64-gp2",
      "user"  = "ec2-user"
    },
    "amazon-2" = {
      "owner" = "137112412989",
      "name"  = "amzn2-ami-hvm-*x86_64-gp2",
      "user"  = "ec2-user"
    },
    "suse-12" = {
      "owner" = "013907871322",
      "name"  = "suse-sles-12-sp?-v????????-hvm-ssd-x86_64",
      "user"  = "ec2-user"
    },
    "suse-15" = {
      "owner" = "013907871322",
      "name"  = "suse-sles-15-sp?-v????????-hvm-ssd-x86_64",
      "user"  = "ec2-user"
    }
    "windows-2012" = {
      "owner" = "801119661308",
      "name"  = "Windows_Server-2012-R2_RTM-English-64Bit-Base*",
      "user"  = "Administrator"
    },
    "windows-2016" = {
      "owner" = "801119661308",
      "name"  = "Windows_Server-2016-English-Full-Base*",
      "user"  = "Administrator"
    },
    "windows-2019" = {
      "owner" = "801119661308",
      "name"  = "Windows_Server-2019-English-Full-Base*",
      "user"  = "Administrator"
    }
  }
}

data "aws_ami" "latest" {
  owners      = [local.os_map[var.os_name]["owner"]]
  most_recent = true

  filter {
    name   = "name"
    values = [local.os_map[var.os_name]["name"]]
  }
  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}
