variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
```

---

This configuration sets up an AWS Organization with two organizational units (Development and Production), creates accounts for each OU, and applies a Service Control Policy (SCP) to restrict actions. You can customize the email addresses, policy content, and other parameters as needed.