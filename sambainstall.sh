#!/bin/bash

sudo apt -y install samba samba-common-bin smbclient
sudo systemctl start smbd
sudo ufw allow 'samba'
sudo smbpasswd -a rahul << EOF
rahul
rahul
EOF

cd /etc/samba/
cat << EOF | sudo tee -a smb.conf
[home_jetson_nano]
path = /home/rahul
guest ok = no
guest only = no
read only = no
browseable = yes
writeable = yes
inherit acls = yes
inherit permissions = yes
ea support = yes
store dos attributes = yes
vfs objects =
printable = no
create mask = 0664
force create mode = 0664
directory mask = 0775
force directory mode = 0775
hide special files = yes
follow symlinks = yes
hide dot files = no
valid users = "rahul"
force user = "rahul"
#invalid users = "guest"
read list =
write list = "rahul"
EOF
ip a