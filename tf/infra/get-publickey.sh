#!/bin/bash
# vault read -field=public_key ssh/config/ca
curl -o /tmp/trusted-ca-.pem -X GET -H "X-Vault-Token: $(vault print token)" \
 -H "X-Vault-Namespace: admin" \
  $VAULT_ADDR/v1/ssh/config/ca
