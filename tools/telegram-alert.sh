#!/bin/bash

WG_INTERFACE="wg0"
BOT_TOKEN="7859434581:AAH53tXUZKUu_IA4XBG2kZcBGKmzMyg25Jk"
CHAT_ID="@VPNrestartBot"

if ! wg show $WG_INTERFACE > /dev/null 2>&1; then
  MSG="🚨 WireGuard fora do ar! Reiniciando a interface $WG_INTERFACE..."
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $MSG" >> /var/log/wireguard-monitor.log
  curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
       -d chat_id="$CHAT_ID" -d text="$MSG"
  systemctl restart wg-quick@$WG_INTERFACE
fi
