#!/bin/bash
sudo mkdir /tmp/templates
sudo mkdir /tmp/datadog
cd /tmp/templates
    for i in $(find -name "*.yaml"); 
        do sudo rm $i; 
        echo 'deleted ' + $i
    done;
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/pfsense.yaml -o /tmp/templates/pfsense.yaml;
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/freenas.yaml -o /tmp/templates/freenas.yaml;
#
echo "removing old conteiners"
sudo docker rm -f $(sudo docker ps -qa)
echo "finished cleaning docker"
cd /tmp/datadog
#sudo chmod +x create-container.sh
#
#echo "enter DD API key"
#read apikey
#
function create_container {
        for file in /tmp/templates/*; do
                echo "starting new container "
                image=$(sudo docker run -d  -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY= datadog/agent:6.12.1)
                echo "copying yaml templates"
                sudo  docker cp /tmp/templates/pfsense.yaml $image:/etc/datadog-agent/conf.d/snmp.d
                sudo  docker cp /tmp/templates/freenas.yaml $image:/etc/datadog-agent/conf.d/snmp.d
                echo "restarting container $image"
                sudo docker restart $image
        done
                          }
create_container
