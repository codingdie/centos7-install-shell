DOWNLOAD_DIR="/opt/download"
SOURCE_DIR="/opt/source"
if [ ! -d "$DOWNLOAD_DIR" ]; then  
 mkdir $DOWNLOAD_DIR; 
fi  
if [ ! -d "$SOURCE_DIR" ]; then
 mkdir $SOURCE_DIR;
fi

VERSION="5.6.30"
PHP_NAME="php-${VERSION}"
PHP_SOURCE_PATH="${SOURCE_DIR}/${PHP_NAME}"
PHP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${PHP_NAME}.tar.gz"
DOWLOAD_URL="http://hk1.php.net/get/${PHP_NAME}.tar.gz/from/this/mirror"
echo ${PHP_SOURCE_PATH}
if [ ! -d ${PHP_SOURCE_PATH} ]; then
 wget -O ${PHP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
 tar -xvf ${PHP_DOWNLOAD_FILE}  -C ${SOURCE_DIR}
fi

cd ${PHP_SOURCE_PATH}
yum install libxml2*
./configure
make
make install

