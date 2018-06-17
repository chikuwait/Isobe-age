CRIU_DIR = "/home/vagrant/criu"
git CRIU_DIR do
  repository "git://github.com/checkpoint-restore/criu.git"
end

remote_file "#{CRIU_DIR}/criu.patch" do
  source "../file/criu.patch"
end
execute "cd /home/vagrant/criu && patch -p1 --ignore-whitespace < criu.patch && make"

execute "cd /home/vagrant/criu && make install" do
  user "root"
end 
execute "cd /home/vagrant/criu/lib/c/ && mv libcriu.so /usr/local/lib/ && ldconfig" do
  user "root"
end
