sh del-user.sh $1
useradd ${1}
su - ${1} -c "mkdir /home/${1}/.ssh"
su - ${1} -c "echo \"${2}\">/home/${1}/.ssh/authorized_keys"
su - ${1} -c "chmod 600 /home/${1}/.ssh/authorized_keys"
su - ${1} -c "chmod 700 /home/${1}/.ssh"
echo "${1}  ALL=(ALL) NOPASSWD:ALL">>/etc/sudoers
