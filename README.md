# MultiJuicer setup

Procedure: Go through all steps `s<n>_<script|variables>_<description>.sh` in sequence.

Steps of type `variables` contains variables which should be loaded by the following command:

```bash
source ./variables.sh
```

Steps of type `script` are scripts which should be run by the following command:

```bash
bash -x ./step_01_aks.sh
```

The `-x` option is optional and prints out the command being run.

**Links**:

This guide is mainly based on:

* https://github.com/iteratec/multi-juicer/blob/main/guides/azure/azure.md
* https://github.com/iteratec/multi-juicer/blob/main/guides/azure/ssl.md

Other useful links:

* For monitoring setup, the following link can be used: https://github.com/iteratec/multi-juicer/blob/main/guides/monitoring-setup/monitoring.md
* MultiJuicer docs: https://pwning.owasp-juice.shop/

**Tips**:

* Get admin password: `kubectl get secrets juice-balancer-secret -o=jsonpath='{.data.adminPassword}' | base64 --decode`
* Manage current logged-in instance: "$FQDN/balancer"
* Access MultiJuicer score board: "$FQDN/balancer/score-board"
* Access admin page: "$FQDN/balancer/admin"
* Scale nodes: `az aks scale -g $RG -n $AKS_NAME --node-count 3` (scales to 3 nodes)
    * By trial and error, 2 nodes allow for 7 instances. Increasing to 3 nodes allows for 16 instances (!).
