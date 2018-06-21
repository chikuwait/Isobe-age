APACHE_DIR ="/etc/apache2"
execute "apt -y install apache2" do
  user "root"
end

remote_file "#{APACHE_DIR}/ports.patch" do
  source "../file/ports.patch"
end
remote_file "#{APACHE_DIR}/envvars.patch" do
  source "../file/envvars.patch"
end
remote_file "#{APACHE_DIR}/apacheconf.patch" do
  source "../file/apacheconf.patch"
  user "root"
end
remote_file "/home/vagrant/dump.rb" do
  source "../file/dump.rb"
  user "vagrant"
end


execute "patch -u --ignore-whitespace < ports.patch" do
  cwd APACHE_DIR
  user "root"
end
execute "patch -u --ignore-whitespace < envvars.patch" do
  cwd APACHE_DIR
  user "root"
end
execute "patch -u --ignore-whitespace < apacheconf.patch" do
  cwd APACHE_DIR
  user "root"
end
execute "mkdir /home/vagrant/var/"do
  user "vagrant"
end
execute "mkdir /home/vagrant/var/lock" do
  user "vagrant"
end
execute "mkdir /home/vagrant/var/lock/apache2"do
  user "vagrant"
end
execute "mkdir /home/vagrant/var/log"do
  user "vagrant"
end
execute "mkdir /home/vagrant/var/log/apache2"do
  user "vagrant"
end
execute "mkdir /home/vagrant/var/run"do
  user "vagrant"
end
execute "mkdir /home/vagrant/var/run/apache2"do
  user "vagrant"
end
execute "usermod -aG www-data vagrant"do
  user "root"
end
