#!/bin/bash
SRCDIR=$(cd $(dirname $0); pwd)

#TODO md5sum
# use this insted https://slackbuilds.org/templates/template.info

cd $SRCDIR/builds/carla/
wget https://github.com/falkTX/Carla/archive/refs/tags/v2.4.3.tar.gz
mv v2.4.3.tar.gz carla-2.4.3.tar.gz

cd $SRCDIR/builds/kernel-5.17-rt
wget https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.17/patch-5.17.1-rt17.patch.xz
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.17.1.tar.xz
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0101-ZEN_Add_sysctl_and_CONFIG_to_disallow_unprivileged_CLONE_NEWUSER.patch
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0103-Revert-swiotlb-rework-fix_info_leak_with_DMA_FROM_DEVICE.patch
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0301-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0302-revert-fbcon-remove-no-op-fbcon_set_origin.patch
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0303-revert-fbcon-remove-soft-scrollback-code.patch

cd $SRCDIR/builds/kernel-5.15-rt-xanmod1
wget https://github.com/xanmod/linux/archive/5.15.43-rt45-xanmod1.tar.gz
mv 5.15.43-rt45-xanmod1.tar.gz linux-5.15.43-rt45-xanmod1.tar.gz

cd $SRCDIR/builds/wine-tkg-6.17
wget https://github.com/Frogging-Family/wine-tkg-git/archive/refs/tags/6.17.r0.g5f19a815.tar.gz
mv 6.17.r0.g5f19a815.tar.gz wine-tkg-git-6.17.r0.g5f19a815.tar.gz

cd $SRCDIR/builds/wine-tkg-7.6
wget https://github.com/Frogging-Family/wine-tkg-git/archive/refs/tags/7.6.r12.g51472395.tar.gz
mv 7.6.r12.g51472395.tar.gz wine-tkg-git-7.6.r12.g51472395.tar.gz

cd $SRCDIR/builds/yabridge
git clone https://github.com/robbert-vdh/yabridge
cd ./yabridge
git checkout 65cf9cd78287a51d792a3b611ae6d6559ea95d76
rm -fr .git/logs/*
cd ../
mv yabridge yabridge-4.0
tar -czvf yabridge-4.0.tar.gz yabridge-4.0
rm -fr yabridge-4.0

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
