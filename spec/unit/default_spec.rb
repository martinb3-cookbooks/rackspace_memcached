# encoding: utf-8

require 'chefspec'
require 'chefspec/berkshelf'

describe 'rackspace_memcached::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04') do |node|
      node.set['memory']['total'] = 100
      node.set['memcached']['config']['port'] = '12345'
      node.set['memcached']['config']['memcachedconf']['-l'] = '127.0.0.1'
    end.converge(described_recipe)
  end

  # check that package is correctly installed
  it 'installs memcached' do
    expect(chef_run).to install_package 'memcached'
  end

  # check config template exists, right modes and owners
  it 'create template file with permissions and ownership' do
    expect(chef_run)
      .to create_template('/etc/memcached.conf')
      .with_owner('memcache')
      .with_group('memcache')
      .with_mode(0440)
  end

  it 'populate config template with correct values' do
    expect(chef_run)
      .to render_file('/etc/memcached.conf')
      .with_content('-m 75')
      .with_content('-p 12345')
      .with_content('-l 127.0.0.1')
  end

  # check service is enabled on boot
  it 'start memcached service' do
    expect(chef_run).to enable_service('memcached')
    expect(chef_run).to start_service('memcached')
  end
end
