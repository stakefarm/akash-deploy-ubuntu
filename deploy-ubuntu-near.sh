#!/bin/bash
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
runsvdir -P /etc/service &
nodepid=0
t=1
sleep 5

apt update && apt upgrade -y
apt install sudo nano -y
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  
sudo apt install build-essential nodejs -y
PATH="$PATH"
node -v
npm -v
sudo npm install -g near-cli
export NEAR_ENV=shardnet
echo 'export NEAR_ENV=testdnet' >> ~/.bashrc
near proposals

echo  ===================near установлен ===================

sleep 10
sudo apt install -y git binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev cmake gcc g++ python docker.io protobuf-compiler libssl-dev pkg-config clang llvm cargo
sudo apt install python3-pip -y
USER_BASE_BIN=$(python3 -m site --user-base)/bin
export PATH="$USER_BASE_BIN:$PATH"
sudo apt install clang build-essential make -y
curl "https://sh.rustup.rs" -sSf | sh -s -- -y
source $HOME/.cargo/env
rustup update stable
source $HOME/.cargo/env
sleep 20
cd /root/
git clone "https://github.com/near/nearcore"
sleep 5
cd nearcore
git fetch
git checkout 088a149c3f2708af64b0053e3d03df1dfee00e7e
echo  ================= Начинаю сборку ==================
echo  =================== Start build ===================
sleep 5
make neard
cp /root/nearcore/target/release/neard /root/.near
cd /root/
echo  =================== Завершена сборка ====================
echo  =================== Build s completed ===================
cd ~/.near
neard --home ~/.near init --chain-id testnet --download-genesis
ls /root/ -a 
ls /root/.near -a 
ls / -a 
echo  ======================= nearcore установлен =====================
echo  =================== install nearcore complete ===================
sleep 10
cd .near
rm config.json
wget -O ~/.near/config.json https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/testnet/config.json
sleep 5
sudo apt-get install awscli -y
pwd
sleep 10
cd /root/.near/
rm /root/.near/genesis.json
wget https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/genesis.json
sleep 10
cd /root/.near/
pip3 install awscli --upgrade
echo все ОК
sleep 20

done
