#!/bin/sh

# Copyright 2022  Martin Bångens, Sweden
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


# This script will simply get a specific releases of all latest components
# 24 October 2022


cd $(dirname $0) ; CWD=$(pwd)
source ./config-versions
echo $VL > VERSION
rm -f *.tar.?z

wget https://github.com/KhronosGroup/glslang/archive/sdk-$VL/glslang-sdk-$VL.tar.gz || exit 1
wget https://github.com/KhronosGroup/SPIRV-Headers/archive/sdk-$VL/SPIRV-Headers-sdk-$VL.tar.gz || exit 1
wget https://github.com/KhronosGroup/SPIRV-Tools/archive/sdk-$VL/SPIRV-Tools-sdk-$VL.tar.gz || exit 1
wget https://github.com/KhronosGroup/Vulkan-Headers/archive/sdk-$VL/Vulkan-Headers-sdk-$VL.tar.gz || exit 1
wget https://github.com/KhronosGroup/Vulkan-Loader/archive/sdk-$VL/Vulkan-Loader-sdk-$VL.tar.gz || exit 1
wget https://github.com/KhronosGroup/Vulkan-ValidationLayers/archive/sdk-$VL/Vulkan-ValidationLayers-sdk-$VL.tar.gz || exit 1
wget https://github.com/martinus/robin-hood-hashing/archive/$RHH/robin-hood-hashing-$RHH.tar.gz || exit 1
wget https://github.com/KhronosGroup/Vulkan-ExtensionLayer/archive/sdk-$VL/Vulkan-ExtensionLayer-sdk-$VL.tar.gz || exit 1
wget https://github.com/KhronosGroup/Vulkan-Tools/archive/sdk-$VL/Vulkan-Tools-sdk-$VL.tar.gz || exit 1
wget https://github.com/LunarG/VulkanTools/archive/sdk-$VL/VulkanTools-sdk-$VL.tar.gz || exit 1
wget https://github.com/google/shaderc/archive/v$SC/shaderc-$SC.tar.gz || exit 1
wget https://github.com/KhronosGroup/SPIRV-Cross/archive/sdk-$VL/SPIRV-Cross-sdk-$VL.tar.gz || exit 1
wget https://github.com/LunarG/gfxreconstruct/archive/sdk-$VL/gfxreconstruct-sdk-$VL.tar.gz || exit 1
wget https://github.com/microsoft/DirectXShaderCompiler/archive/v$DXSC/DirectXShaderCompiler-$DXSC.tar.gz || exit 1
wget https://github.com/KhronosGroup/SPIRV-Reflect/archive/sdk-$VL/SPIRV-Reflect-sdk-$VL.tar.gz || exit 1
wget https://github.com/KhronosGroup/Vulkan-Profiles/archive/sdk-$VL/Vulkan-Profiles-sdk-$VL.tar.gz || exit 1
wget https://github.com/open-source-parsers/jsoncpp/archive/$JC/jsoncpp.tar.gz || exit 1

tar xf jsoncpp.tar.gz
mv jsoncpp-* jsoncpp
rm jsoncpp.tar.gz
tar czf jsoncpp.tar.gz jsoncpp
rm -fr jsoncpp

echo "All was downloaded"
