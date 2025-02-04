output "s3_buckets" {
description = "List of S3 buckets created"
value       = aws_s3_bucket.buckets[*].id
}

output "ec2_instances" {
description = "List of EC2 instances created"
value       = aws_instance.instances[*].id
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl