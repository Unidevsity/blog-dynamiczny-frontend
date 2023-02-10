server '164.92.248.138', port: 22, user: 'deploy', roles: %w[app db web], primary: true

set :state, :development
set :branch, 'deployment'
