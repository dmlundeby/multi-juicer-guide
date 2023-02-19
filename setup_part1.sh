# Installing Azure Kubernetes Services
# https://github.com/iteratec/multi-juicer/blob/main/guides/azure/azure.md
az group create --location westeurope --name multi-juicer
az aks create --resource-group multi-juicer --name juicy-k8s --node-count 2
az aks get-credentials --resource-group multi-juicer --name juicy-k8s --overwrite-existing

