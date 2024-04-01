# GCP Terraform

#### A simple GCP lab to setup GitHub Actions and GCP Artifact Registry

![alt text](images/gcpterraform.png "Terraform all the things in GCP!")

## Reqirements

Terraform installed

### To capture the key afterwards run the following command:

```bash
terraform output -raw service_account_key_json | base64 -d > service-account-secret.json
```
