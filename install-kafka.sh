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
SCALA="2.12"
VERSION="1.0.0"
FULL_NAME="${NAME}_${SCALA}-${VERSION}"
APP_SOURCE_PATH="/opt/kafka"
APP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${FULL_NAME}.tgz"
DOWLOAD_URL="http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/${VERSION}/${FULL_NAME}.tgz"
if [ ! -d ${APP_SOURCE_PATH}  ]; then
 wget -O ${APP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
 tar -zxvf ${APP_DOWNLOAD_FILE}  -C "/opt"
 mv "/opt/${FULL_NAME}" ${APP_SOURCE_PATH}
 echo "${NAME} finish installed"
else
 echo "${NAME} has installed" 
fi
