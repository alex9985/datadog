#!/bin/bash
function create_container {
    echo "enter DataDog API key "
    read apikey
        for file in /tmp/templates/*; do
                echo "starting new container with $apikey"
                image=$(sudo docker run -d  -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY=$apikey  datadog/agent:6.12.1)
                echo "copying yaml templates"
                sudo  docker cp /tmp/templates/pfsense.yaml $image:/etc/datadog-agent/conf.d/snmp.d
                sudo  docker cp /tmp/templates/freenas.yaml $image:/etc/datadog-agent/conf.d/snmp.d
                echo "restarting container $image"
                sudo docker restart $image
        done
                          }
create_container