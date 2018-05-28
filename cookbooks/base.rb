%w(apt-update.rb rbenv::system ruby_build.rb criu.rb).each do |resource|
  include_recipe "#{resource}"
end
