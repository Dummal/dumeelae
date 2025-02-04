resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name        = "Example Bucket"
    Environment = "Production"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 8
}
```

---

#### `# FILE: modules/aws_resources/variables.tf`
```hcl