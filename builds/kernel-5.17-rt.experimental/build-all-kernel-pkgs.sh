#!/bin/sh

# Copyright 2018, 2021  Patrick J. Volkerding, Sebeka, Minnesota, USA
# Copyright 2022, changes by Martin Bångens, Sweden
# Copied from slackware64-15.0/source/k/ 2022-03-18
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# This script uses the SlackBuild scripts present here to build a
# complete set of kernel packages for the currently running architecture.
# It needs to be run once on 64-bit (uname -m = x86_64) and once on IA32
# (uname -m = i586 or i686).

cd $(dirname $0) ; CWD=$(pwd)

BUILD=${BUILD:-1}
if [ -z "$VERSION" ]; then
  # Get the filename of the newest kernel tarball:
  KERNEL_SOURCE_FILE="$(/bin/ls -t linux-*.tar.?z | head -n 1 )"
  if echo $KERNEL_SOURCE_FILE | grep -q rc ; then # need to get rc versions a bit differently
    VERSION=$(/bin/ls -t linux-*.tar.?z | head -n 1 | rev | cut -f 3- -d . | cut -f 1,2 -d - | rev)
  else # normal release version
    VERSION=$(/bin/ls -t linux-*.tar.?z | head -n 1 | rev | cut -f 3- -d . | cut -f 1 -d - | rev)
  fi
fi
_RT=-$(/bin/ls patch-$VERSION-*.patch.xz | head -n 1 | rev | cut -f 3- -d . | cut -f 1 -d - | rev)
TMP=${TMP:-/tmp}

# By default, don't install the packages as we build them and don't update the initrd.
INSTALL_PACKAGES=${INSTALL_PACKAGES:-NO}

# Clean kernels before building them. Not doing so quit working some time
# after 4.19.x.
export KERNEL_CLEAN=YES

# A list of recipes for build may be passed in the $RECIPES variable, otherwise
# we have defaults based on uname -m:
if [ -z "$RECIPES" ]; then
  if uname -m | grep -wq x86_64 ; then
    RECIPES="x86_64"
  else
    echo "Error: no build recipes available for $(uname -m)"
    exit 1
  fi
fi

