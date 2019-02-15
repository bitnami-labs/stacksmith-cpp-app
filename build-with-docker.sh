#!/bin/bash

set -eu -o pipefail

if [ "${1:-docker}" = "inside-container" ] ; then
  yum install -y make gcc-c++ boost-devel openssl-devel epel-release wget
  yum update -y

  cd /etc/yum.repos.d
  wget https://copr.fedorainfracloud.org/coprs/g/kdesig/cmake3_EPEL/repo/epel-7/heliocastro-cmake3_EPEL-epel-7.repo
  yum install -y cmake3

  cd /app/app
  rm -fR build
  mkdir -p build
  cd build
  cmake3 ..
  make
  strip http_examples

  cd ..
  cp -f build/http_examples ../
  rm -fR build

  exit
fi


docker run --rm -v "$(pwd):/app" centos:7 bash /app/build-with-docker.sh inside-container

