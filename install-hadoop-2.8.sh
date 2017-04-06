DOWNLOAD_DIR="/opt/download"
SOURCE_DIR="/opt/source"
CONF_DIR="/opt/conf"
SHELL_DIR=$(cd `dirname $0`; pwd)
if [ ! -d "$DOWNLOAD_DIR" ]; then
 mkdir $DOWNLOAD_DIR;
fi
if [ ! -d "$SOURCE_DIR" ]; then
 mkdir $SOURCE_DIR;
fi
if [ ! -d "$CONF_DIR" ]; then
 mkdir $CONF_DIR;
fi

NAME="hadoop"
VERSION="2.8.0"
OS="linux"
BIT="x64"
FULL_NAME="${NAME}-${VERSION}"
APP_SOURCE_PATH="/opt/${FULL_NAME}"
APP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${FULL_NAME}.tar.gz"
DOWLOAD_URL="http://qcloud.ikouqin.cn/download/${FULL_NAME}.tar.gz"
if [ ! -d ${APP_SOURCE_PATH}  ]; then
 wget -O ${APP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
 tar -xvf ${APP_DOWNLOAD_FILE}  -C "/opt"
 mkdir -p ${APP_SOURCE_PATH}/data
 cp -rf ${SHELL_DIR}/conf/hadoop ${APP_SOURCE_PATH}/etc/
 echo "hadoop2.8 finish installed"
 else
 echo "hadoop2.8 has installed" 
fi
if  [ ! -n "$HADOOP_HOME" ] ;then
    echo "HADOOP_HOME has not set"
    echo "add blow text into /etc/profile"
    echo "export HADOOP_HOME=${APP_SOURCE_PATH}"
    echo "export HADOOP_CONF_DIR=${APP_SOURCE_PATH}/etc/hadoop"
    echo "export PATH=\$HADOOP_HOME/sbin:\$HADOOP_HOME/bin:\$PATH"
    echo "run source /etc/profile"
else
    echo "HADOOP_HOME has set"
fi