# Start main build, only one recipe chef:


    # Recipe for x86_64:
    CONFIG_SUFFIX=".x64"
    unset LOCALVERSION
    OUTPUT=${OUTPUT:-${TMP}/output-x86_64-${VERSION}$_RT}


  echo
  echo "*************************************************"
  echo "* Building kernel pkgs"
  echo "*************************************************"
  echo

  # Build kernel-source package:
  KERNEL_SOURCE_PACKAGE_NAME=$(PRINT_PACKAGE_NAME=YES KERNEL_CONFIG="config-generic-rt${LOCALVERSION}-${VERSION}$_RT${LOCALVERSION}${CONFIG_SUFFIX}" VERSION=$VERSION BUILD=$BUILD ./kernel-source.SlackBuild)
  KERNEL_CONFIG="config-generic-rt${LOCALVERSION}-${VERSION}$_RT${LOCALVERSION}${CONFIG_SUFFIX}" VERSION=$VERSION BUILD=$BUILD ./kernel-source.SlackBuild
  mkdir -p $OUTPUT
  mv ${TMP}/${KERNEL_SOURCE_PACKAGE_NAME} $OUTPUT || exit 1
  if [ "${INSTALL_PACKAGES}" = "YES" ]; then
    installpkg ${OUTPUT}/${KERNEL_SOURCE_PACKAGE_NAME} || exit 1
  fi



  # Build kernel-generic package:
  KERNEL_GENERIC_PACKAGE_NAME=$(PRINT_PACKAGE_NAME=YES KERNEL_NAME=generic-rt KERNEL_SOURCE=$TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT KERNEL_CONFIG=./kernel-configs/config-generic-rt${LOCALVERSION}-${VERSION}$_RT${LOCALVERSION}${CONFIG_SUFFIX} CONFIG_SUFFIX=${CONFIG_SUFFIX} KERNEL_OUTPUT_DIRECTORY=$OUTPUT/kernels/generic-rt$(echo ${LOCALVERSION} | tr -d -).s BUILD=$BUILD ./kernel-generic-rt.SlackBuild)
  KERNEL_NAME=generic-rt KERNEL_SOURCE=$TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT KERNEL_CONFIG=./kernel-configs/config-generic-rt${LOCALVERSION}-${VERSION}$_RT${LOCALVERSION}${CONFIG_SUFFIX} CONFIG_SUFFIX=${CONFIG_SUFFIX} KERNEL_OUTPUT_DIRECTORY=$OUTPUT/kernels/generic-rt$(echo ${LOCALVERSION} | tr -d -).s BUILD=$BUILD ./kernel-generic-rt.SlackBuild
  if [[ -r ${TMP}/${KERNEL_GENERIC_PACKAGE_NAME} ]]; then
    mv ${TMP}/${KERNEL_GENERIC_PACKAGE_NAME} $OUTPUT
  else
    echo "kernel-generic build failed."
    exit 1
  fi
  if [ "${INSTALL_PACKAGES}" = "YES" ]; then
    installpkg ${OUTPUT}/${KERNEL_GENERIC_PACKAGE_NAME} || exit 1
  fi

  # Build kernel-modules (for the just built generic kernel, but most of them
  # will also work with the huge kernel):
  KERNEL_MODULES_PACKAGE_NAME=$(PRINT_PACKAGE_NAME=YES KERNEL_SOURCE=$TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT KERNEL_CONFIG=$TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT/.config BUILD=$BUILD ./kernel-modules.SlackBuild)
  KERNEL_SOURCE=$TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT KERNEL_CONFIG=$TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT/.config BUILD=$BUILD ./kernel-modules.SlackBuild
  if [ -r ${TMP}/${KERNEL_MODULES_PACKAGE_NAME} ]; then
    mv ${TMP}/${KERNEL_MODULES_PACKAGE_NAME} $OUTPUT
  else
    echo "kernel-modules build failed."
    exit 1
  fi
  if [ "${INSTALL_PACKAGES}" = "YES" ]; then
    installpkg ${OUTPUT}/${KERNEL_MODULES_PACKAGE_NAME} || exit 1
  fi

  # Build kernel-headers:
  KERNEL_HEADERS_PACKAGE_NAME=$(PRINT_PACKAGE_NAME=YES KERNEL_SOURCE=$TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT BUILD=$BUILD ./kernel-headers.SlackBuild)
  KERNEL_SOURCE=$TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT BUILD=$BUILD ./kernel-headers.SlackBuild
  if [ -r ${TMP}/${KERNEL_HEADERS_PACKAGE_NAME} ]; then
    mv ${TMP}/${KERNEL_HEADERS_PACKAGE_NAME} $OUTPUT
  else
    echo "kernel-headers build failed."
    exit 1
  fi
  if [ "${INSTALL_PACKAGES}" = "YES" ]; then
    upgradepkg --reinstall --install-new ${OUTPUT}/${KERNEL_HEADERS_PACKAGE_NAME} || exit 1
  fi

  # Update initrd:
  if [ "${INSTALL_PACKAGES}" = "YES" ]; then
    INITRD_VERSION="$(grep "Kernel Configuration" $TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT/.config | cut -f 3 -d ' ')"
    INITRD_LOCALVERSION="$(cat $TMP/package-kernel-source/usr/src/linux-${VERSION}$_RT/.config 2> /dev/null | grep CONFIG_LOCALVERSION= | cut -f 2 -d = | tr -d \")"
    if [ -r /etc/mkinitrd.conf ]; then
      mkinitrd -F /etc/mkinitrd.conf -k ${INITRD_VERSION}${INITRD_LOCALVERSION}
    else # try this?
      sh /usr/share/mkinitrd/mkinitrd_command_generator.sh -k ${INITRD_VERSION}${INITRD_LOCALVERSION} | sed "s/-c -k/-k/g" | bash
    fi
  fi

  echo
  echo "Kernel packages done! Path:$OUTPUT"
  echo

