output "status" {
  description = "Control Tower setup status"
  value       = "Control Tower setup complete"
}
```

---

This configuration sets up a multi-account AWS environment with a management account, a member account, and modules for IAM, AWS resources, and Control Tower. Each module is self-contained and reusable.