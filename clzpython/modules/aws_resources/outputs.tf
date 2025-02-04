output "s3_bucket_names" {
description = "List of S3 bucket names created"
value       = aws_s3_bucket.buckets[*].bucket
}

output "ec2_instance_ids" {
description = "List of EC2 instance IDs created"
value       = aws_instance.instances[*].id
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl