kubectl label namespace default cert-manager.io/disable-validation=true
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager \
  --namespace default \
  --version $CERT_MANAGER_TAG \
  --set installCRDs=true \
  --set nodeSelector."kubernetes\.io/os"=linux \
  --set image.repository=$ACR_URL/$CERT_MANAGER_IMAGE_CONTROLLER \
  --set image.tag=$CERT_MANAGER_TAG \
  --set webhook.image.repository=$ACR_URL/$CERT_MANAGER_IMAGE_WEBHOOK \
  --set webhook.image.tag=$CERT_MANAGER_TAG \
  --set cainjector.image.repository=$ACR_URL/$CERT_MANAGER_IMAGE_CAINJECTOR \
  --set cainjector.image.tag=$CERT_MANAGER_TAG
