#!bin/bash
# sends ssh key to all Virtual Machines that are in ansible "hosts" file
read -s -p 'Sudo password: ' UPASS
export SSHPASS=$UPASS
for ip in $(cat /home/$USER/my_ansible/hosts)
do
	if [[ "$ip" == *"10.0.0"* ]]; then
		echo $ip
		# Copy our key the first time to allow
 		sshpass -e ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no $ip || echo "FAILED"
	fi
done
