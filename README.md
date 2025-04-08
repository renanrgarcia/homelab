# homelab

# Cancel suspend mode when lid is closed

sudo vim /etc/systemd/logind.conf
Uncomment the line: HandleLidSwitch=suspend, HandleLidSwitchExternalPower=suspend, HandleLidSwitchDocked=ignore

# Add your user to sudoers

su -
usermod -aG sudo <user>
exit

# Install base packages to work

sudo apt install -y git curl ufw unzip vim

# Install OhMyPosh

curl -s https://ohmyposh.dev/install.sh | bash -s
exit

oh-my-posh font install meslo
echo 'eval "$(oh-my-posh init bash --config '\''https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json'\'')"' >> ~/.bashrc
source ~/.bashrc

# Configure the firewall to allow ports

sudo ufw status

## PostgreSQL and MinIO ports

sudo ufw allow 5432 9000 9001
sudo ufw enable

# Install Vagrant

wget https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_i686.deb
sudo dpkg -i vagrant_2.2.19_i686.deb
sudo apt install -f
