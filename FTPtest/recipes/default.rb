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


#include_recipe ""