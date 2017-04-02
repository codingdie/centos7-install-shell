nstall pcre-devel zlib-devel openssl*
wget -c http://nginx.org/download/nginx-1.10.3.tar.gz
tar xzf nginx-1.10.3.tar.gz
cd nginx-1.10.3
./configure --with-http_stub_status_module --with-http_ssl_module --with-stream
make
make install
cd ../
rm -rf nginx-1.10.3.tar.gz
rm -rf nginx-1.10.3
