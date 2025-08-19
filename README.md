# Confluence Playbook

This repository contains Ansible playbooks and Docker Compose configurations for deploying Confluence with MySQL.

## Files

- `confluence-compose.yml` - Docker Compose configuration for Confluence and MySQL
- `confluence-playbook.yml` - Ansible playbook to install Docker and deploy the stack
- `variables.env.j2` - Template for database environment variables
- `secret_vault_token.yml` - Vault token file (contains encrypted token)

## Prerequisites

- Ansible installed on the target machine
- HashiCorp Vault access with secrets stored at path `secret/confluence`
- Required Vault secrets:
  - `MYSQL_DATABASE`
  - `MYSQL_ROOT_PASSWORD`
  - `MYSQL_USER`
  - `MYSQL_PASSWORD`

## Usage

1. Ensure your Vault token is properly configured in `secret_vault_token.yml`
2. Run the playbook:
   ```bash
   ansible-playbook confluence-playbook.yml
   ```

## Configuration

- Confluence runs on port 8090
- MySQL runs on internal port 3306 (not exposed externally)
- Data is persisted in Docker volumes
- Timezone is set to Asia/Shanghai

## Vault Setup

Make sure your Vault contains the following structure:
```
secret/confluence/
├── MYSQL_DATABASE
├── MYSQL_ROOT_PASSWORD
├── MYSQL_USER
└── MYSQL_PASSWORD
```

## Notes

- The playbook automatically removes the sensitive `variables.env` file after deployment
- Docker and Docker Compose are automatically installed if not present
- The stack is configured to restart automatically
