# encoding: UTF-8
require 'spec_helper'

# This tests the configfile recipe
  describe 'kitchen-docs::default' do
	let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

	# ChefSpec doesn't run real commands, so we stub them here
	it 'creates root\'s .ssh directory' do
		expect(chef_run).to create_directory('/root/.ssh')
	end

	it 'creates root\'s known_hosts file' do
		expect(chef_run).to render_file('/root/.ssh/known_hosts')
	end

	it 'creates root\'s .ssh directory' do
		expect(chef_run).to create_directory('/root/.ssh')
	end

	it 'downloads nodejs package' do
		expect(chef_run).to create_remote_file('/tmp/node.tar.gz')
	end

	it 'extracts nodejs package' do
		expect(chef_run).to run_execute('tar -zxvf /tmp/node.tar.gz -C /opt/node')
	end

	it 'installs kitchen package dependencies' do
		expect(chef_run).to install_package('git')
		expect(chef_run).to install_package('ruby-devel')
		expect(chef_run).to install_package('libxml2')
		expect(chef_run).to install_package('libxml2-devel')
		expect(chef_run).to install_package('libxslt-devel')
		expect(chef_run).to install_package('gcc-c++')
	end

	it 'installs Nokogiri' do
		expect(chef_run).to run_execute('opt/chef/embedded/bin/gem install nokogiri -- --use-system-libraries=true --with-xml2-include=/usr/include/libxml2/')
	end

	it 'installs gems' do
  		expect(chef_run).to install_gem_package("bootstrap-sass")
  		expect(chef_run).to install_gem_package("bundler")
  		expect(chef_run).to install_gem_package("markdown-server")
  		expect(chef_run).to install_gem_package("middleman")
  		expect(chef_run).to install_gem_package("middleman-livereload")
  		expect(chef_run).to install_gem_package("middleman-syntax")
  		expect(chef_run).to install_gem_package("pry")
  		expect(chef_run).to install_gem_package("redcarpet")
  		expect(chef_run).to install_gem_package("slim")
  		expect(chef_run).to install_gem_package("therubyracer")  
	end


	it 'creates the kitchen-docs Gemfile for Bundler' do
		expect(chef_run).to render_file('/tmp/kitchen-docs/Gemfile')
	end

	it 'installs Bundler for Chef' do
  		expect(chef_run).to install_chef_gem("bundler")
  	end

	it 'installs gem dependencies with Bundler' do
		expect(chef_run).to run_execute('/usr/local/bin/bundle install')
	end

	it 'runs Middleman' do
		expect(chef_run).to run_execute('/usr/local/bin/bundle exec middleman server -p 11899')
	end

end