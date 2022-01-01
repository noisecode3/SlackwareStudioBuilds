#!/bin/bash

#   Slackware Studio
#   Copyright (C) 2022  Martin Bångens
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.

#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.

echo "heloo balloo"

wget https://github.com/sbopkg/sbopkg/releases/download/0.38.1/sbopkg-0.38.1-noarch-1_wsr.tgz
wget https://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-1.7.10-noarch-1mt.txz

# check md5 for pkgs
# 42e40c32a7aed4c417f1ee852c51c6d0  sbopkg-0.38.1-noarch-1_wsr.tgz
# d80f1d97fa3a2d8abb4cda72664f03c7  slackpkg+-1.7.10-noarch-1mt.txz

# install and move configuration files
