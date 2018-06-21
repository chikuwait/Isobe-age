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


exec "/usr/sbin/apache2","-k","start","-f","/etc/apache2/apache2.conf"
end

ret = Seccomp.start_trace(pid) do |syscall, _pid, ud|
  name = Seccomp.syscall_to_name(syscall)
  puts "[#{_pid}]: syscall #{name}(##{syscall}) called. (ud: #{ud}), dump the process image."
  p c.set_pid _pid
  p c.dump
  puts "the pid of process image is #{_pid} into #{images} dir."
end
