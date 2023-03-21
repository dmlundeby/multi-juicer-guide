# MultiJuicer setup

Sources:

* https://github.com/iteratec/multi-juicer/blob/main/guides/azure/azure.md
* https://github.com/iteratec/multi-juicer/blob/main/guides/azure/ssl.md

Steps:

(1) Load the variables

```bash
set -a
source ./variables.sh
set +a
```

(2) Run each script in correct order

```bash
bash -x ./step_01_aks.sh
...
```

The `-x` option prints out the command being run.

**Links**:

**Tips**:

* Get admin password: `kubectl get secrets juice-balancer-secret -o=jsonpath='{.data.adminPassword}' | base64 --decode`
* Access MultiJuicer score board: "$FQDN/balancer/score-board"
* Access admin page: "$FQDN/balancer/admin"
* Manage current logged-in instance: "$FQDN/balancer"
* Scale nodes: `az aks scale -g $RG -n $AKS_NAME --node-count 3`

**Misc**

* By trial and error, 2 nodes allow for 7 instances. Increasing to 3 nodes allows for 16 instances (!).
* For monitoring setup, the following link can be used: https://github.com/iteratec/multi-juicer/blob/main/guides/monitoring-setup/monitoring.md
Docs: https://pwning.owasp-juice.shop/
