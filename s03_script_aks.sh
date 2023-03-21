az group create --location westeurope --name $RG
az aks create --resource-group $RG --name $AKS_NAME --node-count 2
az aks get-credentials --resource-group $RG --name $AKS_NAME --overwrite-existing
