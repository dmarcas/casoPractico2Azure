# PRACTICE 2 WITH AZURE

This repo contains two main folders:

- Terraform
- Ansible

## Terraform

This folder contains all the files needed to deploy an infrastructure in Azure of 4 virtual machines.

### How to deploy the infrastructure with terraform in Azure

1.- First of all, you have to create a credentials.tf file with the service principal according to your azure subscription into the terraform folder. The contents of the file should be as follows:

```
service principal
 provider "azurerm" {
  features {}
  subscription_id = "<SUBSCRIPCION ID>"
  client_id       = "<APP_ID>"
  client_secret   = "<PASSWORD>"
  tenant_id       = "<TENANT>"
}
```

2.- From the azure cli, accept the terms and condition of the image to use (in this case centOs):

```
az vm image accept-terms --urn cognosys:centos-8-stream-free:centos-8-stream-free:1.2019.0810
```

3.- Ensure that you have terraform installed and then, from the command line (or bash), execute the following seqüence of commands:

```
terraform init
terraform plan
terraform apply
```

## Ansible

Contains all the playbooks and files needed to deploy kubernetes cluster and an application.

### Description

The playbooks defined in these folders are going to deploy a kubernetes cluster and an application.

Based on the previous infrastructure defined in terraform, we should have created 4 virtual machines (1 master and 3 workers). One of the VM is going to be used as a master (the one named first), another one is going to be used as a nfs server (the named second), and the other two remaing are going to be the workers (three and fourth).

### Prerequisites

- Install python in all the machines:

```
dnf install python3 -y
```

- Install in master ansible and git

```
dnf install git ansible -y
```

- You should create a user named ansible in all the machines, create an SSH password in master node and copy the public key in the other nodes in order to do possible the comunication with the user ansible and execute tasks with the user in the machines.

- Add the user ansible in the sudoers.

### How to run the playbooks

Located from the master node (vm named my-first-azure-vm), execute the following:

1.- Run the following command to setup the Kubernetes Master node.

```
ansible-playbook setup_master.yml
```

2.- Run the following command to setup the Kubernetes workers.

```
ansible-playbook setup_worker.yml
```

3.- Run the following command to setup the nfs server.

```
ansible-playbook setup_nfs.yml
```

4.- Run the following command to deploy an application.

```
ansible-playbook deploy_application.yml
```
