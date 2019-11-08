function create_container {
    sudo image=DOCKER_CONTENT_TRUST=1 docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY=cfbff7ee70f2ee29827776ff538ab461 datadog/agent:6.12.1
    sudo  docker cp /tmp/pfsense.yaml $image:/etc/datadog-agent/conf.d/snmp.d
    sudo  docker cp /tmp/freenas.yaml $image:/etc/datadog-agent/conf.d/snmp.d
    sudo docker restart $image
    }