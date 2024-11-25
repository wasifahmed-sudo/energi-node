provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.role_assume_policy.json
}

resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = "Policy that allows assuming the ${var.role_name} role"
  policy      = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_group" "group" {
  name = var.group_name
}

resource "aws_iam_user" "user" {
  name = var.user_name
}

resource "aws_iam_group_membership" "group_membership" {
  name = "${var.group_name}-membership"  # Add a unique name to the group membership
  group = aws_iam_group.group.name
  users = [aws_iam_user.user.name]
}


resource "aws_iam_policy_attachment" "group_policy_attachment" {
  name       = "${var.group_name}-policy-attachment"
  policy_arn = aws_iam_policy.policy.arn
  groups     = [aws_iam_group.group.name]
}

data "aws_iam_policy_document" "role_assume_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.role.arn]
  }
}

data "aws_caller_identity" "current" {}



========================================================
# This Terraform code is a combination of:
# - Mostly pre-existing code I had for creating IAM roles, policies, groups, and users in AWS.
# - The code was refined assistance from Claude AI:
#     - Generated the overall structure and template for creating IAM resources (roles, policies, groups, users).
#     - Created the IAM role with an assume role policy.
#     - Created a policy document allowing users to assume the role.
#     - Enhanced readability and structure of the policy creation process.
