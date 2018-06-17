MRUBY_DIR = "/home/vagrant/mruby"
git MRUBY_DIR do
  repository "git://github.com/mruby/mruby.git"
end
execute "apt -y install bison" do
  user "root"
end
remote_file "#{MRUBY_DIR}/mruby_build.patch" do
  source "../file/mruby_build.patch"
end
execute "cd /home/vagrant/mruby && patch -p1 --ignore-whitespace < mruby_build.patch && make" 

