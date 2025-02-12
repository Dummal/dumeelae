output "instance_id" {
  description = "The ID of the created instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP of the created instance"
  value       = aws_instance.example.public_ip
}
```

---

### `provider.tf`
```hcl