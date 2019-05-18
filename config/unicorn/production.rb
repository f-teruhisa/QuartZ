# numbers of worker
  $worker  = 2
# timout seconds
  $timeout = 30
# app mame
  $app_dir = "/var/www/QuartZ/current"
# port number
  $listen  = File.expand_path 'tmp/sockets/.unicorn.sock', $app_dir
# directory for management PID files
  $pid     = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
# directory error log
  $std_log = File.expand_path 'log/unicorn.log', $app_dir

# define tasks
  worker_processes  $worker
  working_directory $app_dir
  stderr_path $std_log
  stdout_path $std_log
  timeout $timeout
  listen  $listen
  pid $pid

# settings hotd deploy
  preload_app true

# process before fork
  before_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
    old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
      begin
        Process.kill "QUIT", File.read(old_pid).to_i
      rescue Errno::ENOENT, Errno::ESRCH
      end
    end
  end

# process after fork
  after_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
  end
