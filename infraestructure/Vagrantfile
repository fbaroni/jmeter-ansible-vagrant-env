# -*- mode: ruby -*-
# vi: set ft=ruby :

database_ip = "192.168.35.40"
loadbalancer_ip = "192.168.35.30"
loadbalancer_port = 8042
external_host = "190.114.204.125"

Vagrant.configure("2") do |config|

    config.vm.box = "bento/ubuntu-16.04"

    config.vm.define :db do |db_config|
        db_config.vm.hostname = "dba"
        db_config.vm.network :private_network, :ip => database_ip
        db_config.vm.synced_folder "www/", "/var/www/html"

        db_config.vm.provision "ansible" do |ansible|
          ansible.playbook = "provision/db/playbook.yml"
        end

        db_config.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
        end
    end

    config.vm.define :loadbalancer do |loadbalancer|
           loadbalancer.vm.provider :virtualbox do |v|
               v.name = "loadbalancer"
               v.customize [
                   "modifyvm", :id,
                   "--name", "loadbalancer",
                   "--memory", 1024,
                   "--natdnshostresolver1", "on",
                   "--cpus", 1,
               ]
           end

           loadbalancer.vm.box = "bento/ubuntu-16.04"
           loadbalancer.vm.network :private_network, ip: loadbalancer_ip
           loadbalancer.ssh.forward_agent = true
           loadbalancer.vm.synced_folder "./", "/vagrant"
           loadbalancer.vm.network "forwarded_port", guest: 80, host: loadbalancer_port

           loadbalancer.vm.provision "ansible" do |ansible|
                ansible.playbook = "provision/loadbalancer/playbook.yml"
           end
    end

    (1..3).each do |i|
      config.vm.define "web#{i}" do |web_config|

          web_config.vm.hostname = "web#{i}"
          web_config.vm.network :private_network, :ip => "192.168.35.1#{i}"
          web_config.vm.network "forwarded_port", guest: 80, host: "809#{i}"

          web_config.vm.provision "ansible" do |ansible|
            ansible.playbook = "provision/web/playbook.yml"
            ansible.extra_vars = {
               vagrant_db_ip: database_ip,
               vagrant_host: external_host + ":809#{i}",
           }
         end

          web_config.vm.provider "virtualbox" do |vb|
              vb.memory = "768"
          end
      end
    end
end
