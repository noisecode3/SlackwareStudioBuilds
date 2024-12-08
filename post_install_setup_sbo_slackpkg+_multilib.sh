#!/bin/bash

#   Slackware Studio
#   Copyright (C) 2022  Martin Bångens
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Slackware version
SV=15.0

# check md5 for pkgs
sbopkg_md5sum="df40c7c991a30c1129a612a40be9f590  /tmp/sbopkg-0.38.2-noarch-1_wsr.tgz"
slackpkg_md5sum="769a2505230bbd709823ba4c35a9b29b  /tmp/slackpkg+-1.8.0-noarch-7mt.txz"

# versions
sbopkg_version=0.38.2
sbopkg_tag=1_wsr
slackpkg_version=1.8.0
slackpkg_tag=7mt

# Download
wget -c -P /tmp https://github.com/sbopkg/sbopkg/releases/download/$sbopkg_version/sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
wget -c -P /tmp https://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-$slackpkg_version-noarch-$slackpkg_tag.txz

# Check
sbopkg_md5sum_dl=$(md5sum /tmp/sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz)
slackpkg_md5sum_dl=$(md5sum /tmp/slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz)

if [[ $sbopkg_md5sum == "$sbopkg_md5sum_dl" ]]
    then
        echo "sbopkg download OK"
    else
        echo "sbopkg download faild"
        rm -f /tmp/sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
        rm -f /tmp/slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz
        exit 1
fi

if [[ $slackpkg_md5sum == "$slackpkg_md5sum_dl" ]]
    then
        echo "slackpkg+ download OK"
    else
        echo "slackpkg+ download faild"
        rm -f /tmp/sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
        rm -f /tmp/slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz
        exit 1
fi

echo ""

# Install sbopkg and slackpkg+
upgradepkg --install-new /tmp/sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
upgradepkg --install-new /tmp/slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz

# Clean up
rm /tmp/sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
rm /tmp/slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz

updateFun ()
{
  echo ""
  echo "Do you want to upgrade slackware? (y/N)"
  read -r ANS
  if [ "$ANS" == "y" ] || [ "$ANS" == "Y" ]; then
    slackpkg update gpg
    slackpkg update
    slackpkg upgrade-all
    echo "!!Attention!! You may need to run lilo or setup you're boot loader and reboot !!Attention!!"
  fi
}

# Setup bail chance
echo ""
echo "*******************************************************"
echo " Setup slackpkg+ multilib, hit return or ctrl-c to exit"
echo "*******************************************************"
read -r

# Sed slackpkg mirror and run setupmultilib.sh
BASE_URL="https://mirrors.slackware.com/slackware/slackware64"

if grep -v ^\# /etc/slackpkg/mirrors 2>/dev/null; then
  echo "Found mirror"
else
  SLACKWARE_VERSION=$(cat /etc/slackware-version)

  if [[ "$SLACKWARE_VERSION" == "Slackware $SV" ]]; then
    echo "Slackware $SV"
    sed -i "s|^# $BASE_URL-$SV/|$BASE_URL-$SV/|" /etc/slackpkg/mirrors
    V="15"
  elif [[ "$SLACKWARE_VERSION" == "Slackware $SV+" ]]; then
    echo "Slackware $SV+"
    sed -i "s|^# $BASE_URL-current/|$BASE_URL-current/|" /etc/slackpkg/mirrors
    V=""
  fi
fi

sed -i "/^MIRRORPLUS\['slackpkgplus'\]=/s|https://slakfinder.org/slackpkg+15/|https://slackware.nl/slackpkgplus$V/|" /etc/slackpkg/slackpkgplus.conf
updateFun
/usr/doc/slackpkg+-$slackpkg_version/setupmultilib.sh

exit 0
