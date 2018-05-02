userdel ${1}
sed -i "/${1}  ALL=(ALL) NOPASSWD:ALL/d" /etc/sudoers
rm -rf /home/${1}
rm -rf /var/spool/mail/${1}

