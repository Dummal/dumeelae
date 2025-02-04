module "iam" {
  source = "./modules/iam"
}

module "aws_resources" {
  source = "./modules/aws_resources"
}

module "control_tower" {
  source = "./modules/control_tower"
}

provider "aws" {
  region = var.aws_region
}
```

---

#### `variables.tf`
```hcl