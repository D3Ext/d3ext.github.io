#!/bin/bash

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
grayColour="\e[0;37m\033[1m"
underline="\033[4m"

if [ "$UID" != "0" ]; then
  echo -e "${blueColour}Debes ejecutar el script como root${endColour}"
  exit 0
fi

if [ ! -f "/etc/debian_version" ]; then
  echo -e "${blueColour}El sistema actual no esta basado en Debian, ejecuta este script en: Ubuntu, Parrot, Kali Linux...${endColour}"
  exit 1
fi

# Requerimientos
reqs=(git wget curl python3 python3-pip aircrack-ng mdk4 reaver pixiewps hostapd xterm hashcat dnsmasq hcxtools iptables build-essential autoconf automake libtool pkg-config libnl-3-dev libnl-genl-3-dev libssl-dev ethtool shtool rfkill zlib1g-dev libpcap-dev libsqlite3-dev libpcre3-dev libhwloc-dev libcmocka-dev wpasupplicant tcpdump screen iw usbutils wireshark tshark python3-scapy python3-pyqt5 python3-numpy python3-scipy)

# Instala los requerimientos
clear; echo -e "${yellowColour} _       ___ _____       ____           __        ____
| |     / (_) __(_)     /  _/___  _____/ /_____ _/ / /
| | /| / / / /_/ /_____ / // __ \/ ___/ __/ __ \`/ / / 
| |/ |/ / / __/ /_____// // / / (__  ) /_/ /_/ / / /  
|__/|__/_/_/ /_/     /___/_/ /_/____/\__/\__,_/_/_/${endColour}"

sleep 0.2
echo -e "${blueColour}\nInstalando paquetes requeridos\n${endColour}"
sleep 0.4

for req in ${reqs[@]}; do
  apt install ${req} -y 2>/dev/null
done

wget https://raw.githubusercontent.com/hashcat/hashcat-utils/master/src/cap2hccapx.c 2>/dev/null
gcc cap2hccapx.c -o /usr/bin/cap2hccapx 2>/dev/null
rm cap2hccapx.c 2>/dev/null

sleep 0.2
echo -e "${blueColour}\nRequerimientos instalados correctamente${endColour}"
sleep 0.3

# Clona drivers y WEF
echo -e "${blueColour}\nClonando drivers, visita la documentacion oficial para terminar de instalarlos en caso de que tu antena no sea reconocida${endColour}"
sleep 0.3

git clone https://github.com/aircrack-ng/rtl8188eus 2>/dev/null
git clone https://github.com/aircrack-ng/rtl8812au 2>/dev/null

echo -e "${blueColour}\nInstalando qspectrumanalyzer${endColour}"

sleep 0.3
git clone https://github.com/xmikos/qspectrumanalyzer.git 2>/dev/null
cd qspectrumanalyzer 2>/dev/null
pip3 install --user . 2>/dev/null
sleep 0.3

echo -e "${blueColour}\nDescargando WEF${endColour}"
sleep 0.3

git clone https://github.com/D3Ext/WEF 2>/dev/null
cd WEF 2>/dev/null
bash setup.sh 2>/dev/null
cd ..

echo -e "${blueColour}\nInstalacion terminada :D${endColour}"
