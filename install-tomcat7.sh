WNLOAD_DIR="/opt/download"
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

NAME="apache-tomcat"
VERSION="7.0.77"
APP_NAME_VERSION="${NAME}-${VERSION}"
APP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${APP_NAME_VERSION}.tar.gz"
DOWLOAD_URL="http://qcloud.ikouqin.cn/download/centos/${APP_NAME_VERSION}.tar.gz"
if [ ! -d /opt/${APP_NAME_VERSION} ]; then
 wget -O ${APP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
 tar -xvf ${APP_DOWNLOAD_FILE}  -C /opt/
fi

cd /opt/${APP_NAME_VERSION}
rm /opt/conf/tomcat-server.xml
ln -s /opt/${APP_NAME_VERSION}/conf/server.xml /opt/conf/tomcat-server.xml
echo 'finish'
