sudo image=DOCKER_CONTENT_TRUST=1 docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY=cfbff7ee70f2ee29827776ff538ab461 datadog/agent:6.12.1
sudo  docker cp /etc/datadog-agent/conf.d/snmp.d/pfsense.yaml b5f53e22d592:/etc/datadog-agent/conf.d/snmp.d
sudo  docker cp /etc/datadog-agent/conf.d/snmp.d/freenas.yaml b5f53e22d592:/etc/datadog-agent/conf.d/snmp.d
sudo docker restart b5f53e22d592
