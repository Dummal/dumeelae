resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "example-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.example.id
}
```

---

#### `# FILE: modules/aws_resources/variables.tf`
```hcl