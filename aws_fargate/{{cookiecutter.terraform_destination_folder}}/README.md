## Requirerments

### Terraform Backend

Before initializing the backend with `terraform init`, it's necessary to create a couple of resources manually in AWS as follows:

1. **Create an S3 bucket to store the terraform state**: In order to work, terraform requires to store the state in a bucket,  by default with the name `{{ cookiecutter.terraform_backend_bucket}}`. It is highly recommended that you enable Bucket Versioning on the S3 bucket to allow for state recovery in the case of accidental deletions and human error.

2. **Create a DynamoDB table to store state locking**: To keep state locking and consistency checking, this can be done via Dynamo DB, creating a table with the name `{{cookiecutter.dynamo_db_table_for_locking}}`. When creating you need to specify the Partition key with the name `LockID`