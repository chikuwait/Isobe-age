socket = "/var/run/criu_service.socket"
images = "/tmp/dump_test"
log = "restore.log"
pid = ENV["PID"].to_i

p c = CRIU.new
p c.set_pid pid
p c.set_images_dir images
p c.set_service_address socket
p c.set_log_file log
p c.set_shell_job true
p c.restore
