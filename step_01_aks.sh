# Installing Azure Kubernetes Services

az group create --location westeurope --name $RG
az aks create --resource-group $RG --name juicy-k8s --node-count 2
az aks get-credentials --resource-group $RG --name juicy-k8s --overwrite-existing
