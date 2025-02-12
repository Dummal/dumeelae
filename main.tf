```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "engineering" {
  name      = "Engineering"
  parent_id = aws_organizations_organization.org.id
}

resource "aws_organizations_organizational_unit" "marketing" {
  name      = "Marketing"
  parent_id = aws_organizations_organization.org.id
}

resource "aws_iam_user" "engineering_user" {
  name = "engineering_user"
}

resource "aws_iam_user" "marketing_user" {
  name = "marketing_user"
}

resource "aws_iam_group" "engineering_group" {
  name = "EngineeringGroup"
}

resource "aws_iam_group" "marketing_group" {
  name = "MarketingGroup"
}

resource "aws_iam_group_membership" "engineering_membership" {
  name = "engineering_membership"
  users = [
    aws_iam_user.engineering_user.name
  ]
  group = aws_iam_group.engineering_group.name
}

resource "aws_iam_group_membership" "marketing_membership" {
  name = "marketing_membership"
  users = [
    aws_iam_user.marketing_user.name
  ]
  group = aws_iam_group.marketing_group.name
}
```