server '161.35.210.105', port: 22, user: 'deploy', roles: %w[app db web], primary: true

set :state, :development
set :application, 'blog'
set :branch, 'dev'
set :user, 'deploy'
set :puma_threads, [4, 16]
set :puma_workers, 0

set :pty, true
set :use_sudo, false
set :stage, :production
set :deploy_via, :remote_cache
set :deploy_to, '/var/www/#{fetch(:application)}'
set :puma_role, :app
set :puma_bind,       ["unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock", 'tcp://0.0.0.0:5000']
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

set :linked_files, fetch(:linked_files, []).push(
                                                 'master.key',
                                                 )
set :linked_dirs, fetch(:linked_dirs, []).push('log',
                                               'tmp/pids',
                                               'tmp/cache',
                                               'tmp/sockets',)

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do

      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
      puts "Puma shared dirs created"
    end
  end

end

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke "puma:make_dirs"
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

end
