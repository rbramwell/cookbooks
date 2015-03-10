require 'spec_helper'
 
describe file('/root/.ssh'), :if => os[:family] == 'redhat' do
                it { should be_directory }
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode 755}
end
 
describe file('/root/.ssh/known_hosts'), :if => os[:family] == 'redhat' do
                it { should be_file }
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode 644 }
                it { should contain('github.com').before(/^end/) }
end
 
describe package('gcc-c++'), :if => os[:family] == 'redhat' do
                it { should be_installed }
end
 
describe package('git'), :if => os[:family] == 'redhat' do
                it { should be_installed }
end
 
describe package('libxml2'), :if => os[:family] == 'redhat' do
                it { should be_installed }
end
 
describe package('libxml2-devel'), :if => os[:family] == 'redhat' do
                it { should be_installed }
end
 
describe package('libxslt-devel'), :if => os[:family] == 'redhat' do
                it { should be_installed }
end
 
describe package('nc'), :if => os[:family] == 'redhat' do
                it { should be_installed }
end
 
describe package('ruby-devel'), :if => os[:family] == 'redhat' do
                it { should be_installed }
end
 
describe package('bootstrap-sass'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('3.3.3') }
end
 
describe package('bundler'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('1.7.2') }
end
 
describe package('markdown-server'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('0.1.1') }
end
 
describe package('middleman'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('3.3.10') }
end
 
describe package('middleman-livereload'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('3.4.2') }
end
 
describe package('middleman-syntax'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('2.0.0') }
end
 
describe package('nokogiri'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('1.6.6.2') }
end
 
describe package('pry'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('0.10.1') }
end
 
describe package('redcarpet'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('3.2.2') }
end
 
describe package('slim'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('3.0.2') }
end
 
describe package('therubyracer'), :if => os[:family] == 'redhat' do
                it { should be_installed.by('gem').with_version('0.12.1') }
end
 
describe file('/root/.ssh/config'), :if => os[:family] == 'redhat' do
                it { should be_file }
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode 644 }
                it { should contain('Host github.com').before(/^end/) }
                it { should contain('StrictHostKeyChecking no').after(/^Host github.com/) }
end
 
describe file('/tmp/kitchen-docs'), :if => os[:family] == 'redhat' do
                it { should be_directory }
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode 755 }
end
 
describe file('/tmp/kitchen-docs/Gemfile'), :if => os[:family] == 'redhat' do
                it { should be_file }
                it { should be_owned_by 'root' }
                it { should be_grouped_into 'root' }
                it { should be_mode 644 }
                it { should contain("source 'https://rubygems.org'").before(/^end/) }
                it { should contain(":platforms => [:mswin, :mingw]").before(/^end/) }
end

describe host('rubygems.org'), :if => os[:family] == 'redhat' do
                it { should be_reachable.with( :port => 443, :proto => 'tcp' ) }
end

describe service('middleman'), :if => os[:family] == 'redhat' do
                it {should be_running}
end