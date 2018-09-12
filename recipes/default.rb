#
# Cookbook:: postfix_redis
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'postfix'
package 'epel-release'
package 'redis'
package 'python-redis'

service 'postfix' do
  action [ :enable, :start ]
end

service 'redis' do
  action [ :enable, :start ]
end

cookbook_file "/etc/postfix/main.cf" do
  source "main.cf"
  mode "0644"
end

include_recipe 'postfix_redis::postfix-virtual'
include_recipe 'postfix_redis::postfix-user'
include_recipe 'postfix_redis::postfix-forward'
