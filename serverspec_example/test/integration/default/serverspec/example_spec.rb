require 'spec_helper'

#Verify packages
Packages.each do |name, details|
  describe package(name) do
    it { should be_installed.with_version(details[:version]) }
  end
end

#Verify Gems
Gems.each do |name, details|
  describe package(name) do
    it { should be_installed.by(details[:type]).with_version(details[:version]) }
  end
end

#Verify files
describe file('/var/www/html/index.html') do
  it { should be_file }
  it { should be_owned_by 'apache' }
  it { should be_grouped_into 'apache' }
  it { should be_mode 755 }
  it { should contain('Hello World!').before(/^end/) }
end

#Verify services
%w{httpd jenkins}.each do |svc|
  describe service(svc) do
    it { should be_running }
  end
end

#Verify ports
%w{80 8080}.each do |ports|
  describe port(ports) do
    it { should be_listening }
  end
end