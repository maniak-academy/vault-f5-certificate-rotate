# How to guide to HashiCorp Vault and F5 Certificate Rotation

The following repo is an example how to rotate your F5 certificates using HashiCorp vault

## Lab setup
* F5 BIGIP
* VAULT

```
vault server -dev -dev-root-token-id root
```

## Step 1: Generate root CA
* Enable the pki secrets engine at the pki path.

```
vault secrets enable pki
```

* Tune the pki secrets engine to issue certificates with a maximum time-to-live (TTL) of 87600 hours.

```
vault secrets tune -max-lease-ttl=87600h pki
```

* Generate the root certificate and save the certificate in CA_cert.crt.

```
vault write -field=certificate pki/root/generate/internal \
     common_name="example.com" \
     ttl=87600h > CA_cert.crt
```

* This generates a new self-signed CA certificate and private key. Vault will automatically revoke the generated root at the end of its lease period (TTL); the CA certificate will sign its own Certificate Revocation List (CRL).

* Configure the CA and CRL URLs.

```
vault write pki/config/urls \
    issuing_certificates="$VAULT_ADDR/v1/pki/ca" \
    crl_distribution_points="$VAULT_ADDR/v1/pki/crl"
```