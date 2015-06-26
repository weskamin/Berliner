#BerlinRecipeTraining
package "ftp" do
case node[:platform_family]
when "rhel"
	package_name "vsftpd"
when "debian"
	package_Name "vsftpd"
end
action:install
end

template "/etc/vsftpd.conf" do
  source 'vsftpd.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :run, resources(:bash => 'restart_vsftpd')
end



#include_recipe ""