# MultiJuicer setup guide for Azure

## Introduction

This is a guide for deploying [MultiJuicer](https://github.com/iteratec/multi-juicer) on an Azure Kubernetes cluster, using bash scripts. It is based on two guides ([1](https://github.com/iteratec/multi-juicer/blob/main/guides/azure/azure.md), [2](https://github.com/iteratec/multi-juicer/blob/main/guides/azure/ssl.md)), and is designed to be easy to reproduce.

## Prerequisites

The guide assumes running a Linux terminal. If using Windows (which I currently do), I recommend using WSL.

The following tools need to be installed:

* Azure CLI: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
* kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-on-linux
* helm: https://helm.sh/docs/intro/install/#from-apt-debianubuntu

## Guide

Procedure: Go through all steps `s<n>_<script|variables>_<description>.sh` in sequence.

Steps of type `variables` contains variables which should be loaded by the following command:

```bash
source ./s<n>_variables_<description>.sh
```

Steps of type `script` are scripts which should be run by the following command:

```bash
bash -x ./s<n>_script_<description>.sh
```

The `-x` option is optional and prints out the command being run.

## Links

This guide is mainly based on:

* https://github.com/iteratec/multi-juicer/blob/main/guides/azure/azure.md
* https://github.com/iteratec/multi-juicer/blob/main/guides/azure/ssl.md

Other useful links:

* For production setup, please check the following list: https://github.com/iteratec/multi-juicer/blob/main/guides/production-notes/production-notes.md
* For monitoring setup, the following link can be used: https://github.com/iteratec/multi-juicer/blob/main/guides/monitoring-setup/monitoring.md
* MultiJuicer docs: https://pwning.owasp-juice.shop/

## Tips

* Get admin password: `kubectl get secrets juice-balancer-secret -o=jsonpath='{.data.adminPassword}' | base64 --decode`
* Manage current logged-in instance: "$FQDN/balancer"
* Access MultiJuicer score board: "$FQDN/balancer/score-board"
* Access admin page: "$FQDN/balancer/admin"
* Scale nodes: `az aks scale -g $RG -n $AKS_NAME --node-count 3` (scales to 3 nodes)
    * By trial and error, 2 nodes allow for 7 instances. Increasing to 3 nodes allows for 16 instances (!).
