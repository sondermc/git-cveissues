#!/bin/bash

DESCRIPTION="vulnerabilities, CVE-2022-41903, and CVE-2022-23521, that affect versions 2.39 and older. Git for Windows was also patched to address an additional, Windows-specific issue known as CVE-2022-41953."

build() {
  case $1 in
    alpine-git) DOCKERFILE=Dockerfile.alpine ;;
    archlinux-git) DOCKERFILE=Dockerfile.archlinux ;;
    centos8-git) DOCKERFILE=Dockerfile.CentOS8 ;;
    centos9-git) DOCKERFILE=Dockerfile.CentOS9 ;;
    debianstable-git) DOCKERFILE=Dockerfile.debianstable ;;
    debiantesting-git) DOCKERFILE=Dockerfile.debiantesting ;;    
    debianunstable-git) DOCKERFILE=Dockerfile.debianunstable ;;
    fedora34-git) DOCKERFILE=Dockerfile.fedora34 ;;
    fedora35-git) DOCKERFILE=Dockerfile.fedora35 ;;
    fedora36-git) DOCKERFILE=Dockerfile.fedora36 ;;
    fedora37-git) DOCKERFILE=Dockerfile.fedora37 ;;
    gentoo-git) DOCKERFILE=Dockerfile.gentoo ;;
    rhel7-git) DOCKERFILE=Dockerfile.rhel7 ;;
    rhel8-git) DOCKERFILE=Dockerfile.rhel8 ;;
    rhel9-git) DOCKERFILE=Dockerfile.rhel9 ;;
    sles15-git) DOCKERFILE=Dockerfile.sles15 ;;
    ubuntubionic-git) DOCKERFILE=Dockerfile.ubuntubionic ;;
    ubuntufocal-git) DOCKERFILE=Dockerfile.ubuntufocal ;;
    ubuntujammy-git) DOCKERFILE=Dockerfile.ubuntujammy ;;
    ubuntukinetic-git) DOCKERFILE=Dockerfile.ubuntukinetic ;;
    ubuntulunar-git) DOCKERFILE=Dockerfile.ubuntulunar ;;
    ubuntulunar-git) DOCKERFILE=Dockerfile.ubuntulunar ;;
    ubuntutrusty-git) DOCKERFILE=Dockerfile.ubuntutrusty ;;
    ubuntuxenial-git) DOCKERFILE=Dockerfile.ubuntuxenial ;;
  esac
}

for distro in $(cat input.txt) 
do
  build ${distro}
  echo Building: ${distro} using Dockerfile: ${DOCKERFILE}
  time docker build -q -t ${distro} -f ${DOCKERFILE} .
done
