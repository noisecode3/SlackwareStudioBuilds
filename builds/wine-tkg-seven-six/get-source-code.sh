#!/bin/bash
cd $(dirname $0);

wget https://github.com/Frogging-Family/wine-tkg-git/archive/7.6.r12.g51472395/wine-tkg-git-7.6.r12.g51472395.tar.gz || exit 1

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
