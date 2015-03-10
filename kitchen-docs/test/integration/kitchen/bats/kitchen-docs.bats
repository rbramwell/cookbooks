#!/usr/bin/env bats

@test "/root/.ssh directory exists" {
	run stat /root/.ssh
	[ "$status" -eq 0 ]
}

@test "root's known_hosts exists" {
	run cat /root/.ssh/known_hosts
}

@test "packages are installed" {
	run which git && which ruby-devel && which libxml2 && which libxml2-devel && which libxslt-devel && which gcc-c++
	[ "$status" -eq 0 ]
}

@test "Nokogiri is installed" {
	run /opt/chef/embedded/bin/gem list nokogiri -i
}

@test "SSH config file exists for root" {
	run cat /root/.ssh/config
	[ "$status" -eq 0 ]
}

@test "git repository has been cloned" {
	run cat /tmp/kitchen-docs/.git/config
	[ "$status" -eq 0 ]
}


@test "Gemfile exists for Kitchen Docs" {
	run cat /tmp/kitchen-docs/Gemfile
	[ "$status" -eq 0 ]
}