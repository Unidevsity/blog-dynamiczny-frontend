server '161.35.210.105', port: 22, user: 'deploy', roles: %w[app db web], primary: true

set :state, :development
set :branch, 'dev'







