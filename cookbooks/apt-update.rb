execute "apt -y update" do
  user "root"
end
execute "apt -y install libprotobuf-dev libprotobuf-c0-dev protobuf-c-compiler protobuf-compiler python-protobuf" do
  user "root"
end
