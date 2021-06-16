# kubernetes-data-platform

## Description

This repository contains the code to provision Kubernetes on a local Macbook as well as a Ubuntu VPS through Ansible with the lightweight K3s Kubernetes tool.

## Getting started

### Ansible

#### Installing Ansible


## Sources

- [k3s-ansible](https://github.com/k3s-io/k3s-ansible)
- [pre-commit for Ansible](https://ansible-lint.readthedocs.io/en/latest/configuring.html)
- [persistent volume storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)
- https://testdriven.io/blog/running-vault-and-consul-on-kubernetes/
- https://multipass.run/docs/launch-command
- https://docs.ansible.com/ansible/latest/collections/community/kubernetes/helm_module.html
- https://learn.hashicorp.com/tutorials/consul/kubernetes-minikube?in=consul/kubernetes-deploy
- https://docs.ansible.com/ansible/latest/collections/community/hashi_vault/hashi_vault_lookup.html#ansible-collections-community-hashi-vault-hashi-vault-lookup


## Known issues

- Be aware that Mac does not support the K3s ingress when using the Docker version. I am using `multipass` to create virtual machines where I can install Kubernetes with `k3s`. Using KinD (Kubernetes In Docker) will stop ingress to work since networking is not allowed.