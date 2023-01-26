#!/bin/bash

DESCRIPTION="vulnerabilities, CVE-2022-41903, and CVE-2022-23521, that affect versions 2.39 and older. Git for Windows was also patched to address an additional, Windows-specific issue known as CVE-2022-41953."

build() {
  case $1 in
    centos8-git) DOCKERFILE=Dockerfile.CentOS8 ;;
    centos9-git) DOCKERFILE=Dockerfile.CentOS9 ;;
    rhel7-git) DOCKERFILE=Dockerfile.rhel7 ;;
    rhel8-git) DOCKERFILE=Dockerfile.rhel8 ;;
    rhel9-git) DOCKERFILE=Dockerfile.rhel9 ;;
    ubuntulunar-git) DOCKERFILE=Dockerfile.ubuntulunar ;;
    alpine-git) DOCKERFILE=Dockerfile.alpine ;;
    fedora36-git) DOCKERFILE=Dockerfile.fedora36 ;;
    archlinux-git) DOCKERFILE=Dockerfile.archlinux ;;
    debianstable-git) DOCKERFILE=Dockerfile.debianstable ;;
    debiantesting-git) DOCKERFILE=Dockerfile.debiantesting ;;    
    debianunstable-git) DOCKERFILE=Dockerfile.debianunstable ;;
  esac
}

for distro in $(cat input.txt) 
do
  build $distro
  docker build -t ${distro} -f ${DOCKERFILE} .
done
