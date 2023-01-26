#!/bin/bash

DESCRIPTION="vulnerabilities, CVE-2022-41903, and CVE-2022-23521, that affect versions 2.39 and older. Git for Windows was also patched to address an additional, Windows-specific issue known as CVE-2022-41953."

for distro in $(cat input.txt)
do
  printf "$distro: "
  podman run --rm ${distro}
done
