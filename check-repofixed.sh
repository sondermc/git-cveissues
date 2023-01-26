#!/bin/bash

DESCRIPTION="vulnerabilities, CVE-2022-41903, and CVE-2022-23521, that affect versions 2.39 and older. Git for Windows was also patched to address an additional, Windows-specific issue known as CVE-2022-41953."

for distro in $(cat input.txt)
do
  RAWGITVERSION=$(docker run --rm ${distro})
  GITVERSION=$(echo ${RAWGITVERSION} | cut -d' ' -f 3)
  SEMVERMAJOR=$(echo ${GITVERSION} | cut -d. -f 1)
  SEMVERMINOR=$(echo ${GITVERSION} | cut -d. -f 2)
  SEMVERPATCH=$(echo ${GITVERSION} | cut -d. -f 3)
  if [[ ${SEMVERMAJOR} -ge "2" && ${SEMVERMINOR} -ge "39" && ${SEMVERPATCH} -ge "1" ]]
  then
    MESSAGE="[OK]"
  else
    MESSAGE="[WARNING]"
  fi
  
  printf "${MESSAGE} ${distro}: ${RAWGITVERSION}\n"
done
