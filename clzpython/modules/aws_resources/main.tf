resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
  acl    = "private"
}

resource "aws_dynamodb_table" "example" {
  name           = "example-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

output "resource_ids" {
  value = {
    s3_bucket = aws_s3_bucket.example.id
    dynamodb_table = aws_dynamodb_table.example.id
  }
}
```

---

#### `# FILE: modules/aws_resources/variables.tf`
```hcl