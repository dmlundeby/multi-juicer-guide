az acr create -n $ACR_NAME -g $RG --sku basic
az aks update -n juicy-k8s -g $RG --attach-acr $ACR_NAME
