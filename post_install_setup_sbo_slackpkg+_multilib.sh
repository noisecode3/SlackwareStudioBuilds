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

# check md5 for pkgs
sbopkg_md5sum="df40c7c991a30c1129a612a40be9f590  sbopkg-0.38.2-noarch-1_wsr.tgz"
slackpkg_md5sum="769a2505230bbd709823ba4c35a9b29b  slackpkg+-1.8.0-noarch-7mt.txz"

# versions
sbopkg_version=0.38.2
sbopkg_tag=1_wsr
slackpkg_version=1.8.0
slackpkg_tag=7mt

# Download
wget -c https://github.com/sbopkg/sbopkg/releases/download/$sbopkg_version/sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
wget -c https://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-$slackpkg_version-noarch-$slackpkg_tag.txz

# Check
sbopkg_md5sum_dl=$(md5sum sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz)
slackpkg_md5sum_dl=$(md5sum slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz)

if [[ $sbopkg_md5sum == "$sbopkg_md5sum_dl" ]]
    then
        echo "sbopkg download OK"
    else
        echo "sbopkg download faild"
        rm ./sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
        rm ./slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz
        exit 1
fi

if [[ $slackpkg_md5sum == "$slackpkg_md5sum_dl" ]]
    then
        echo "slackpkg+ download OK"
    else
        echo "slackpkg+ download faild"
        rm ./sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
        rm ./slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz
        exit 1
fi

echo ""

# Install sbopkg and slackpkg+
installpkg ./sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
installpkg ./slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz

# Clean up
rm ./sbopkg-$sbopkg_version-noarch-$sbopkg_tag.tgz
rm ./slackpkg+-$slackpkg_version-noarch-$slackpkg_tag.txz

# Upgrade system
echo ""
echo "****************************"
echo " Upgrade system , hit return"
echo "****************************"
read -r

# Sed slackpkg
if [[ $(cat /etc/slackware-version) == "Slackware 15.0" ]]
then
  echo "Slackware 15.0"
  sed -i 's/# https:\/\/mirrors.slackware.com\/slackware\/slackware64-15.0\//https:\/\/mirrors.slackware.com\/slackware\/slackware64-15.0\//g' /etc/slackpkg/mirrors
  sed -i "s/^#MIRRORPLUS\['multilib'\]/MIRRORPLUS\['multilib'\]/g" /etc/slackpkg/slackpkgplus.conf
elif [[ $(cat /etc/slackware-version) == "Slackware 15.0+" ]]
then
  echo "Slackware 15.0+"
  sed -i 's/# https:\/\/mirrors.slackware.com\/slackware\/slackware64-current\//https:\/\/mirrors.slackware.com\/slackware\/slackware64-current\//g' /etc/slackpkg/mirrors
  sed -i "s|^#MIRRORPLUS\['multilib'\]=https://slackware.nl/people/alien/multilib/15.0/|MIRRORPLUS\['multilib'\]=https://slackware.nl/people/alien/multilib/current/|g" /etc/slackpkg/slackpkgplus.conf
fi

sed -i 's/#PKGS_PRIORITY=( multilib )/PKGS_PRIORITY=( multilib )/g' /etc/slackpkg/slackpkgplus.conf
sed -i 's/REPOPLUS=( slackpkgplus )/REPOPLUS=( slackpkgplus multilib )/g' /etc/slackpkg/slackpkgplus.conf

echo ""
echo "Upgrading slackware base and apply multilib"

slackpkg update gpg
slackpkg update
slackpkg upgrade multilib
slackpkg upgrade-all
slackpkg install multilib

echo "!!Attention!! You may need to run lilo or setup you're boot loader and reboot !!Attention!!"
exit 0
