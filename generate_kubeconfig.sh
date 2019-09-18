#!/usr/bin/env bash


# kubeconfig_data_template.yaml 
# kubeconfig_files_template.yaml

. ./envs.sh

cp ./templates/kubeconfig_data_template.yaml ./kubeconfig_data.yaml
cp ./templates/kubeconfig_files_template.yaml ./kubeconfig_files.yaml

sed -i -e "s|#CACRT_DATA|$CACRT_DATA|g" kubeconfig_data.yaml
sed -i -e "s|#CLIENTCRT_DATA|$CLIENTCRT_DATA|g" kubeconfig_data.yaml
sed -i -e "s|#CLIENTKEY_DATA|$CLIENTKEY_DATA|g" kubeconfig_data.yaml
sed -i -e "s|#SERVERADDRESS|$SERVERADDRESS|g" kubeconfig_data.yaml
sed -i -e "s|#CLUSTERNAME|$CLUSTERNAME|g" kubeconfig_data.yaml
sed -i -e "s|#USERNAME|$USERNAME|g" kubeconfig_data.yaml


sed -i -e "s|#CACRT_FILE|$CACRT_FILE|g" kubeconfig_files.yaml
sed -i -e "s|#CLIENTCRT_FILE|$CLIENTCRT_FILE|g" kubeconfig_files.yaml
sed -i -e "s|#CLIENTKEY_FILE|$CLIENTKEY_FILE|g" kubeconfig_files.yaml
sed -i -e "s|#SERVERADDRESS|$SERVERADDRESS|g" kubeconfig_files.yaml
sed -i -e "s|#CLUSTERNAME|$CLUSTERNAME|g" kubeconfig_files.yaml
sed -i -e "s|#USERNAME|$USERNAME|g" kubeconfig_files.yaml


