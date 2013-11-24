#
# Cookbook Name:: devstack
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"

install_path = node["devstack"]["install_path"]
install_user = node["devstack"]["user"]

#Clone DevStack git repo
git install_path do
  repository "https://github.com/openstack-dev/devstack.git"
  action :sync
  user install_user
end

#Create localrc in install directory, so installer won't prompt for passwords.
template "#{install_path}/localrc" do
  source "localrc.erb"
  user install_user
  variables({
    :admin_pass => node[:devstack][:localrc][:admin_password],
    :mysql_pass => node[:devstack][:localrc][:mysql_password],
    :rabbit_pass => node[:devstack][:localrc][:rabbit_password],
    :serv_pass => node[:devstack][:localrc][:service_password],
    :log_path => node[:devstack][:localrc][:log_path],
    :screen_log_path => node[:devstack][:localrc][:screen_log_path]
  })
end

#Run installer only if DevStack isn't already installed in /opt/stack
execute "#{install_path}/stack.sh" do
  user install_user
  not_if {File.exists?("/opt/stack")}
end
