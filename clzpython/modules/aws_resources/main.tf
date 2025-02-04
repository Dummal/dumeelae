resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${random_id.bucket_id.hex}"
  acl    = "private"

  tags = {
    Name        = "ExampleBucket"
    Environment = "Production"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}
```

---

### `modules/aws_resources/variables.tf`
```hcl