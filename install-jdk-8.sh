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

NAME="jdk"
VERSION="8u121"
OS="linux"
BIT="x64"
FULL_NAME="${NAME}-${VERSION}-${OS}-${BIT}"
APP_SOURCE_PATH="/opt/jdk8"
APP_DOWNLOAD_FILE="${DOWNLOAD_DIR}/${FULL_NAME}.tar.gz"
DOWLOAD_URL="http://qcloud.ikouqin.cn/download/${FULL_NAME}.tar.gz"
if [ ! -d ${APP_SOURCE_PATH}  ]; then
 wget -O ${APP_DOWNLOAD_FILE} -c ${DOWLOAD_URL}
 tar -xvf ${APP_DOWNLOAD_FILE}  -C "/opt"
 mv "/opt/jdk1.8.0_121" ${APP_SOURCE_PATH}
 echo "JDK8 finish installed"
 else
 echo "JDK8 has installed" 
fi
if  [ ! -n "$JAVA_HOME" ] ;then
    echo "JAVA_HOME has not set"
    echo "add blow text into /etc/profile"
    echo "export JAVA_HOME=${APP_SOURCE_PATH}"
    echo "export PATH=\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH"
    echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar"
    echo "run source /etc/profile"
else
    echo "JAVA_HOME has set"
fi
