resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${random_string.suffix.result}"
  acl    = "private"

  tags = {
    Name        = "Example Bucket"
    Environment = "Production"
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
```

---

#### `# FILE: modules/aws_resources/variables.tf`
```hcl