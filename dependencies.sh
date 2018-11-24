sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get install git terminator python3 vim htop nano virtualbox virtualbox-ext-pack -y

#Vagrant
wget https://releases.hashicorp.com/vagrant/2.2.1/vagrant_2.2.1_x86_64.deb
sudo dpkg -i vagrant_2.2.1_x86_64.deb

sudo apt-get -f install

vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-proxyconf

#Ansible
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y

sudo apt-get update -y
sudo apt-get dist-upgrade -y

sudo apt-get autoremove
sudo apt-get clean

sudo reboot