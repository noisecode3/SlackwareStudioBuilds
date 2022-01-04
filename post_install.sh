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
sbopkg_md5sum="42e40c32a7aed4c417f1ee852c51c6d0  sbopkg-0.38.1-noarch-1_wsr.tgz"
slackpkg_md5sum="d80f1d97fa3a2d8abb4cda72664f03c7  slackpkg+-1.7.10-noarch-1mt.txz"

# Download
wget https://github.com/sbopkg/sbopkg/releases/download/0.38.1/sbopkg-0.38.1-noarch-1_wsr.tgz
wget https://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-1.7.10-noarch-1mt.txz

# Check
sbopkg_md5sum_dl=$(md5sum sbopkg-0.38.1-noarch-1_wsr.tgz)
slackpkg_md5sum_dl=$(md5sum slackpkg+-1.7.10-noarch-1mt.txz)

if [[ $sbopkg_md5sum == $sbopkg_md5sum_dl ]]
    then
        echo -e "\nsbopkg download okej\n"
    else
        echo -e "\nsbopkg download faild\n"
        exit 1
fi

if [[ $slackpkg_md5sum == $slackpkg_md5sum_dl ]]
    then
        echo -e "\nslackpkg+ download okej\n"
    else
        echo -e "\nslackpkg+ download faild\n"
        exit 1
fi

# Install sbopkg and slackpkg+
installpkg ./sbopkg-0.38.1-noarch-1_wsr.tgz
echo -e "\n"
installpkg ./slackpkg+-1.7.10-noarch-1mt.txz

# Clean up
rm ./sbopkg-0.38.1-noarch-1_wsr.tgz
rm ./slackpkg+-1.7.10-noarch-1mt.txz

# Copy config files here
cp ./config_files/mmap_restriction_override.conf /etc/sysctl.d/mmap_restriction_override.conf
cp ./config_files/cpufreq /etc/default/cpufreq
cp ./config_files/rc.cpufreq /etc/rc.d/rc.cpufreq
cp ./config_files/slackpkgplus.conf /etc/slackpkg/slackpkgplus.conf
cp ./config_files/limits.conf /etc/security/limits.conf
cp ./config_files/40-timer-permissions.rules /etc/udev/rules.d/40-timer-permissions.rules
cp ./config_files/daw.conf /etc/sysctl.d/daw.conf

exit 0
