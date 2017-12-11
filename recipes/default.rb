#
# Cookbook:: rpm-install
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

libname = "postgresql94-libs-9.4.15-1PGDG.rhel7.x86_64.rpm"
lib_checksum = "78423a172f97b8b9188362996172e7a6994b9561a2a873d58d1e75f91e885d34"
cookbook_file "/tmp/#{libname}" do
  source "#{libname}"
  checksum "#{lib_checksum}"
end

package "postgresql94-libs" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{libname}"
end

filename = "postgresql94-9.4.15-1PGDG.rhel7.x86_64.rpm"
file_checksum = "a20a420f72941b6974e01aa58d5348242c6f1459138615849993c2a523df3631"

cookbook_file "/tmp/#{filename}" do
  source "#{filename}"
  checksum "#{file_checksum}"
end

package "postgresql94" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{filename}"
end

servername = "postgresql94-server-9.4.15-1PGDG.rhel7.x86_64.rpm"
server_checksum = "34694919c911e73ab8f172b055892cffdf221e029d563241a502ee25dde55789"

cookbook_file "/tmp/#{servername}" do
  source "#{servername}"
  checksum "#{server_checksum}"
end

package "postgresql94-server" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{servername}"
end

