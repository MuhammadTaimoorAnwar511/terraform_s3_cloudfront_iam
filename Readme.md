cat ~/.aws/credentials 
aws configure
export AWS_PROFILE=<user name>
aws configure
===================================
aws configure --profile=<user name>
===================================
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy -auto-approve
==================================
terraform output -raw iam_password
terraform output -raw access_key_id
terraform output -raw secret_access_key
