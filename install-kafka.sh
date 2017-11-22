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

NAME="kafka"
VERSION="1.0.0"
FULL_NAME="${NAME}-${VERSION}"
APP_SOURCE_PATH="/opt/kafka"
APP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${FULL_NAME}.tgz"
DOWLOAD_URL="http://mirror.bit.edu.cn/apache/kafka/1.0.0/kafka-1.0.0-src.tgz"
if [ ! -d ${APP_SOURCE_PATH}  ]; then
 wget -O ${APP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
 tar -zxvf ${APP_DOWNLOAD_FILE}  -C "/opt"
 mv "/opt/${FULL_NAME}-src" ${APP_SOURCE_PATH}
 echo "${NAME} finish installed"
else
 echo "${NAME} has installed" 
fi
