#!/bin/bash

#sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

#sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

#git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

#enable wifi
sed -i 's/.disabled=1/.disabled=0/;s/.ssid=OpenWrt/.ssid=OpenWrt_AX3600/' package/kernel/mac80211/files/lib/wifi/mac80211.sh

mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/xxx_config << EOF
uci set system.@system[0].hostname='OpenWrt_AX3600'
uci set system.@system[0].description='Xiaomi AX3600 With OpenWrt'
uci set system.@system[0].zonename='Asia/Jakarta'
uci set system.@system[0].timezone='WIB-7'
uci commit
EOF
