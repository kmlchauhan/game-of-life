#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'httpd' do
  action [ :install ]
end 

#file '/var/www/html/index.html' do
#  content "<h1>Hello World!</h1>
#  <h2>IPADDRESS: #{node['ipaddress']}</h2>
#  <h2>HOSTNAME: #{node['hostname']}</h2>"
#end

remote_file '/var/www/html/chef.png' do
  source 'https://upload.wikimedia.org/wikipedia/en/5/56/Chef_Software_Inc._company_logo.png'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
#  notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  action [ :enable, :start ]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

