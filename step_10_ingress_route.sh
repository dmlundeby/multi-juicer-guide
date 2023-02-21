set -a
source ./step_06_ip_variables.sh
set +a

cat << EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-multi-juicer
  annotations: 
    cert-manager.io/cluster-issuer: letsencrypt
spec:
  ingressClassName: nginx
  tls:
  - hosts:
    - $FQDN
    secretName: tls-secret
  rules:
  - host: $FQDN
    http:
      paths:
      - path: /
        pathType: ImplementationSpecific
        backend:
          service:
            name: juice-balancer
            port:
              number: 3000
EOF
