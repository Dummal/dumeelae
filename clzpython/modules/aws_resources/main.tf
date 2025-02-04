resource "aws_s3_bucket" "buckets" {
for_each = toset(var.resources.s3_buckets)

bucket = each.value
}

resource "aws_instance" "instances" {
for_each = var.resources.ec2_instances

ami           = each.value.ami
instance_type = each.value.instance_type
}
```

---

#### `# FILE: modules/aws_resources/variables.tf`
```hcl