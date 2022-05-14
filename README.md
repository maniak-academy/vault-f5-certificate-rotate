# How to guide to HashiCorp Vault and F5 Certificate Rotation

The following repo is an example how to rotate your F5 certificates using HashiCorp vault

Visit my artice for a how to guide https://maniakacademy.medium.com/using-hashicorp-vault-to-automate-certificate-lifecycle-management-f5-big-ip-1694cf91e928


to do 

vault read -format=json auth/approle/role/web-certs/role-id | jq -r '.data.role_id' > roleID
vault write -f -format=json auth/approle/role/web-certs/secret-id | jq -r '.data.secret_id' > secretID


vault agent -config=agent-config.hcl -log-level=debug
