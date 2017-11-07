sh add-user.sh $1 "${3}"
git config --global user.email $2
git config --global user.name  $1
echo ${4//./_}>/etc/hostname
echo "127.0.0.1 localhost ${4//./_}">/etc/hosts
echo "${5} ${4}">>/etc/hosts
sh install-jdk-8.sh
sh install-common.sh
reboot
