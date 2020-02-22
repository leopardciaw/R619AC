#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: leopard
# Blog: https://p3terx.com
#=================================================
# Modify default IP@sed '1,3s/my/your/g
sed -i 's/192.168.1.1/192.168.6.1/g' openwrt/package/base-files/files/bin/config_generate
#sed -i '611s/15744/32448/' target/linux/ramips/image/mt7621
rm -rf openwrt/target/linux/ramips/image/mt7621.mk
rm -rf openwrt/target/linux/ramips/dts/mt7621_phicomm_k2p.dts
cp -rf ./backk2p.d/mt7621.mk openwrt/target/linux/ramips/image/
cp -rf ./backk2p.d/mt7621_phicomm_k2p.dts openwrt/target/linux/ramips/dts/
# 删除原主题包
rm -rf package/lean/luci-theme-argon
# rm -rf openwrt/package/lean/luci-theme-netgear
# 添加新的包
# git clone https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# git clone https://github.com/sypopo/luci-theme-atmaterial.git package/lean/luci-theme-atmaterial
git clone https://github.com/sypopo/luci-theme-argon-mc.git package/lean/luci-theme-argon-mc
# 取消bootstrap为默认主题
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#增加koolddns
git clone https://github.com/xrouterservice/luci-app-koolddns.git openwrt/package/lean/luci-app-koolddns
