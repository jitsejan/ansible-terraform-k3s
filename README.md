# kubernetes-data-platform

## Description

This repository contains the code to provision Kubernetes on a local Macbook (using Multipass) as well as two Ubuntu VPSs through Ansible with the lightweight K3s Kubernetes tool.

## Tools to deploy

- Consul
- Vault
- Minio
- Jupyter
- Dagster

## Getting started

### Ansible

#### Installing Ansible

## Notes

### Installing on VPS

- Need to add public key for root to allow passwordless login
    ```
    ❯ ssh-keygen -t rsa -b 4096
    ❯ ssh-copy-id root@node01.jitsejan.com
    ```
    
## Sources

- [k3s-ansible](https://github.com/k3s-io/k3s-ansible)
- [pre-commit for Ansible](https://ansible-lint.readthedocs.io/en/latest/configuring.html)
- [persistent volume storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)
- https://testdriven.io/blog/running-vault-and-consul-on-kubernetes/
- https://multipass.run/docs/launch-command
- https://docs.ansible.com/ansible/latest/collections/community/kubernetes/helm_module.html
- https://learn.hashicorp.com/tutorials/consul/kubernetes-minikube?in=consul/kubernetes-deploy
- https://docs.ansible.com/ansible/latest/collections/community/hashi_vault/hashi_vault_lookup.html#ansible-collections-community-hashi-vault-hashi-vault-lookup
- https://docs.min.io/docs/deploy-minio-on-kubernetes.html
- https://docs.dagster.io/deployment/guides/kubernetes/deploying-with-helm


## Known issues

- Be aware that Mac does not support the K3s ingress when using the Docker version. I am using `multipass` to create virtual machines where I can install Kubernetes with `k3s`. Using KinD (Kubernetes In Docker) will stop ingress to work since networking is not allowed.

- After using a new Mac to connect to the VPS I had to make sure to enable `PasswordAuthentication` in `/etc/ssh/sshd_config` by setting it to `yes`. This would fix the issue `jitsejan@node01.jitsejan.com: Permission denied`.
