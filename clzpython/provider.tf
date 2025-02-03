### **`provider.tf`**
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}
```

---

4. **`provider.tf`**:
   - Specifies the AWS provider and required Terraform version.