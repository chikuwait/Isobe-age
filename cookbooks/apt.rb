execute "apt -y update" do
  user "root"
end
execute "apt -y install asciidoc libprotobuf-dev libprotobuf-c0-dev protobuf-c-compiler protobuf-compiler python-protobuf libnet1-dev libnl-3-dev libcap-dev" do  
  user "root"
end
