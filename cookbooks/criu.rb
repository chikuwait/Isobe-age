package "criu" do
end
remote_file "/etc/profile.d/criu.sh" do
  source "../file/criu.sh"
end
directory "/tmp/dump_test" do
end
