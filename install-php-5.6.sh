DOWNLOAD_DIR="/opt/download"
SOURCE_DIR="/opt/source"
SHELL_DIR=$(cd `dirname $0`; pwd)
CONF_DIR='/opt/conf'
if [ ! -d "$DOWNLOAD_DIR" ]; then  
 mkdir -p $DOWNLOAD_DIR; 
fi  
if [ ! -d "$SOURCE_DIR" ]; then
 mkdir -p $SOURCE_DIR;
fi
if [ ! -d "$CONF_DIR" ]; then
 mkdir -p $CONF_DIR;
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
yum -y install libxml2*
yum -y install   libcurl-devel libjpeg-devel libpng-devel libvpx-devel

./configure --with-zlib --with-jpeg-dir --with-png-dir --disable-fileinfo   --with-gd  --enable-mbstring  --with-mysql --with-curl --enable-fpm
make
make install
rm /usr/local/lib/php.ini
rm /usr/local/etc/php-fpm.conf
rm ${CONF_DIR}/php.ini
rm ${CONF_DIR}/php-fpm.conf
cp ${PHP_SOURCE_PATH}/sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
chmod 755 /etc/init.d/php-fpm


cp ${SHELL_DIR}/conf/php.ini /usr/local/lib/php.ini
cp ${SHELL_DIR}/conf/php-fpm.conf /usr/local/etc/php-fpm.conf
ln -s /usr/local/lib/php.ini ${CONF_DIR}/php.ini
ln -s /usr/local/etc/php-fpm.conf ${CONF_DIR}/php-fpm.conf
echo 'finish'
