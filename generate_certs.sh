#

echo "Insert the certs files name: "
read certName

echo "Insert the CN - Certificate Name/s: "
read certificateNames

echo "Insert O - group/s: "
read groups

# Generate the key
openssl genrsa -out $certName.key 2048

# Generate the signing request
openssl req -new -key $certName.key -subj "/CN=$certificateNames/O=$groups" -out $certName.csr

# Generate the certificate
openssl x509 -req -in $certName.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial  -out $certName.crt


