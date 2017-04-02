
wget -c  https://repo.mysql.com//mysql57-community-release-el7-9.noarch.rpm
rpm -Uvh mysql57-community-release-el7-9.noarch.rpm
rm -rf mysql57-community-release-el7-9.noarch.rpm
yum install mysql-community-server
echo "----------------------------------------------------"
sudo grep 'temporary password' /var/log/mysqld.log
echo "----------------------------------------------------"
