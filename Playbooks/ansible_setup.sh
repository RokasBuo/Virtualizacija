
#!/bin/bash
# Sets up environment for ansible
yes | apt update
yes | apt upgrade
yes | apt install ansible python3-pip sshpass
pip3 install passlib
wget -q -O- https://downloads.opennebula.org/repo/repo.key | sudo apt-key add -
echo "deb https://downloads.opennebula.org/repo/5.6/Ubuntu/18.04 stable opennebula" | sudo tee /etc/apt/sources.list.d/opennebula.list
yes | apt update
yes | apt install opennebula-tools
exit 0
