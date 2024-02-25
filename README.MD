# AWS KMS Encryption and Decryption using Terraform

* This Project is to demonstrate the use of AWS KMS to encrypt and decrypt the secret. The secret is encrypted using the AWS KMS and decrypted using the same. The secret is stored in the encrypted_secret.txt file. The infrastructure is created using Terraform. The infrastructure is destroyed using Terraform.

# Pre-requisites:

1. AWS CLI
2. AWS Account
3. Terraform 
4. jq
5. AWS Configured with Access Key and Secret Key

# Step To use this Project:
1. Clone the repository to your local machine.
2. Change the user arn in the variables.tf file. 
3. Run the following commands to create the infrastructure:
    ```bash
    terraform init
    terraform apply
    ```
4. Once the infrastructure is created, you will get the encrypted secret in the output.

5. To Encrypt and Decrypt the secret, use the following commands:
## To Encrypt:

    1. aws kms encrypt  --key-id "a783e385-1f85-4846-83a4-34f624c88b31" --plaintext "my_secret" --region us-east-1
    2. aws kms encrypt  --key-id "a783e385-1f85-4846-83a4-34f624c88b31" --plaintext "my_secret" --region us-east-1 | jq -r '.CiphertextBlob'
    3. ENCRYPTED_SECRET=$(aws kms encrypt  --key-id "a783e385-1f85-4846-83a4-34f624c88b31" --plaintext "my_secret" --region us-east-1 | jq -r '.CiphertextBlob')
    4. echo $ENCRYPTED_SECRET > encrypted_secret.txt

## To Decrypt:

    1. aws kms decrypt --key-id "a783e385-1f85-4846-83a4-34f624c88b31"  --ciphertext-blob ${ENCRYPTED_SECRET} --region us-east-1

    2. aws kms decrypt --key-id alias/my_encryption_key  --ciphertext-blob ${ENCRYPTED_SECRET} --region us-east-1

6. Once Project is done, run the following command to destroy the infrastructure:
```bash
terraform destroy
```

# Conclusion:
The AWS KMS is used to encrypt and decrypt the secret. The secret is encrypted using the AWS KMS and decrypted using the same. The secret is stored in the encrypted_secret.txt file. The infrastructure is created using Terraform. The infrastructure is destroyed using Terraform.
