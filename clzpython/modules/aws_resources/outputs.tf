output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.example.id
}
```

---

### Control Tower Module Files

#### `# FILE: modules/control_tower/main.tf`
```hcl