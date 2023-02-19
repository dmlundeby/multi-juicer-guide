EXTERNAL_IP="$(kubectl get services --namespace default nginx-ingress-ingress-nginx-controller --output jsonpath='{.status.loadBalancer.ingress[0].ip}')"
PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$EXTERNAL_IP')].[id]" --output tsv)
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME
