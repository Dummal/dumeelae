```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "engineering" {
  name      = "Engineering"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "marketing" {
  name      = "Marketing"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_iam_user" "engineering_user" {
  name = "engineering_user"
}

resource "aws_iam_user" "marketing_user" {
  name = "marketing_user"
}

resource "aws_iam_user_policy_attachment" "engineering_user_policy" {
  user       = aws_iam_user.engineering_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "marketing_user_policy" {
  user       = aws_iam_user.marketing_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
```