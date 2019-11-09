#!/bin/bash
function create_container {
    image=$(docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY=81dd83da39b9c16e3931c48091612016 datadog/agent:6.12.1)
    sudo  docker cp /tmp/pfsense.yaml $image:/etc/datadog-agent/conf.d/snmp.d
    sudo  docker cp /tmp/freenas.yaml $image:/etc/datadog-agent/conf.d/snmp.d
    sudo docker restart $image
    }
create_container