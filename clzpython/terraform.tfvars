aws_region         = "us-east-1"
account_ids        = ["123456789012", "987654321098"]
organization_unit  = "Engineering"
iam_roles          = ["Admin", "Developer", "ReadOnly"]
resources = {
s3_buckets = ["bucket1", "bucket2"]
ec2_instances = {
instance1 = {
ami           = "ami-12345678"
instance_type = "t2.micro"
}
}
}
```

---

### IAM Module Files

#### `# FILE: modules/iam/main.tf`
```hcl