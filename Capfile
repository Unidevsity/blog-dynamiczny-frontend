require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/rvm"
require "capistrano/bundler"
require "capistrano/rails/migrations"
require "capistrano/rails/console"
require "capistrano/rails"
require "capistrano/rake"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
require "capistrano/puma"
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Systemd

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
