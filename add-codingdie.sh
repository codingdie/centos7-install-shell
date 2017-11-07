userdel codingdie
rm -rf /home/codingdie
rm -rf /var/spool/mail/codingdie
useradd codingdie
su - codingdie -c 'mkdir /home/codingdie/.ssh'
su - codingdie -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDagr/MxiQiLlQCaZnK18G03PPdsxXpql2HzPA2TbXQ70ZXxyZ892P9s0pY+GElYCsgiESjthnGaJPxhXxAno091JdhdqGuwsqxIlgFQNZ21PkxiDQh61aKMjllrdVvtsHcZdsP3/5+APbiqQB3gNqeL4L93rXi9j/LfRtd4IhPmVGvPB3DdidTGUrVzRqABNhOzFrl3sdBxK6W0BS2iZLKke6U85J5r9uDem9y4npTQUOplS2dCLTksnbKcXGYL+TWXH8FO+NOsqdG32jUofMWNCwV6unVaW6vwsK1/6DvZtBTlwezAbHgArpJ+fldwHASyCYsE8syTtE5LaSns6xp 547912355@qq.com">/home/codingdie/.ssh/authorized_keys'
su - codingdie -c 'chmod 600 /home/codingdie/.ssh/authorized_keys'
su - codingdie -c 'chmod 700 /home/codingdie/.ssh'
sed -i '/codingdie  ALL=(ALL) NOPASSWD:ALL/d' /etc/sudoers 
echo "codingdie  ALL=(ALL) NOPASSWD:ALL">>/etc/sudoers
