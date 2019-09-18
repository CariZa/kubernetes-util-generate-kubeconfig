#!/usr/bin/env bash

# Think of a way to secure the input
# CONFIG_SYNTAX="(^\s*#|^\s*$|^\s*[a-z_][^[:space:]]*=[^;&\(`]*$)"

if [ -z "$certName" ]; then
  echo "Please provide the user name, should match the key and crt file name"
  read certName
  echo "certName provided"
  echo $certName
fi

pwd=$(pwd)
echo $pwd
echo "pwd above"

CACRT_FILE="/etc/kubernetes/pki/ca.crt"
CLIENTCRT_FILE="$pwd/$certName.crt"
CLIENTKEY_FILE="$pwd/$certName.key"

CACRT_DATA="newdata_moomoomoomoo"
CLIENTCRT_DATA="newdata_bababababa"
CLIENTKEY_DATA="newdata_keykeykey"

SERVERADDRESS="newhttps://moo6447"
CLUSTERNAME="newwonderful-cluster"

MOO="MOO"

