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

NAME="nginx"
VERSION="1.10.3"
APP_NAME_VERSION="${NAME}-${VERSION}"
APP_SOURCE_PATH="${SOURCE_DIR}/${APP_NAME_VERSION}"
APP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${APP_NAME_VERSION}.tar.gz"
DOWLOAD_URL="http://nginx.org/download/${APP_NAME_VERSION}.tar.gz"
if [ ! -d ${APP_SOURCE_PATH} ]; then
 wget -O ${APP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
 tar -xvf ${APP_DOWNLOAD_FILE}  -C ${SOURCE_DIR}
fi

cd ${APP_SOURCE_PATH}
yum install pcre-devel zlib-devel openssl*

./configure --with-http_stub_status_module --with-http_ssl_module --with-stream
make
make install
rm /usr/sbin/nginx
rm /opt/conf/nginx.conf
ln -s /usr/local/nginx/sbin/nginx /usr/sbin/nginx
ln -s /usr/local/nginx/conf/nginx.conf /opt/conf/nginx.conf
