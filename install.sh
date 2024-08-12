echo "INSTALLING START ..."
echo "--------------------"
sudo mkdir .Capture
sudo apt-get update
sudo apt install cmake gcc -y
sudo apt-get install make build-essential -y
sudo apt-get install libraspberrypi-dev -y
sudo apt install toilet -y
sudo apt install lolcat -y
sudo apt install whiptail -y
sudo apt install php -y
sudo apt install rtl-sdr -y
sudo apt-get install rtl-433 -y

sudo chmod +x build/build.sh
cd build;sudo bash build.sh;cd ../../
sudo chmod +x piopera sendiq tune fm_transmitter
sudo chmod +x rf.sh
echo "----------------------------------------"
echo "INSTALLING FINISH!! --> sudo bash rf.sh"
