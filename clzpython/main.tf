module "iam" {
  source = "./modules/iam"
}

module "aws_resources" {
  source = "./modules/aws_resources"
}

module "control_tower" {
  source = "./modules/control_tower"
}

output "iam_outputs" {
  value = module.iam
}

output "aws_resources_outputs" {
  value = module.aws_resources
}

output "control_tower_outputs" {
  value = module.control_tower
}
```

---

#### `# FILE: variables.tf`
```hcl