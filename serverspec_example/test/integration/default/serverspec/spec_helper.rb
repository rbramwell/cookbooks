require 'serverspec'

set :backend, :exec

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin:/bin:/usr/bin:/opt/chef/embedded:/opt/chef/embedded/bin'
  end
end

#Define packages
Packages = {
  'git' => {
    version: '1.7.1'
  },
  'httpd' => {
    version: '2.2.15'
  },
  'jenkins' => {
    version: '1.616'
  }
}

#Define gems
Gems = {
  'bundler' => {
    type: 'gem',
    version: '1.7.2'
  },
  'chef' => {
    type: 'gem',
    version: '12.0.3'
  }
}