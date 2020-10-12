yum install docker -y
docker pull centos:centos7
current_dir=$(pwd)
docker run -ti -v $current_dir:/src --name centos7 centos:centos7 /bin/bash
sudo docker run --rm --privileged --name centos7 -v $current_dir:/src -w /src centos:centos7 ./gcc_install.sh