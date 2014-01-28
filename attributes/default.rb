# encoding: utf-8

default['memcached']['config']['port'] = '11211'
pcmemory = node['memory']['total'] * 0.75 / 1000
default['memcached']['config']['memory'] = pcmemory.to_i
default['memcached']['config']['maxconnections'] = '1024'
default['memcached']['config']['memcachedconf'] = {}
