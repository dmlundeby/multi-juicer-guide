set -a
source ./step_06_ip_variables.sh
set +a
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME
