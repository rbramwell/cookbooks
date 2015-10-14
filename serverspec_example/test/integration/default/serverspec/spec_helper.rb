require 'serverspec'

set :backend, :exec

RSpec.configure do |c|
  c.before :all do
    c.path = '/opt/chef/embedded:/opt/chef/embedded/bin:/sbin:/usr/sbin:/bin:/usr/bin'
  end
end

#Define packages
Packages = {
  'git' => {
    version: '1.8.3'
  },
  'httpd' => {
    version: '2.4.6'
  },
  'jenkins' => {
    version: '1.633'
  }
}

#Define gems
Gems = {
  'bundler' => {
    type: 'gem',
    version: '1.10.7.depsolverfix.0'
  },
  'chef' => {
    type: 'gem',
    version: '12.5.1'
  }
}