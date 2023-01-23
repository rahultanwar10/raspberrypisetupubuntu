sudo apt update
sudo apt -y upgrade
sudo apt -y install openssh-server
#sudo systemctl status ssh
sudo ufw allow ssh
# To stop using ssh
#sudo systemctl stop ssh
#sudo systemctl disable ssh
#sudo apt -y remove openssh-server