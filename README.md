# terraform-for-jumpserver



## 1. google cloud
```
# revoke
gcloud auth revoke
gcloud auth application-default revoke

# login
gcloud auth login
gcloud auth application-default login

# project set
gcloud config set project PROJECT_ID
```

## 2. terraform
```
# apply
cd enviroment/dev

terraform init

terraform plan

terraform apply

# destory
terraform destroy
```
