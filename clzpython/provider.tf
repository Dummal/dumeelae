provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "management"
  region = "us-east-1"
}
```

---

### File 2: `main.tf`
```hcl