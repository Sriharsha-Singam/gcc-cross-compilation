apt-get install docker -y
docker pull centos:centos7
current_dir=$(pwd)
sudo docker run --rm --privileged --name centos7 -v $current_dir:/src -w /src centos:centos7 ./gcc_install.sh
tar -czf gcc_centos_x86_64.tar.gz custom