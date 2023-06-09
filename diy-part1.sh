#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

wget https://github.com/vernesong/OpenClash/archive/refs/tags/v0.39.9-beta.tar.gz
tar xvf v0.39.9-beta.tar.gz -C ./package
git clone https://github.com/1wrt/luci-app-ikoolproxy.git ./package/luci-app-ikoolproxy

cp $GITHUB_WORKSPACE/.vermagic ./
cp -f $GITHUB_WORKSPACE/kernel-defaults.mk ./include/
cp -f $GITHUB_WORKSPACE/Makefile ./package/kernel/linux/
cp -f $GITHUB_WORKSPACE/config-5.4 ./target/linux/x86/
