#
# Cookbook Name:: volume-groups
# Recipe:: default
#
# Copyright (C) 2015 Dave Tashner
#
# All rights reserved - Do Not Redistribute
#

# Create appvg/optvg filesystems
template "/tmp/vg_create.sh" do
	action :create
	source "vg_create.sh.erb"
end

script "/tmp/vg_create.sh" do
	interpreter "bash"
	user "root"
	cwd "/tmp"
	code "bash vg_create.sh"
end
