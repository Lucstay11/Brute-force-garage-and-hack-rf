echo "INSTALLING START ..."
sudo apt-get update
git clone https://github.com/markondej/fm_transmitter
cd fm_transmitter
make
cd ..
mv fm_transmitter .fm_transmitter
sudo apt-get install make build-essential
sudo apt-get install libraspberrypi-dev
sudo apt install toilet -y
sudo apt install lolcat -y
sudo apt install whiptail -y
sudo apt install php -y
sudo apt install rtl-sdr -y
sudo apt-get install rtl-433 -y
sudo chmod +x piopera sendiq
echo "INSTALLING FINISH!! --> bash rf.sh"
