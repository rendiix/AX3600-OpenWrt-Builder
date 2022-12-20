#!/bin/bash

sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

#git clone https://github.com/gSpotx2f/luci-app-temp-status.git package/luci-app-temp-status

#git clone https://github.com/kiddin9/openwrt-packages.git package/openwrt-packages

#svn export --force https://github.com/shidahuilang/openwrt-package/branches/master/openwrt_oscam package/openwrt-packages/openwrt_oscam

shopt -s extglob
rm -R -f package/openwrt-packages/!("luci-app-cpufreq"|"luci-app-argon-config"|"luci-app-openvpn-server"|"luci-app-zerotier"|"luci-theme-argon"|"luci-app-easymesh")

sed -i '$a  \
CONFIG_CPU_FREQ_GOV_POWERSAVE=y \
CONFIG_CPU_FREQ_GOV_USERSPACE=y \
CONFIG_CPU_FREQ_GOV_ONDEMAND=y \
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y \
' target/linux/ipq807x/config-5.15

mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/xxx_config << EOF
uci set system.@system[0].hostname='OpenWrt_AX3600'
uci set system.@system[0].description='Xiaomi AX3600 With OpenWrt'
uci set system.@system[0].zonename='Asia/Jakarta'
uci set system.@system[0].timezone='WIB-7'
uci commit
EOF
