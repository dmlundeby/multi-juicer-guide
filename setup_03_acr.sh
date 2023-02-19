az acr create -n $ACR_NAME -g multi-juicer --sku basic
az aks update -n juicy-k8s -g multi-juicer --attach-acr $ACR_NAME
