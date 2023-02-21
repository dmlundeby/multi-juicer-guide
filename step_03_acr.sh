az acr create -n $ACR_NAME -g $RG --sku basic
az aks update -n $AKS_NAME -g $RG --attach-acr $ACR_NAME
