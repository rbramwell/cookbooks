#Install dependencies and development tools
%w{gcc ruby-devel libxml2 libxml2-devel libxslt libxslt-devel}.each do |pkgs|
  package pkgs do
    action :install
    notifies :run, "execute[install_java]", :immediately
  end
end

execute "install_java" do
  action :nothing
  command "yum install java -y"
end