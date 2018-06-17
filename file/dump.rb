socket = "/var/run/criu_service.socket"
images = "/tmp/dump_test"
log = "dump.log"

c = CRIU.new
c.set_images_dir images
c.set_service_address socket
c.set_log_file log
c.set_shell_job true

pid = Process.fork do
  context = Seccomp.new(default: :allow) do |rule|
    rule.trace(:setsockopt, 0)
  end
  context.load



Exec.execve({:APACHE_LOCK_DIR => "/home/vagrant/var/lock/apache2/$SUFFIX", :APACHE_RUN_USER => "www-data",:APACHE_RUN_GROUP => "www-data",:APACHE_LOG_DIR => "/home/vagrant/var/log/apache2$SUFFIX",:APACHE_PID_FILE => "/home/vagrant/var/run/apache2/apache2$SUFFIX.pid"}, "/usr/sbin/apache2", "-k","start")
end

ret = Seccomp.start_trace(pid) do |syscall, _pid, ud|
  name = Seccomp.syscall_to_name(syscall)
  puts "[#{_pid}]: syscall #{name}(##{syscall}) called. (ud: #{ud}), dump the process image."
  c.set_pid _pid
  c.dump
  puts "the pid of process image is #{_pid} into #{images} dir."
end
