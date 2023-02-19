# Installing Azure Kubernetes Services

az group create --location westeurope --name multi-juicer
az aks create --resource-group multi-juicer --name juicy-k8s --node-count 2
az aks get-credentials --resource-group multi-juicer --name juicy-k8s --overwrite-existing
