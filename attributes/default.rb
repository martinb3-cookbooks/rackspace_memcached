default['memcached']['config']['port'] = '11211'
default['memcached']['config']['memory'] = (node[:memory][:total].to_i * 0.75 / 1000).to_i;
default['memcached']['config']['maxconnections'] = '1024'
