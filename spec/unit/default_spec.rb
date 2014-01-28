require 'chefspec'
require 'chefspec/berkshelf'

describe 'rackspace_memcached::default' do
  let(:chef_run) { ChefSpec::Runner.new }

    before do
      Fauxhai.mock(platform: 'ubuntu', version: '12.04') do |node|
      # examples show I could set node[memory][total] here but it doesn't work
      end
    end

  
  it 'should install memcached' do
    @runner = chef_run.converge(described_recipe)
    @runner.should install_package 'memcached'
  end
end

#Test that your config template get placed in the correct location, with the correct modes and the correct content.


#Test that any "logic" or "conditionals" work as expected.
#Tests that you are enabling services.
#You may add additional tests that checks the content in your templates.
