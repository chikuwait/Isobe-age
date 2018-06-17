# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
 config.vm.box = "bento/ubuntu-16.04"
 config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 2
    vb.memory = '4096'
 end
 config.vm.provision 'shell', inline: <<-SHELL
        git clone https://github.com/chikuwait/Isobe-age.git
        chmod 755 /home/vagrant/Isobe-age
 SHELL
end
