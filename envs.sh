#!/usr/bin/env bash

# Think of a way to secure the input
# CONFIG_SYNTAX="(^\s*#|^\s*$|^\s*[a-z_][^[:space:]]*=[^;&\(`]*$)"

if [ -z "$certName" ]; then
  echo "Please provide the user name, should match the key and crt file name"
  read certName
fi

pwd=$(pwd)

USERNAME=$certName

CACRT_FILE="/etc/kubernetes/pki/ca.crt"
CLIENTCRT_FILE="$pwd/$certName.crt"
CLIENTKEY_FILE="$pwd/$certName.key"

CACRT_DATA=$(cat /etc/kubernetes/pki/ca.crt | base64 | tr -d '\n') 
CLIENTCRT_DATA=$(cat $CLIENTCRT_FILE | base64 | tr -d '\n')
CLIENTKEY_DATA=$(cat $CLIENTKEY_FILE | base64 | tr -d '\n')

SERVERADDRESS="https://104.248.83.162:6443"
CLUSTERNAME="newwonderful-cluster"
NAMESPACE="default"
DEFAULTCONTEXT="default-context"

MOO="MOO"

