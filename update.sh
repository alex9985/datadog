#!/bin/bash
$path=/etc/datadog-agent/conf.d/snmp.d
echo 'cleaning up work directory /etc/datadog-agent/conf.d/snmp.d'
cd /etc/datadog-agent/conf.d/snmp.d
    for i in $(find -name "*.yaml"); 
        do sudo rm $i; 
        echo 'deleted ' + $i
    done
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/freenas.yaml -o pfsense.yaml
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/freenas.yaml -o freenas.yaml
