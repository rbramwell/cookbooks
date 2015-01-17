#
# Cookbook Name:: kitchen-docs
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#chef_pkg_url = "#{node[:kitchen][:chef][:url]}"
#chef_pkg = "#{node[:kitchen][:chef][:package]}"

js_runtime = "#{node[:kitchen][:javascript][:runtime][:url]}"
js_runtime_pkg = "#{node[:kitchen][:javascript][:runtime][:package]}"
repo = "#{node[:kitchen][:docs][:repo]}"

directory "/root/.ssh" do
	action :create
end

cookbook_file "/root/.ssh/known_hosts" do
	action :create
	source "known_hosts"
end

#remote_file chef_pkg do
#	action :create
#	source chef_pkg_url
#end

#rpm_package chef_pkg do
#end

node[:kitchen][:packages].each do |pkg|
	package pkg do
	action :install
end
end

node[:gem_hash].each do |k,v|
	gem_package k do
	action :install
end
end

#execute "download code" do
#	cwd "/tmp/" 
#	command "git clone https://github.com/test-kitchen/kitchen-docs.git"
#	not_if { File.exists?("/tmp/kitchen-docs/Gemfile")}
#end

cookbook_file ::File.join( ENV['HOME'], '.ssh', 'config' ) do
  mode 0644
end

git "/tmp/kitchen-docs" do
	repository repo
	reference "master"
	action :checkout
end

cookbook_file "/tmp/kitchen-docs/Gemfile" do
	source "Gemfile"
	action :create
end

execute "Execute Bundler Install" do
	cwd "/tmp/kitchen-docs"
	command "/opt/chef/embedded/bin/bundle install"
end

execute "Run Middleman Server" do
	cwd "/tmp/kitchen-docs"
	command "/opt/chef/embedded/bin/bundle exec middleman server -p 11899"
end