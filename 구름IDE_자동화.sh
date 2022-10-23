useradd nai_webui
mkdir /home/nai_webui
chown nai_webui:nai_webui /home/nai_webui
echo "nai_webui ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "nai_webui:nai_webui" | chpasswd
apt install software-properties-common -y
add-apt-repository ppa:deadsnakes/ppa -y
apt install python3.10 -y
update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 
update-alternatives --set python $(update-alternatives --list python | grep python3.10)
apt install python3.10-venv
apt-get install libgl1
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git 
chown -R nai_webui stable-diffusion-webui/
chmod -R 777 stable-diffusion-webui/ 
cd stable-diffusion-webui 
rm -rf venv
su nai_webui
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-version.txt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1kqtFtPiZayr1bmOgylxhJot-r69Y26to' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1kqtFtPiZayr1bmOgylxhJot-r69Y26to" -O xformers_compiled.whl && rm -rf /tmp/cookies.txt
pip install xformers_compiled.whl
sed -e '/export COMMANDLINE_ARGS=""/ c\export COMMANDLINE_ARGS="--share --deepdanbooru  --xformers"' webui-user.sh > webui-user.sh.tmp
mv webui-user.sh.tmp webui-user.sh
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1iEtxzO_PLq2HmXGt_MWIIoRoYr3kRRKM' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1iEtxzO_PLq2HmXGt_MWIIoRoYr3kRRKM" -O models/Stable-diffusion/animefull-final-pruned.ckpt && rm -rf /tmp/cookies.txt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1x5RXXVYq0om582IxxY68cRsAKgyUz58K' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1x5RXXVYq0om582IxxY68cRsAKgyUz58K" -O models/Stable-diffusion/animefull-final-pruned.yaml && rm -rf /tmp/cookies.txt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ChioiMG8tEalp6oIGvfrF9zISW0UeATK' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1ChioiMG8tEalp6oIGvfrF9zISW0UeATK" -O models/Stable-diffusion/animesfw-final-pruned.ckpt && rm -rf /tmp/cookies.txt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1UITvvGI17f9ZEbSn3r5GKsK_uS0hzl7N' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1UITvvGI17f9ZEbSn3r5GKsK_uS0hzl7N" -O models/Stable-diffusion/animesfw-final-pruned.yaml && rm -rf /tmp/cookies.txt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1BYOPtE79iSL1_HyiCEB7amqqrN8INNur' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1BYOPtE79iSL1_HyiCEB7amqqrN8INNur" -O models/Stable-diffusion/animesfw-final-pruned.vae.pt && rm -rf /tmp/cookies.txt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1BYOPtE79iSL1_HyiCEB7amqqrN8INNur' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1BYOPtE79iSL1_HyiCEB7amqqrN8INNur" -O models/Stable-diffusion/animefull-final-pruned.vae.pt && rm -rf /tmp/cookies.txt
bash webui.sh
