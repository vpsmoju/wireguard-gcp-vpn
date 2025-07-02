#!/bin/bash

# Atualiza pacotes
apt update && apt upgrade -y

# Instala WireGuard e ferramentas de rede
apt install wireguard iptables-persistent -y

# Gera chaves
umask 077
wg genkey | tee /etc/wireguard/server.key | wg pubkey > /etc/wireguard/server.pub

# Salva o IP do servidor
SERVER_PRIV=$(cat /etc/wireguard/server.key)

# Cria wg0.conf
cat <<EOF > /etc/wireguard/wg0.conf
[Interface]
PrivateKey = $SERVER_PRIV
Address = 10.0.0.1/24
ListenPort = 51820
SaveConfig = true
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE
EOF

# Habilita roteamento IP
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

# Abre porta no firewall (UFW)
ufw allow 51820/udp

# Inicia o serviço
systemctl enable wg-quick@wg0
systemctl start wg-quick@wg0
