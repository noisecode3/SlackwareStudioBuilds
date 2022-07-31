#!/bin/bash
SRCDIR=$(cd $(dirname $0); pwd)

cd $SRCDIR/builds/wine-tkg-7.6
wget https://github.com/Frogging-Family/wine-tkg-git/archive/refs/tags/7.6.r12.g51472395.tar.gz
mv 7.6.r12.g51472395.tar.gz wine-tkg-git-7.6.r12.g51472395.tar.gz

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
