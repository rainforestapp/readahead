worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 25
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined?(ActiveRecord::Base) 
    ActiveRecord::Base.connection.disconnect!
  end

  sleep 1
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    QC::Conn.connection = ActiveRecord::Base.connection.raw_connection
  end
end
