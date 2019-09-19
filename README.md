# kubernetes-util-generate-kubeconfig

This is still a work in progress, and is very hard coded, with small dynamic fields. 

Many ways to improve the thinking and make it more dynamic, this is just a starting point if you want to create quick and dirty kubeconfig files to play around with a cluster. 

**Note** I've only tested this on digital ocean droplets, where I've set up my own clusters from scratch using kubeadm.

# Set up some roles & role bindings

To get access using kubeconfig, you still need to set up roles & rolebindings, I have some templates to use:

    $ git clone .... // if you haven't already
    $ kubectl apply -f templates/role_template.yaml
    $ kubectl apply -f templates/rolebinding_template.yaml

Take note: 

    You need a rolebinding to have the same name you provide to the certs as CN=....

    subjects:
    - kind: User
      name: user:moo # Name is case sensitive
      apiGroup: rbac.authorization.k8s.io

Take note of this value:

    name: **user:moo**

When asked for the CN, provide "user:moo"

If you change that value in the -subj field of the cert as CN, you need to also update the rolebinding.

# To run:

    $ git clone .... // if you haven't already
    $ cd kubernetes-util-generate-kubeconfig
    $ sh generate.sh
    $ cat generated/kubeconfig_data.yaml

You will be asked a few details:

    Insert the certs files name:
    > Put in any name you want, not important

    Insert the CN - Certificate Name/s:
    > This is important, must match your rolebinding
    > Use "user:moo" if you used my templated role and rolebinding

    Insert O - group/s:
    > Not important at this point, put in anything you want

### Overview

In order to use this, clone repo (if you need to fork and clone from your own repo).

Edit any variable values in the envs.sh file:

    $ vi envs.sh

Some important ones to note:

    CACRT_FILE -> Refers to the full path and location of the kubernetes ca file.
    SERVERADDRESS -> This address is also  important, must point to the right ip address to access the cluster.

There are 3 import sh scripts:

    > envs.sh - the variables

    > generate_certs.sh - this creates cert files using openssl

    > generate_kubeconfig.sh - this takes the provided templates, and replaces values using the envs.sh values

To run the scripts just run:

    $ sh generate.sh

You will see two files in the generated/ folder

    kubeconfig_data.yaml
    kubeconfig_file.yaml

For external use use the kubeconfig_data.yaml

The kubeconfig_file.yaml file can only really be used on the same node it was created, so not very useful, just used originally to confirm the certs were correct.

Use this file:

    $ cat generated/kubeconfig_data.yaml 

### Troubleshooting

If you get this error:

    Can't load /home/normal/.rnd into RNG
140096065524160:error:2406F079:random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/home/normal/.rnd

The solve, just run this:

    $ touch ~/.rnd

If you get this error:

    Can't open /etc/kubernetes/pki/ca.key for reading, Permission denied

The solve, run as sudo:

    $ sudo sh generate.sh

