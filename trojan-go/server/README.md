# Trojan Server Configuration

## BBR
### Prerequistion
- Linux kernel >= 4.9
  - debian 9+
  - CentOS 8+
  - Ubuntu 20.04+

### Quick Start
Enable
```sh
echo 'net.core.default_qdisc=fq' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control=bbr' | sudo tee -a /etc/sysctl.conf
sysctl -p
```
Check
```sh
sysctl net.ipv4.tcp_available_congestion_control
# net.ipv4.tcp_available_congestion_control = bbr cubic reno
lsmod | grep bbr
# should inlcude 'tcp_bbr'
```

### Reference
https://www.linuxtrojan.com/speedup/google-tcp-bbr-one-click-script-for-trojan/