#!/bin/bash
cd $(dirname $0) ; CWD=$(pwd)
source ./config-versions
cd version-tags

git clone --branch sdk-$VL https://github.com/KhronosGroup/glslang
cd glslang
git describe > ../glslang-tag 2>&- || git describe --tag > ../glslang-tag
cd ..
rm -fr glslang

git clone --branch sdk-$VL https://github.com/KhronosGroup/SPIRV-Headers
cd SPIRV-Headers
git describe > ../SPIRV-Headers-tag 2>&- || git describe --tag > ../SPIRV-Headers
cd ..
rm -fr SPIRV-Headers

git clone --branch sdk-$VL https://github.com/KhronosGroup/SPIRV-Tools
cd SPIRV-Tools
git describe > ../SPIRV-Tools-tag 2>&- || git describe --tag > ../SPIRV-Tools-tag
cd ..
rm -fr SPIRV-Tools

git clone --branch sdk-$VL https://github.com/KhronosGroup/Vulkan-Headers
cd Vulkan-Headers
git describe > ../Vulkan-Headers-tag 2>&- || git describe --tag > ../Vulkan-Headers-tag
cd ..
rm -fr Vulkan-Headers

git clone --branch sdk-$VL https://github.com/KhronosGroup/Vulkan-Loader
cd Vulkan-Loader
git describe > ../Vulkan-Loader-tag 2>&- || git describe --tag > ../Vulkan-Loader-tag
cd ..
rm -fr Vulkan-Loader

git clone --branch sdk-$VL https://github.com/KhronosGroup/Vulkan-ValidationLayers
cd Vulkan-ValidationLayers
git describe > ../Vulkan-ValidationLayers-tag 2>&- || git describe --tag > ../Vulkan-ValidationLayers-tag
cd ..
rm -fr Vulkan-ValidationLayers

git clone --branch $RHH https://github.com/martinus/robin-hood-hashing
cd robin-hood-hashing
git describe > ../robin-hood-hashing-tag 2>&- || git describe --tag > ../robin-hood-hashing-tag
cd ..
rm -fr robin-hood-hashing

git clone --branch sdk-$VL https://github.com/KhronosGroup/Vulkan-ExtensionLayer
cd Vulkan-ExtensionLayer
git describe > ../Vulkan-ExtensionLayer-tag 2>&- || git describe --tag > ../Vulkan-ExtensionLayer-tag
cd ..
rm -fr Vulkan-ExtensionLayer

git clone --branch sdk-$VL https://github.com/KhronosGroup/Vulkan-Tools
cd Vulkan-Tools
git describe > ../Vulkan-Tools-tag 2>&- || git describe --tag > ../Vulkan-Tools-tag
cd ..
rm -fr Vulkan-Tools

git clone --branch sdk-$VL https://github.com/LunarG/VulkanTools
cd VulkanTools
git describe > ../VulkanTools-tag 2>&- || git describe --tag > ../VulkanTools-tag
cd ..
rm -fr VulkanTools

git clone --branch v$SC https://github.com/google/shaderc
cd shaderc
git describe > ../shaderc-tag 2>&- || git describe --tag > ../shaderc-tag
cd ..
rm -fr shaderc

git clone --branch sdk-$VL https://github.com/KhronosGroup/SPIRV-Cross
cd SPIRV-Cross
git describe > ../SPIRV-Cross-tag 2>&- || git describe --tag > ../SPIRV-Cross-tag
cd ..
rm -fr SPIRV-Cross

git clone --branch sdk-$VL https://github.com/LunarG/gfxreconstruct
cd gfxreconstruct
git describe > ../gfxreconstruct-tag 2>&- || git describe --tag > ../gfxreconstruct-tag
cd ..
rm -fr gfxreconstruct

git clone --branch v$DXSC https://github.com/microsoft/DirectXShaderCompiler
cd DirectXShaderCompiler
git describe > ../DirectXShaderCompiler-tag 2>&- || git describe --tag > ../DirectXShaderCompiler-tag
cd ..
rm -fr DirectXShaderCompiler

git clone --branch sdk-$VL https://github.com/KhronosGroup/SPIRV-Reflect
cd SPIRV-Reflect
git describe > ../SPIRV-Reflect-tag 2>&- || git describe --tag > ../SPIRV-Reflect-tag
cd ..
rm -fr SPIRV-Reflect

git clone --branch sdk-$VL https://github.com/KhronosGroup/Vulkan-Profiles
cd Vulkan-Profiles
git describe > ../Vulkan-Profiles-tag 2>&- || git describe --tag > ../Vulkan-Profiles-tag
cd ..
rm -fr Vulkan-Profiles

