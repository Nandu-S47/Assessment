# Assessment

## Overview
This is an assessment project created using Terraform with a focus on reusability (Modules) while maintaining reliability and security standards.

## Features
- API app hosted on Azure App Service
- SQL Azure Database
- Angular web app hosted on a Storage Account, served via CDN
- Azure Monitor for monitoring
- Key Vault for secrets management

## Architecture
Here is an architecture diagram of the project (include an actual diagram image or link to it):

![Architecture Diagram](path/to/architecture-diagram.png)

## Directory Structure
The directory structure of the project is organized as follows:

```plaintext
.
├── angular-app/          # Angular application source code
│   ├── dist/             # Built Angular application
│   └── ...               # Other Angular application files
├── modules/              # Reusable Terraform modules
│   ├── app_service/
│   ├── cdn/
│   ├── connectivity/
│   ├── key_vault/
│   ├── log_analytics_workspace/
│   ├── private_dns_zone_group/
│   ├── resource_group/
│   ├── sql_database/
│   ├── storage_account/
│   └── vm/
├── [main.tf]             # Main configuration file
├── variables.tf          # Variable definitions
├── outputs.tf            # Output definitions
└── [README.md]      