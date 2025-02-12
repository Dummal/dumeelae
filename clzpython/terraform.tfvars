management_account_profile = "management-profile"
management_bucket_name     = "management-account-bucket"

dev_account_profile = "dev-profile"
dev_bucket_name     = "dev-account-bucket"

prod_account_profile = "prod-profile"
prod_bucket_name     = "prod-account-bucket"
```

---

### Explanation:
1. **Providers**: Multiple AWS providers are configured using aliases to target different accounts (management, dev, and prod).
2. **Resources**: Example S3 buckets are created in each account to demonstrate resource provisioning.
3. **Variables**: Variables are used to parameterize account-specific details like regions, profiles, and bucket names.
4. **Outputs**: Outputs are defined to display the ARNs of the created S3 buckets for verification.
5. **terraform.tfvars**: This file contains the values for the variables, making it easy to manage configurations.

This setup can be extended to include more accounts or resources as needed.