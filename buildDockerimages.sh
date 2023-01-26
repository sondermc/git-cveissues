#!/bin/bash

DESCRIPTION="vulnerabilities, CVE-2022-41903, and CVE-2022-23521, that affect versions 2.39 and older. Git for Windows was also patched to address an additional, Windows-specific issue known as CVE-2022-41953."

build() {
  case $1 in
    centos8-git) DOCKERFILE=Dockerfile.CentOS8 ;;
    centos9-git) DOCKERFILE=Dockerfile.CentOS9 ;;
    ubuntulunar-git) DOCKERFILE=Dockerfile.ubuntulunar ;;
    alpine-git) DOCKERFILE=Dockerfile.alpine ;;
  esac
}

for distro in $(cat input.txt) 
do
  build $distro
  podman build -t ${distro} -f ${DOCKERFILE} .
done
