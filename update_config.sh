#!/bin/bash
sudo docker rm -f $(sudo docker ps -qa);
cd /tmp
    for i in $(find -name "*.yaml"); 
        do sudo rm $i; 
        echo 'deleted ' + $i
    done;
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/pfsense.yaml?token=ALZSSGLH2PDP3A5YHHSHSAC5Y4NS6 -o /tmp/pfsense.yaml;
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/freenas.yaml?token=ALZSSGNJJQXGTH7EPHRLJL25Y4NUG -o /tmp/freenas.yaml;
sudo curl https://raw.githubusercontent.com/alex9985/datadog/master/create-container.sh?token=ALZSSGNBC6DGI3TXFQWWQEC5Y4NQG -o /tmp/create-container.sh;

while :
do
if ["$(ls -A /tmp/)"]; then
echo 'running container'
/tmp/create-container.sh
else
echo 'done running container'
break
fi
done