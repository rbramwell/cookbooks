require 'spec_helper'

describe package('ruby-devel'), :if => os[:family] == 'redhat'  do
	it { should be_installed }
end

describe file('/root/.ssh') do
  it { should be_directory }
end