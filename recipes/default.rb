#
# Cookbook Name:: rackspace_memcached
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#file "/tmp/something" do
#  owner "root"
#  group "root"
#  mode "0755"
#  action :create
#end

package "memcached" do
  action :install
end

template "/etc/memcached.conf" do
  source "memcached.conf.erb"
  mode 0440
  owner "memcache"
  group "memcache"
  variables({
    'memcached_port' => node['memcached']['config']['port'],
    'memcached_memory' => node['memcached']['config']['memory'],
    'memcached_maxconnections' => node['memcached']['config']['maxconnections'],
    'memcached_memcachedconf' => node['memcached']['config']['memcachedconf']
  })
end

service "memcached" do
  action [:enable, :start]
end

