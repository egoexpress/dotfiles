openvpn-init() {
  CONFIGFILE="$1"

  sudo echo 'AUTOSTART="all"' >> /etc/default/openvpn
  sudo apt install -y openvpn
  sudo cp ${CONFIGFILE} /etc/openvpn/client.conf
  sudo systemctl enable openvpn@client.service
  sudo systemctl daemon-reload 
  sudo service openvpn@client start
}
