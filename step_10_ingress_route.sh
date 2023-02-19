set -a
source ./step_07_ip_variables.sh
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
    - my-multi-juicer.<availability zone>.cloudapp.azure.com
    secretName: tls-secret
  rules:
  - host: my-multi-juicer.<availability zone>.cloudapp.azure.com
    http:
      paths:
      - path: /
        pathType: ImplementationSpecific
        backend:
          service:
            name: juice-balancer
            port:
              number: 3000i
EOF
