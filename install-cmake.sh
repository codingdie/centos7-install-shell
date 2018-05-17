WNLOAD_DIR="/opt/download"
SOURCE_DIR="/opt/source"
CONF_DIR="/opt/conf"
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

NAME="cmake"
VERSION="3.11.1"
APP_NAME_VERSION="${NAME}-${VERSION}"
APP_SOURCE_PATH="${SOURCE_DIR}/${APP_NAME_VERSION}"
APP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${APP_NAME_VERSION}.tar.gz"
DOWLOAD_URL="http://qcloud.ikouqin.cn/download/${APP_NAME_VERSION}.tar.gz"
if [ ! -d ${APP_SOURCE_PATH} ]; then
 wget -O ${APP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
 tar -xvf ${APP_DOWNLOAD_FILE}  -C ${SOURCE_DIR}
fi

cd ${SOURCE_DIR}
cd ${APP_SOURCE_PATH}
ls
./configure
make -j8
make clean
make install


