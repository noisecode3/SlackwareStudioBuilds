#!/bin/bash
SRCDIR=$(cd $(dirname $0); pwd)

cd $SRCDIR
wget https://github.com/Frogging-Family/wine-tkg-git/archive/refs/tags/6.17.r0.g5f19a815.tar.gz
mv 6.17.r0.g5f19a815.tar.gz wine-tkg-git-6.17.r0.g5f19a815.tar.gz

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
