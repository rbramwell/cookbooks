#
# Cookbook Name:: serverspec_example
# Recipe:: default
#
# Copyright 2015, SingleStone
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'serverspec_example::yum_dependencies'

%w{bundler chef}.each do |gems|
  chef_gem gems do
   action :install
   compile_time false
  end
end

%w{git httpd}.each do |pkg|
  package pkg do
    action :install
  end
end

remote_file '/etc/yum.repos.d/jenkins.repo' do
  notifies :run, 'execute[import_jenkins_repo]', :immediately
  source 'http://pkg.jenkins-ci.org/redhat/jenkins.repo'
end

execute 'import_jenkins_repo' do
  action :nothing
  command "rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key"
end

package 'jenkins' do
  action :install
end

file '/var/www/html/index.html' do
  action :create
  content 'Hello World!'
  group 'apache'
  mode 00755
  owner 'apache'
end

%w{httpd jenkins}.each do |svc|
  service svc do
    action :start
  end
end


