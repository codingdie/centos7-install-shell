DOWNLOAD_DIR="/opt/download"
SOURCE_DIR="/opt/source"
CONF_DIR="/opt/conf"
if [ ! -d "$DOWNLOAD_DIR" ]; then
 mkdir $DOWNLOAD_DIR;
fi
if [ ! -d "$SOURCE_DIR" ]; then
 mkdir $SOURCE_DIR;
fi
if [ ! -d "$CONF_DIR" ]; then
 mkdir $CONF_DIR;
fi
sh install-mysql-client.sh
yum  install    numactl

NAME="mysql-community-server"
VERSION="5.7.17"
SYS="x86_64"
APP_NAME_VERSION="${NAME}-${VERSION}"
DOWNLOAD_FILE_NAME="${APP_NAME_VERSION}-1.el7.${SYS}.rpm"
APP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${DOWNLOAD_FILE_NAME}"
DOWLOAD_URL="http://codingdie01-1253506722.costj.myqcloud.com/download/${DOWNLOAD_FILE_NAME}"
if [ ! -f ${APP_DOWNLOAD_FILE} ]; then
 wget -O ${APP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
fi
 rpm -ivh ${APP_DOWNLOAD_FILE}
rm ${CONF_DIR}/my.cnf
ln -s /etc/my.cnf  ${CONF_DIR}/my.cnf
echo "----------------------------------------------------"
grep 'temporary password' /var/log/mysqld.log
echo "----------------------------------------------------"
