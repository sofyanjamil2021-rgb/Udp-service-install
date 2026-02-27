#!/bin/bash
apt update -y
apt upgrade -y

rm -rf /root/udp
mkdir -p /root/udp

echo "Downloading UDP binary..."
wget "https://raw.githubusercontent.com/sofyanjamil2021-rgb/Udp-service-install/main/udp-custom-linux-amd64" -O /root/udp/udp-custom
chmod +x /root/udp/udp-custom

wget "https://raw.githubusercontent.com/sofyanjamil2021-rgb/Udp-service-install/main/config.json" -O /root/udp/config.json
chmod 644 /root/udp/config.json

cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom Service
After=network.target

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable udp-custom
systemctl start udp-custom

echo "UDP Installed Successfully"else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team and modify by sslablk

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

clear
echo '    Install Custom UDP Manager   ' | lolcat

echo ''
echo ''
echo ''
sleep 5
cd $HOME
mkdir /etc/Sslablk
cd /etc/Sslablk
wget https://raw.githubusercontent.com/sofyanjamil2021-rgb/Udp-service-install/main/system.zip
unzip system
cd /etc/Sslablk/system
mv menu /usr/local/bin/menu-udp
cd /etc/Sslablk/system
chmod +x ChangeUser.sh
chmod +x Adduser.sh
chmod +x DelUser.sh
chmod +x Userlist.sh
chmod +x RemoveScript.sh
chmod +x torrent.sh
cd /usr/local/bin
chmod +x /usr/local/bin/menu-udp
cd /etc/Sslablk
rm system.zip


clear
echo 'UDP Install Script By Project SSLAB LK Dev.Team'
echo 'UDP Custom By ePro Dev. Team'
echo ''
echo ''
echo ' Support US'
echo "Github/noobconner21"
echo "Telegram/SSLAB LK"
sleep 5

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo reboot
reboot
