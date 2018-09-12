template '/etc/postfix/virtual' do
  source 'virtual_aliases.erb'
  variables(
      :hostname => node[:hostname]
  )
  notifies :restart, 'service[postfix]'
end
