workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

port ENV['PORT'] || 3000
environment ENV['RAILS_ENV'] || "production"

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

worker_timeout 3600