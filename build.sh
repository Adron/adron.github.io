#!/usr/bin/env bash

terraform init

terraform plan

#echo "yes" | terraform apply

CLIENT_CERTIFICATE=$(terraform output client_certificate)
CLIENT_KEY=$(terraform output client_key)
CLUSTER_CA_CERTIFICATE=$(terraform output cluster_ca_certificate)

cd phase_1

terraform init

echo "Client Certificate: $CLIENT_CERTIFICATE"
echo "Client Key: $CLIENT_KEY"
echo "Cluster CA Cert: $CLUSTER_CA_CERTIFICATE"

# echo "yes" | terraform apply \
#     -var client_certificate="$CLIENT_CERTIFICATE" \
#     -var client_key="$CLIENT_KEY" \
#     -var cluster_ca_certificate="$CLUSTER_CA_CERTIFICATE"
