#!/bin/bash
#sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/create-container.sh -o /tmp/datadog/create-container.sh;
echo "removing old conteiners"
sudo docker rm -f $(sudo docker ps -qa)
echo "finished cleaning docker"
cd /tmp/datadog
sudo chmod +x create-container.sh
#while :
#do
#if [ "$(ls /tmp/templates)" ]; then
#echo 'running container'
/tmp/datadog/create-container.sh
#else
#echo 'done running container'
#break
#fi
#done