#BerlinRecipeTraining
package "ftp" do
case node[:platform_family]
when "rhel"
	package_name "vsftpd"
when "debian"
	package_name "vsftpd"
end
action:install
end

template "/etc/vsftpd.conf" do
  source 'vsftpd.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[vsftpd]', :immediately
end

# service 'vsftpd' do
#   if node["platfrom"] == "ubuntu" && node["platform_version"].to_f >= 14.04
#     provider Chef::Provider::Service::Upstart
#   end
#   service_name value_for_platform_family(
#     'rhel' => 'vsftpd',
#     'debian' => 'vsftpd'
#   )
#   action :enable
# end

#include_recipe ""

service "vsftpd" do
  if node["platfrom"] == "ubuntu" && node["platform_version"].to_f >= 14.04
    provider Chef::Provider::Service::Upstart
  end
  action [ :enable, :start ]
  supports :restart => true
end


