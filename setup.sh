#!/bin/bash

sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/xxx_config << EOF
uci set wireless.radio1.band='5g'
uci set wireless.radio1.channel='auto'
uci set wireless.radio1.country='ID'
uci set wireless.radio1.disabled='0'
uci set wireless.radio1.distance='30'
uci set wireless.radio1.htmode='HE80'
uci set wireless.radio1.txpower='30'
uci set wireless.radio1=wifi-device
uci set wireless.default_radio1=wifi-iface
uci set wireless.default_radio1.device='radio1'
uci set wireless.default_radio1.network='lan'
uci set wireless.default_radio1.mode='ap'
uci set wireless.default_radio1.ssid='OpenWrt 5Ghz'
uci set wireless.default_radio1.encryption='psk2'
uci set wireless.default_radio1.key='20HAA0BL1BJ'
uci set wireless.radio2.band='2g'
uci set wireless.radio2.channel='auto'
uci set wireless.radio2.country='ID'
uci set wireless.radio2.disabled='0'
uci set wireless.radio2.distance='150'
uci set wireless.radio2.htmode='HE20'
uci set wireless.radio2.txpower='30'
uci set wireless.radio2=wifi-device
uci set wireless.default_radio2=wifi-iface
uci set wireless.default_radio2.device='radio2'
uci set wireless.default_radio2.network='lan'
uci set wireless.default_radio2.mode='ap'
uci set wireless.default_radio2.ssid='OpenWrt 2.4Ghz'
uci set wireless.default_radio2.encryption='psk2'
uci set wireless.default_radio2.key='20HAA0BL1BJ'
uci set system.@system[0].hostname='OpenWrt_AX3600'
uci set system.@system[0].description='Xiaomi AX3600 With OpenWrt'
uci set system.@system[0].zonename='Asia/Jakarta'
uci set system.@system[0].timezone='WIB-7'
uci commit
EOF
