#!/bin/bash
SRCDIR=$(cd $(dirname $0); pwd)

cd $SRCDIR
wget https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.17/patch-5.17.1-rt17.patch.xz
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.17.1.tar.xz
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0101-ZEN_Add_sysctl_and_CONFIG_to_disallow_unprivileged_CLONE_NEWUSER.patch
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0103-Revert-swiotlb-rework-fix_info_leak_with_DMA_FROM_DEVICE.patch
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0301-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0302-revert-fbcon-remove-no-op-fbcon_set_origin.patch
wget https://gitlab.manjaro.org/packages/community/realtime-kernels/linux517-rt/-/raw/main/0303-revert-fbcon-remove-soft-scrollback-code.patch

echo ""
echo "Done downloading now you can build!"
echo ""

exit 0
