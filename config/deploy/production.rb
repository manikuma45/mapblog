server '18.178.18.180', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/tatsuyamatsuhashi/.ssh/id_rsa'
'