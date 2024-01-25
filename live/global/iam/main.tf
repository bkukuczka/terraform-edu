terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-bkukuczka"
    key    = "global/iam/terraform.tfstate"
    region = "eu-central-1"

    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_user" "existing_user" {
  name = "bartlomiej.kukuczka"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "instance" {
  name_prefix        = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "ec2_admin_permissions" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "example" {
  role   = aws_iam_role.instance.id
  policy = data.aws_iam_policy_document.ec2_admin_permissions.json
}

resource "aws_iam_instance_profile" "instance" {
  role = aws_iam_role.instance.name
}

#resource "aws_instance" "example" {
#  ami           = "ami-0fb653ca2d3203ac1"
#  instance_type = "t2.micro"
#
#  # Attach the instance profile
#  iam_instance_profile = aws_iam_instance_profile.instance.name
#}