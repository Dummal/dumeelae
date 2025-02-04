resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "dev_ou" {
  name      = "Development"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "prod_ou" {
  name      = "Production"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_account" "dev_account" {
  name      = "DevAccount"
  email     = "dev-account@example.com"
  role_name = "OrganizationAccountAccessRole"

  depends_on = [aws_organizations_organization.org]
}

resource "aws_organizations_account" "prod_account" {
  name      = "ProdAccount"
  email     = "prod-account@example.com"
  role_name = "OrganizationAccountAccessRole"

  depends_on = [aws_organizations_organization.org]
}

resource "aws_organizations_policy" "service_control_policy" {
  name        = "DenyAllExceptAdmin"
  description = "Deny all actions except for administrators"
  content     = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "aws:PrincipalOrgID": "${aws_organizations_organization.org.id}"
        }
      }
    }
  ]
}
EOT
}

resource "aws_organizations_policy_attachment" "attach_scp_to_root" {
  policy_id = aws_organizations_policy.service_control_policy.id
  target_id = aws_organizations_organization.org.roots[0].id
}
```

---

### File 4: `modules/aws_organization/outputs.tf`
```hcl