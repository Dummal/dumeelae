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
```

---

#### `# FILE: modules/aws_resources/variables.tf`
```hcl