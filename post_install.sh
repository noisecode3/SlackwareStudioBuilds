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
slackpkg_md5sum="16751df70bb703f85028dad5b3bb9ccf  slackpkg+-1.8.0-noarch-6mt.txz"

# Download
wget https://github.com/sbopkg/sbopkg/releases/download/0.38.2/sbopkg-0.38.2-noarch-1_wsr.tgz
wget https://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-1.8.0-noarch-6mt.txz

# Check
sbopkg_md5sum_dl=$(md5sum sbopkg-0.38.2-noarch-1_wsr.tgz)
slackpkg_md5sum_dl=$(md5sum slackpkg+-1.8.0-noarch-6mt.txz)

if [[ $sbopkg_md5sum == $sbopkg_md5sum_dl ]]
    then
        echo -e "\nsbopkg download okej\n"
    else
        echo -e "\nsbopkg download faild\n"
        rm ./sbopkg-0.38.2-noarch-1_wsr.tgz
        rm ./slackpkg+-1.8.0-noarch-6mt.txz
        exit 1
fi

if [[ $slackpkg_md5sum == $slackpkg_md5sum_dl ]]
    then
        echo -e "\nslackpkg+ download okej\n"
    else
        echo -e "\nslackpkg+ download faild\n"
        rm ./sbopkg-0.38.2-noarch-1_wsr.tgz
        rm ./slackpkg+-1.8.0-noarch-6mt.txz
        exit 1
fi

# Install sbopkg and slackpkg+
installpkg ./sbopkg-0.38.2-noarch-1_wsr.tgz
echo -e "\n"
installpkg ./slackpkg+-1.8.0-noarch-6mt.txz

# Clean up
rm ./sbopkg-0.38.2-noarch-1_wsr.tgz
rm ./slackpkg+-1.8.0-noarch-6mt.txz

# Upgrade system
echo ""
echo "****************************"
echo " Upgrade system , hit return"
echo "****************************"
read

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

# Copy config files here
echo "vm.mmap_min_addr = 65536"  >> /etc/sysctl.d/mmap_restriction_override.conf
sed -i 's/#SCALING_GOVERNOR=ondemand/#SCALING_GOVERNOR=performance/g' /etc/default/cpufreq
sed -i 's/SCALING_GOVERNOR=ondemand/SCALING_GOVERNOR=performance/g' /etc/rc.d/rc.cpufreq

echo -e "@audio - memlock unlimited\n@audio - rtprio 95\n@audio - nofile 1048576" >> /etc/security/limits.d/audio.conf
cp ./config_files/40-timer-permissions.rules /etc/udev/rules.d/40-timer-permissions.rules
/etc/rc.d/rc.udev reload
cp ./config_files/daw.conf /etc/sysctl.d/daw.conf

echo "!!Attention!! You may need to run lilo or setup you're boot loader and reboot !!Attention!!"
exit 0
