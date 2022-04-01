#!/bin/bash
SRCDIR=$(cd $(dirname $0); pwd)

#TODO md5sum
# use this insted https://slackbuilds.org/templates/template.info

cd $SRCDIR/builds/carla/
wget https://github.com/falkTX/Carla/archive/refs/tags/v2.4.2.tar.gz
mv v2.4.2.tar.gz carla-2.4.2.tar.gz

cd $SRCDIR/builds/kernel-5.17-rt
wget https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.17/patch-5.17.1-rt16.patch.xz
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.17.1.tar.xz

cd $SRCDIR/builds/kernel-5.15-rt-xanmod1
wget https://github.com/xanmod/linux/archive/5.15.31-rt38-xanmod1.tar.gz
mv 5.15.31-rt38-xanmod1.tar.gz linux-5.15.31-rt38-xanmod1.tar.gz

cd $SRCDIR/builds/wine-tkg-6.17
wget https://github.com/Frogging-Family/wine-tkg-git/archive/refs/tags/6.17.r0.g5f19a815.tar.gz
mv 6.17.r0.g5f19a815.tar.gz wine-tkg-git-6.17.r0.g5f19a815.tar.gz

cd $SRCDIR/builds/yabridge
git clone https://github.com/robbert-vdh/yabridge
cd ./yabridge
git checkout 8b78b9283449ad8051e7dfca8921d2d178f2538e
rm -fr .git/logs/*
cd ../
mv yabridge yabridge-3.8.1
tar -czvf yabridge-3.8.1.tar.gz yabridge-3.8.1
rm -fr yabridge-3.8.1

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
