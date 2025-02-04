variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
```

---

This configuration sets up an AWS Organization with two organizational units (Development and Production) and two accounts (DevAccount and ProdAccount). It also attaches a Service Control Policy (SCP) to the root of the organization. You can expand this configuration further based on your specific requirements.