cd
apt update >/dev/null;apt -y install net-tools curl wget screen >/dev/null
sleep 2
curl -fsSL https://code-server.dev/install.sh | sh
sleep 2
cat ~/.config/code-server/config.yaml
sleep 2
curl api.ipify.org
sleep 2

code-server --port 6060 &

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

wget -q https://github.com/fatedier/frp/releases/download/v0.48.0/frp_0.48.0_linux_amd64.tar.gz
tar -xvf frp_0.48.0_linux_amd64.tar.gz
# start from daemon
cp frp_0.48.0_linux_amd64/frpc /usr/bin
mkdir /etc/frp
mkdir /var/frp  # log

sleep 2

cat > /etc/frp/frpc.ini <<END
[common]
server_addr = emergencyaccess.teatspray.fun
server_port = 7000

[vscode.amkelanimbaxulivalo]
type = tcp
local_ip = 127.0.0.1
local_port = 6060
remote_port = 16060
subdomain = amkelanimbaxulivalo

END

sleep 2

#amkelanimbaxulivalo.emergencyaccess.teatspray.fun

/usr/bin/frpc -c /etc/frp/frpc.ini
