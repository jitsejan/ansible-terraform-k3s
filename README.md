# kubernetes-data-platform

## Description

This repository contains the code to provision Kubernetes on a local Macbook as well as a Ubuntu VPS through Ansible with the lightweight K3s Kubernetes tool.

## Getting started

### Ansible

#### Installing Ansible


## Sources

- [k3s-ansible](https://github.com/k3s-io/k3s-ansible)
- [ansible-k3d](https://github.com/andrewrothstein/ansible-k3d)
- [pre-commit for Ansible](https://ansible-lint.readthedocs.io/en/latest/configuring.html)

## Known issues

- Be aware that Mac does not support the K3s ingress when using the Docker version. I am using `multipass` to create virtual machines where I can install Kubernetes with `k3s`. Using KinD (Kubernetes In Docker) will stop ingress to work since networking is not allowed.