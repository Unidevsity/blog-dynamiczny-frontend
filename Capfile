require "capistrano/setup"
require "capistrano/deploy"
install_plugin Capistrano::SCM::Git
require "capistrano/rvm"
require "capistrano/bundler"
require 'capistrano/rails'
require "capistrano/rails/migrations"
require "capistrano/puma"
require "capistrano/rails/console"
require "capistrano/rake"

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
