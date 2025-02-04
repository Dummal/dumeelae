output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl