export ACR_URL="$ACR_NAME.azurecr.io"
export SOURCE_REGISTRY=k8s.gcr.io
export CONTROLLER_IMAGE=ingress-nginx/controller
export CONTROLLER_TAG=v1.0.4
export PATCH_IMAGE=ingress-nginx/kube-webhook-certgen
export PATCH_TAG=v1.1.1
export DEFAULTBACKEND_IMAGE=defaultbackend-amd64
export DEFAULTBACKEND_TAG=1.5
export CERT_MANAGER_REGISTRY=quay.io
export CERT_MANAGER_TAG=v1.5.4
export CERT_MANAGER_IMAGE_CONTROLLER=jetstack/cert-manager-controller
export CERT_MANAGER_IMAGE_WEBHOOK=jetstack/cert-manager-webhook
export CERT_MANAGER_IMAGE_CAINJECTOR=jetstack/cert-manager-cainjector
