variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
```

---

This configuration sets up an AWS Organization with two accounts (Development and Production) and a cross-account IAM role. You can expand this setup by adding more accounts, policies, or other resources as needed.