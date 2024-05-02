#!/bin/bash

# Execute bash script from link
# wget -O - https://raw.githubusercontent.com/smakphp/dev/main/d12.sh | bash

sed -i 's/^#*ClientAliveInterval.*/ClientAliveInterval 3600/g' /etc/ssh/sshd_config
sed -i 's/^#*ClientAliveCountMax.*/ClientAliveCountMax 3/g' /etc/ssh/sshd_config
