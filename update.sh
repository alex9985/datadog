cd /etc/datadog-agent/conf.d/snmp.d
    for i in $(find -name "*.yaml"); 
        do sudo rm $i; 
        echo 'deleted ' + $i
    done
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/pfsense.yaml -o pfsense.yaml
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/freenas.yaml -o freenas.yaml
sudo service datadog-agent restart
