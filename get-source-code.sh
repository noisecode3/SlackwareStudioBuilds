#!/bin/bash
SRCDIR=$(cd $(dirname $0); pwd)

#TODO md5sum

cd $SRCDIR/builds/carla/
wget https://github.com/falkTX/Carla/archive/refs/tags/v2.4.2.tar.gz
mv v2.4.2.tar.gz carla-2.4.2.tar.gz

cd $SRCDIR/builds/kernel-5.17-rt.x86_64
wget https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.17/patch-5.17-rt15.patch.xz
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.17.tar.xz

cd $SRCDIR/wine-tkg-6.17
wget https://github.com/Frogging-Family/wine-tkg-git/archive/refs/tags/6.17.r0.g5f19a815.tar.gz

cd $SRCDIR/yabridge
wget https://github.com/robbert-vdh/yabridge/archive/refs/tags/3.8.1.tar.gz

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
