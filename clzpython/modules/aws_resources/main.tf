resource "aws_s3_bucket" "buckets" {
for_each = toset(var.resources.s3_buckets)

bucket = each.value
acl    = "private"
}

resource "aws_instance" "instances" {
for_each = var.resources.ec2_instances

ami           = each.value.ami
instance_type = each.value.instance_type
}

output "s3_bucket_names" {
value = aws_s3_bucket.buckets[*].bucket
}

output "ec2_instance_ids" {
value = aws_instance.instances[*].id
}
```

---

#### `# FILE: modules/aws_resources/variables.tf`
```hcl