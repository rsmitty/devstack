#
# Cookbook Name:: sickbeard
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"

directory "/home/pi" do
  owner "pi"
  group "pi"
  action :create
end

directory "/var/run/sickbeard" do
  owner "pi"
  group "pi"
  action :create
end

git "/home/pi/.sickbeard" do
  repository "git://github.com/midgetspy/Sick-Beard.git"
  reference "master"
  action :sync
end

directory "/home/pi/.sickbeard" do
  owner "pi"
  group "pi"
  recursive true
end

cookbook_file "/home/pi/.sickbeard/config.ini" do
  source "config.ini"
  mode 0644
  owner "pi"
  group "pi"
end

cookbook_file "/etc/init.d/sickbeard" do
  source "sickbeard.init"
  mode 0755
  owner "root"
  group "root"
end

cookbook_file "/etc/default/sickbeard" do
  source "sickbeard.default"
  mode 0644
  owner "root"
  group "root"
end

package "python-cheetah" do
  action :install
end

service "sickbeard" do
  action [ :start, :enable ]
end
