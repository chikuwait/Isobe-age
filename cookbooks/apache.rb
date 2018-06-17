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
execute "patch -u --ignore-whitespace < ports.patch" do
  cwd APACHE_DIR
  user "root"
end
execute "patch -u --ignore-whitespace < envvars.patch" do
  cwd APACHE_DIR
  user "root"
end
execute "mkdir /home/vagrant/var/"
execute "mkdir /home/vagrant/var/lock"
execute "mkdir /home/vagrant/var/lock/apache2"
execute "mkdir /home/vagrant/var/apache2"
execute "mkdir /home/vagrant/var/log"
execute "usermod -aG www-data vagrant"do
  user "root"
end
