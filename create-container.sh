#!/bin/bash
sudo mkdir /tmp/templates
sudo mkdir /tmp/datadog
cd /tmp/templates
    for i in $(find -name "*.yaml"); 
        do sudo rm $i; 
        echo 'deleted ' + $i
    done;
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/pfsense.yaml -o pfsense.yaml;
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/freenas.yaml -o freenas.yaml;
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/cisco-sw.yaml -o cisco-sw.yaml;
#
echo "removing old conteiners"
sudo docker rm -f $(sudo docker ps -qa)
echo "finished cleaning docker"
#sudo chmod +x create-container.sh
#
#echo "enter DD API key"
#read apikey
#
function create_container {
        for file in /tmp/templates/*; do
                echo "starting new container "
                image=$(sudo docker run -d  -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY= datadog/agent:6.12.1)
                echo "copying yaml templates to $file"
                sudo  docker cp $file $image:/etc/datadog-agent/conf.d/snmp.d
                sudo docker restart $image
        done
                          }
create_container
