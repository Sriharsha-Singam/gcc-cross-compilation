#!/bin/bash
yum install wget -y
yum install gcc -y
yum install bzip2 -y
yum install m4 -y
yum install make -y
yum -y install glibc-devel.i686 glibc-devel ibstdc++-devel.i686
yum install texi2html texinfo -y
yum install gcc-c++ -y

wget https://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
wget https://ftp.gnu.org/gnu/gmp/gmp-6.2.0.tar.bz2
wget https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.gz
wget https://ftp.gnu.org/gnu/mpc/mpc-1.2.0.tar.gz
tar -xzf gcc-10.2.0.tar.gz
tar -jxf gmp-6.2.0.tar.bz2
tar -xzf mpfr-4.1.0.tar.gz
tar -xzf mpc-1.2.0.tar.gz

mkdir custom
cd custom
pwd=$(pwd)
cd ..

pushd gmp-6.2.0
./configure --prefix=$pwd
make
make check
make install
popd

pushd mpfr-4.1.0
./configure --prefix=$pwd --with-gmp=$pwd
make 
make install
popd

pushd mpc-1.2.0
./configure --prefix=$pwd --with-gmp=$pwd --with-mpfr=$pwd
make 
make install
popd

pushd mpc-1.2.0
./configure --prefix=$pwd --with-gmp=$pwd --with-mpfr=$pwd --with-mpc=$pwd --disable-multilib
make 
make install
popd

