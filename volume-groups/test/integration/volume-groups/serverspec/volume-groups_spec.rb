require 'spec_helper'
 
describe file('/root/block_device1') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644}
end

describe file('/etc/lvm/backup/appvg') do
	it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 600 }
    it { should contain('RESIZEABLE').before(/^end/) }
    it { should contain('/dev/loop0').before(/^end/) }
end

describe file('/root/block_device2') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
end

describe file('/etc/lvm/backup/optvg') do
	it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 600 }
    it { should contain('RESIZEABLE').before(/^end/) }
    it { should contain('/dev/loop1').before(/^end/) }
end