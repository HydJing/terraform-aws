### Overview

This project utilizes Terraform to provision and manage AWS infrastructure. The code is structured for modularity and reusability, enabling consistent deployments across various environments. It follows industry-standard best practices for infrastructure-as-code, including separation of concerns and version control.

---

### Prerequisites

To use this project, ensure you have the following installed:

* **Terraform CLI**: Version 1.0.0 or later.
* **AWS CLI**: Configured with the necessary credentials and permissions to provision resources in your target AWS account.
* **Git**: For cloning the repository and managing version control.

---

### Project Structure
```
.
├── modules/
│   ├── vpc/
│   └── ec2/
├── environments/
│   ├── dev/
│   └── prod/
├── versions.tf
└── README.md
       
```



---

### Getting Started

#### 1. Clone the Repository

```bash
git clone <repository_url>
cd <repository_name>
```

#### 2. Configure AWS Credentials
Ensure your AWS CLI is configured with the appropriate credentials and profile. This project is configured to use a specific profile as defined in versions.tf.

You can set the AWS_PROFILE environment variable for convenience:
```
# On Linux/macOS
export AWS_SHARED_CREDENTIALS_FILE=~/.aws/creds
export AWS_PROFILE=vscode

# On Windows(powershell)
$env:AWS_SHARED_CREDENTIALS_FILE="C:\Users\USER_NAME_TO_REPLACE\.aws\credentials"
$env:AWS_PROFILE="vscode"
```

#### 3. Initialize Terraform
Navigate to the desired environment directory and initialize the project. This command downloads the necessary provider plugins.

```
cd environments/dev
terraform init
```

#### 4. Plan the Deployment
Review the execution plan to see what resources Terraform will create, update, or destroy.

```
terraform plan
```

#### 5. Apply the Changes
Apply the changes to provision the infrastructure. Confirm the action by typing yes when prompted.

```
terraform apply
```

#### 6. Destroy the Infrastructure
To remove all resources provisioned by this configuration, use the destroy command. Use this with extreme caution, especially in a production environment.

```
terraform destroy
```

---

### Terraform Commands

#### 0.Terraform format
```
terraform fmt
```

---

### AWS CLI

#### 0. AWS
```
aws
```

---

## TODO