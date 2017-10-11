package 'tree' do
  action [ :install]
end

package 'ntp'

#file '/etc/motd' do
#  content "CHEF Development Workstation Server
#  HOSTNAME: #{node['hostname']}
#  IPADDRESS: #{node['ipaddress']}
#  CPU: #{node['cpu']['0']['mhz']}
#  MEMORY: #{node['memory']['total']}"
#  action :create
#  owner 'root'
#  group 'root'
#end

group 'ITAdmin' do
  gid '2000'
  append true
end

user 'kamal.chauhan' do
  action :create
  manage_home true
  comment 'IT Admin team member'
  home '/home/kamal.chauhan'
  shell '/bin/bash'
  uid '2000'
  gid '2000'
end

template '/etc/motd' do
  source 'motd.erb'
  action :create
end
